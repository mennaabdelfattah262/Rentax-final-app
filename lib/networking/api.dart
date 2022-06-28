import 'dart:convert';
import 'package:http/http.dart' as http;


var baseURL;
var headers;

class AuthServices {
  static Future<http.Response> register(
      String firstName,String lastName, String email, String password, String phone,) async {
    Map data = {
      "first name": firstName,
      "last name" : lastName,
      "phone" : phone,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/RegisterController@register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL + '/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}