///queries interface

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiProvider {
  ///get items for the ribbon
  Future<List<dynamic>> getRibbonItemList() async {
    try {
      final response = await http.get(
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=A2GYvJg5WAHHNf76pIzpNlzYFpFwDjfq',
      );

      if (response.statusCode == 200) {
        return (json.decode(
          response.body,
        ))['results'];
      } else {
        print("error: fetching from nytimes ..., ${response.statusCode}");
      }
    } catch (e) {
      print("error: getRibbonItemList ..., ${e.toString()}");
    }
    return null;
  }
}
