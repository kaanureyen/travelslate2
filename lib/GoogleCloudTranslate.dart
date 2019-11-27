import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleCloudTranslate {
  String _apiKey;
  String _url = 'https://translation.googleapis.com/language/translate/v2';

  void setApiKey(String s) {
    _apiKey = s;
  }

  Future<dynamic> translate(String text,
      {@required String from, @required String to}) async {
    String body = json.encode({
      'q': text,
      'source': from,
      'target': to,
    });
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization:': 'Bearer $_apiKey',
      'Accept': 'application/json',
    };

    return http
        .post(_url, body: body, headers: headers)
        .then((res) => json.decode(res.body));
  }
}
