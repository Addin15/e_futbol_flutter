import 'dart:convert';
import 'dart:developer';

import 'package:e_futbol_flutter/config/config.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:http/http.dart';

class ArenaController {
  static search({
    required String query,
  }) async {
    String url = hostName + api + '/search/$query/';

    var response = await get(
      Uri.parse(url),
      headers: headersWithoutToken(),
    );

    if (response.statusCode == 200) {
      List arenas = jsonDecode(response.body);
      return arenas
          .map((arena) => Arena.fromMap(arena as Map<String, dynamic>))
          .toList();
    }

    return [];
  }
}