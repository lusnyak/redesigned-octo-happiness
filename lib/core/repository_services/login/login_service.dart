import 'package:test_app_flutter/core/models/login/login/logged_model.dart';

abstract class LoginService {
  Future<LoggedModel> login(String email, String password);
}