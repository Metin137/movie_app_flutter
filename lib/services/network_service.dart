import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  static NetworkService? _instace;
  static NetworkService get instance {
    if (_instace != null) _instace!;

    _instace = NetworkService._init();
    return _instace!;
  }

  NetworkService._init();

  final baseUrl = "https://imdb-api.com/en/API/";
  String token = "/k_34yeuvl9";

  Future<Map<dynamic, dynamic>> apiGet(String endpoint) async {
    try {
      final response = await get(Uri.parse(baseUrl + endpoint + token));

      final all = await jsonDecode(response.body);

      return all;
    } catch (e) {
      print("e ");
      return {};
    }
  }
}
