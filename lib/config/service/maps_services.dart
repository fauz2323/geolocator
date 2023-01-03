import 'dart:io';

import 'package:http/http.dart' as http;

import 'api.dart';

class MapsService {
  //getData http dart
  static Future<http.Response> getData() async {
    try {
      var data = await http.get(Api.coordinate).timeout(
            const Duration(seconds: 10),
            onTimeout: () => http.Response('TimeOut', 500),
          );
      return data;
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
