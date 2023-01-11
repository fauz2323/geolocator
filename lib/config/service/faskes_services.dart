import 'package:http/http.dart' as http;

import 'api.dart';

class FaskesService {
  static Future getCategory<Response>() async {
    try {
      var dataCategory = await http.get(Api.allCategory).timeout(
            const Duration(seconds: 10),
            onTimeout: () => http.Response('TimeOut', 500),
          );
      return dataCategory;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future getFaskes<Response>() async {
    try {
      var dataFaskes = await http.get(Api.allFaskes).timeout(
            const Duration(seconds: 10),
            onTimeout: () => http.Response('TimeOut', 500),
          );
      return dataFaskes;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  static Future<http.Response> getFaskesById(int id) async {
    try {
      var detail = await http
          .get(
            Uri.parse('${Api.faskesById}/$id'),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => http.Response('TimeOut', 500),
          );
      return detail;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
