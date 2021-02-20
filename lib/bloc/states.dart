///стейты
import 'package:flutter/foundation.dart';
import 'package:nytimes/models/repo.dart';

abstract class AppStates {}

class RepoErrorState extends AppStates {}

class RepoEmptyState extends AppStates {}

class RepoLoadingState extends AppStates {}

class RepoLoadedState extends AppStates {
  String searchValue;
  List<Repo> repos;

  RepoLoadedState({
    @required this.searchValue,
    @required this.repos,
  }) : assert(repos != null);
}
