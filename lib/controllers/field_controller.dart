import 'dart:convert';
import 'dart:developer';

import 'package:e_futbol_flutter/config/config.dart';
import 'package:e_futbol_flutter/models/booking.dart';
import 'package:http/http.dart';

class FieldController {
  static getAvailability(String fieldID, String bookDate) async {
    String url = hostName + api + '/fields/availability';

    var response = await post(
      Uri.parse(url),
      body: jsonEncode({
        'book_date': bookDate,
        'field_id': fieldID,
      }),
      headers: headersWithoutToken(),
    );

    if (response.statusCode == 200) {
      List arenas = jsonDecode(response.body);
      return arenas
          .map((arena) => Booking.fromMap(arena as Map<String, dynamic>))
          .toList();
    }

    return <Booking>[];
  }
}
