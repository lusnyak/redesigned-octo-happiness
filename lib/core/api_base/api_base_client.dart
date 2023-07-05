import 'dart:convert';
import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_logging.dart';
import 'api_response.dart';

class ApiBaseClient {
  final dio = Dio(
    BaseOptions(
      baseUrl: APIBase.url,
      contentType: HeaderValues.applicationJsonCharsetUtf8,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 30),
    ),
  )..interceptors.add(ApiLogging());

  ApiResponse handledResponse(Response response) {
    ApiResponse apiResponse = ApiResponse.from(response);
    if (response.statusCode == 200) {
      return apiResponse;
    } else {
      if (response.data is Map) {
        ApiError err = ApiError.fromJson(response.data);
        throw err;
      }
      throw ApiError.warning();
    }
  }

  handleCatchError(e) {
    if (e.response?.data is Map) {
      ApiError apiError = ApiError.fromJson(e.response?.data);
      throw apiError;
    } else {
      throw ApiError.warning();
    }
  }

  Future<ApiResponse> postRequest(
    String endPoint, {
    Map<String, String>? params,
    Map<String, dynamic>? body,
  }) async {
    final jsonParameters = body != null ? jsonEncode(body) : null;
    return await dio
        .post("${APIBase.version}$endPoint", data: jsonParameters, queryParameters: params)
        .then(handledResponse)
        .catchError(handleCatchError);
  }
}
