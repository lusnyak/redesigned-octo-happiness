import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiResponse {
  int? statusCode;
  dynamic data;

  ApiResponse({this.statusCode, this.data});

  ApiResponse.from(Response? response) {
    debugPrint("ApiResponse");
    statusCode = response?.statusCode;
    data = response?.data;
  }
}

class ApiError implements Exception {
  String? name;
  String? message;
  int? status;

  ApiError({this.name, this.message, this.status = 1001});

  ApiError.fromJson(Map<String, dynamic> json) {
    debugPrint("ApiError");
    status = json.containsKey("status") ? json["status"] : 1001;
    message = json.containsKey("message") ? json["message"] : "";
    name =
    json.containsKey("name") ? json["name"] : null;
  }

  ApiError.warning() {
    status = 400;
    message = "Something went wrong";
    name= "Warning";
  }
}