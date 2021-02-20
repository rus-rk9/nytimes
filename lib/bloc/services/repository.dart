///обертка над интерфейсом запросов

import 'package:flutter/material.dart';
import 'package:nytimes/bloc/services/api.dart';
import 'package:nytimes/models/repo.dart';

class AppRepository {
  ApiProvider api = ApiProvider();

  ///получение репозиториев
  Future<List<Repo>> getRepos({
    @required String searchValue,
    @required String currentLocale,
  }) async {
    if (currentLocale != "") {
      List<dynamic> result = await api.getRepoList(searchValue: searchValue);
      if (result != null) {
        return result
            .map((json) => Repo.fromJSON(json, currentLocale))
            .toList();
      } else {
        print("api.getRepoList returned null");
      }
    } else {
      print("error: locale have not got yet");
    }
    return null;
  }
}
