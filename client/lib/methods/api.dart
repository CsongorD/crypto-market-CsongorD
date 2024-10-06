import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class API {
  postRequest(
      {required String route, required Map<String, String> data}) async {
    String host = "";
    if (defaultTargetPlatform == TargetPlatform.android) {
      host = '10.0.2.2';
    } else {
      host = "localhost";
    }

    String url = 'http://$host:8000/api$route';

    var parsedUrl = Uri.parse(url);
    var response =
        await http.post(parsedUrl, body: jsonEncode(data), headers: _header());
    return response;
  }
  putRequest(
      {required String route, required Map<String, Object?> data}) async {
    String host = "";
    if (defaultTargetPlatform == TargetPlatform.android) {
      host = '10.0.2.2';
    } else {
      host = "localhost";
    }

    String url = 'http://$host:8000/api$route';
    var parsedUrl = Uri.parse(url);
    var response =
        await http.put(parsedUrl, body: jsonEncode(data), headers: _header());
    return response;
  }
  getUser({required int userId}) async {
    String host = "";
    if (defaultTargetPlatform == TargetPlatform.android) {
      host = '10.0.2.2';
    } else {
      host = "localhost";
    }
    String url = 'http://$host:8000/api/users/$userId';
    var parsedUrl = Uri.parse(url);
    var response = await http.get(parsedUrl);
    return response;
  }

  _header() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
