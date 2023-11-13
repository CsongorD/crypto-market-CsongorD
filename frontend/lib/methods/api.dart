import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  postRequest(
      {required String route, required Map<String, String> data}) async {
    String url = 'http://localhost:8000/api$route';
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _header());
  }

  putRequest(
      {required String route, required Map<String, Object?> data}) async {
    String url = 'http://localhost:8000/api$route';
    var postUrl = Uri.parse(url);

    return await http.put(postUrl, body: jsonEncode(data), headers: _header());
  }

  _header() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
}
