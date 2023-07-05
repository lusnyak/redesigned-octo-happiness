import 'package:flutter/cupertino.dart';
import 'package:test_app_flutter/core/api_base/api_base_client.dart';
import 'package:test_app_flutter/core/api_base/api_end_point.dart';
import 'package:test_app_flutter/core/api_base/api_response.dart';
import 'package:test_app_flutter/core/models/login/login/logged_model.dart';
import 'package:test_app_flutter/core/repository_services/login/login_service.dart';
import 'package:test_app_flutter/core/utils/shared_preferences_manager.dart';

class LoginServiceImpl implements LoginService {
  final ApiBaseClient _apiBaseClient = ApiBaseClient();

  @override
  Future<LoggedModel> login(String email, String password) async {
    return await _apiBaseClient.postRequest(EndPoint.login,
        body: {"email": email, "password": password}).then((value) {
      if (value.statusCode == 200 && value.data != null) {
        Map<String, dynamic> data = value.data;
        return data;
      }
      return null;
    }).then((value) {
      if (value != null && value.isNotEmpty) {
        LoggedModel loggedModel = LoggedModel.fromJson(value);
        SharedPreferencesManager().token = loggedModel.tokens.access;
        SharedPreferencesManager().userInfo = [loggedModel.user.id.toString(), loggedModel.user.email, loggedModel.user.nickname];
        debugPrint(loggedModel.toJson().toString());
        return loggedModel;
      }
      throw ApiError.warning();
    }).catchError((e){
      ApiError err = e;
      throw err;
    });
  }
}
