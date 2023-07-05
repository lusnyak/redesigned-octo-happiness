abstract class HeaderParameterKeys {
  static const authorization = "Authorization";
  static const contentType = "Content-Type";
  static const accept = "Accept";
  static const userAgent = "User-Agent";
}

abstract class HeaderValues {
  static const applicationJsonCharsetUtf8 = "application/json; charset=utf-8";
  static const applicationFormUrlencoded = "application/x-www-form-urlencoded";
  static const applicationJsonTextPlain = "application/json, text/plain, */*";
}

abstract class APIBase {
  static const url = 'http://45.10.110.181:8080/';
  static const version = '/api/v1';
}
