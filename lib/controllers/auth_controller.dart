import 'dart:convert';
import 'dart:developer';

import 'package:e_futbol_flutter/config/config.dart';
import 'package:http/http.dart';

class AuthController {
  static login({
    required String email,
    required String password,
  }) async {
    String url = hostName + api + '/login';

    var response = await post(
      Uri.parse(url),
      headers: headersWithoutToken(),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return null;
  }

  static register({
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    String url = hostName + api + '/register';

    var response = await post(
      Uri.parse(url),
      headers: headersWithoutToken(),
      body: jsonEncode({
        'username': username,
        'email': email,
        'role': role,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      log(response.body);
      return jsonDecode(response.body);
    }

    return null;
  }

  static logout() {
    return true;
  }
}
