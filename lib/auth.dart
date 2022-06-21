import 'dart:convert';

import 'package:e_futbol_flutter/controllers/auth_controller.dart';
import 'package:e_futbol_flutter/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthService extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  AuthService() {
    initData();
  }

  initData() async {
    Box _userBox = await Hive.openBox('user');
    var userData = _userBox.get('user');

    if (userData != null) {
      User user = User.fromMap(jsonDecode(userData));

      _user = user;
      notifyListeners();
    }
  }

  login({
    required String email,
    required String password,
  }) async {
    dynamic res = await AuthController.login(email: email, password: password);

    if (res != null) {
      Box _userBox = await Hive.openBox('user');
      _userBox.put('user', jsonEncode(res['user']));
      _userBox.put('token', res['token']);

      _user = User.fromMap(res['user']);
      notifyListeners();
    }
  }

  register({
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    dynamic res = await AuthController.register(
      username: username,
      email: email,
      password: password,
      role: role,
    );

    if (res != null) {
      Box _userBox = await Hive.openBox('user');
      _userBox.put('user', jsonEncode(res['user']));
      _userBox.put('token', res['token']);

      _user = User.fromMap(res['user']);
      notifyListeners();
    }
  }

  logout() async {
    bool res = await AuthController.logout();

    if (res) {
      Box _userBox = await Hive.openBox('user');
      await _userBox.clear();
      _user = null;
      notifyListeners();
    }
  }
}
