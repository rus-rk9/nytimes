///интерфейс запросов

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  ///получение репозиториев по строке
  Future<List<dynamic>> getRepoList({
    @required String searchValue,
  }) async {
    try {
      final response = await http.get(
        'https://api.github.com/search/repositories?q=$searchValue&sort=stars&order=desc&per_page=38',
      );

      if (response.statusCode == 200) {
        return (json.decode(response.body))['items'];
      } else {
        print("error: fetching from github ..., ${response.statusCode}");
      }
    } catch (e) {
      print("error: getRepoList ..., ${e.toString()}");
    }
    return null;
  }
}
