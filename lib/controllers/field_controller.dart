import 'dart:convert';
import 'dart:developer';

import 'package:e_futbol_flutter/config/config.dart';
import 'package:e_futbol_flutter/models/booking.dart';
import 'package:e_futbol_flutter/pages/web/consumer/book.dart';
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

  static bookFields(int userID, double amount, List<Prebook> bookings) async {
    String url = hostName + api + '/fields/book';

    Map<String, dynamic> data = {
      'user_id': userID,
      'amount': amount,
      'bookings': bookings.map((book) => book.toMap()).toList(),
    };

    var response = await post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: headersWithoutToken(),
    );

    if (response.statusCode == 201) {
      List arenas = jsonDecode(response.body);
      return arenas
          .map((arena) => Booking.fromMap(arena as Map<String, dynamic>))
          .toList();
    }

    return <Booking>[];
  }
}
