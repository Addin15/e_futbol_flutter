import 'dart:convert';
import 'dart:developer';

import 'package:e_futbol_flutter/config/config.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/models/field.dart';
import 'package:e_futbol_flutter/models/review.dart';
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

  static Future<List<Arena>> get50s() async {
    String url = hostName + api + '/arenas/get';

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

    return <Arena>[];
  }

  static getFields({required String arenaID}) async {
    String url = hostName + api + '/arenas/$arenaID/field';

    var response = await get(
      Uri.parse(url),
      headers: headersWithoutToken(),
    );

    if (response.statusCode == 200) {
      List arenas = jsonDecode(response.body);
      return arenas
          .map((arena) => Field.fromMap(arena as Map<String, dynamic>))
          .toList();
    }

    return <Field>[];
  }

  static getReviews({required String arenaID}) async {
    String url = hostName + api + '/arenas/$arenaID/review';

    var response = await get(
      Uri.parse(url),
      headers: headersWithoutToken(),
    );

    if (response.statusCode == 200) {
      List arenas = jsonDecode(response.body);
      return arenas
          .map((arena) => Review.fromMap(arena as Map<String, dynamic>))
          .toList();
    }

    return <Review>[];
  }
}
