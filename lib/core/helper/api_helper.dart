
import 'dart:convert';

import 'log_helper.dart';

class ApiHelper{

  static const String CONTENT_TYPE = 'Content-Type';
  static const String APPLICATION_JSON = 'application/json';
  static const String AUTHORIZATION = 'Authorization';

  static const String TOKEN_REFRESH = 'UnAuthorized';
  static const String NO_CONNECTIVITY = 'NoConnectivity';

  static const Map<String, String> DEFAULT_HEADER = {
    CONTENT_TYPE: APPLICATION_JSON
  };
  static const String BEARER_KEYWORD = 'Bearer';

  final encoding = Encoding.getByName('utf-8');

  Map<String, String> getHeaders({required String token}) {
    Map<String, String> header;
    if (token.isNotEmpty) {
      header = {
        CONTENT_TYPE: APPLICATION_JSON,
        AUTHORIZATION: '$BEARER_KEYWORD $token',
      };
    } else {
      header = DEFAULT_HEADER;
    }
    LogHelper.log('header>$header');
    return header;
  }

  String getJsonBody(Map<String, dynamic>? map) {
    String jsonBody;
    if (map == null) {
      jsonBody = '';
    } else {
      jsonBody = json.encode(map);
    }
    return jsonBody;
  }

}
