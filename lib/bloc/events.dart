///события блока
import 'package:flutter/material.dart';

abstract class AppEvents {}

///событие на поиск
class RepoSearchEvent extends AppEvents {
  final String searchValue;

  RepoSearchEvent({
    @required this.searchValue,
  });
}
