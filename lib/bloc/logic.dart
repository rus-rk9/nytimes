///блок, логика приложения
import 'package:devicelocale/devicelocale.dart';
import 'package:nytimes/models/repo.dart';
import 'events.dart';
import 'states.dart';
import 'package:nytimes/bloc/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  ///доступ к навигатору
  final GlobalKey<NavigatorState> navigatorKey;

  ///репозитормй
  final AppRepository _appRepo = AppRepository();

  ///кастомные цвета
  final Map<String, Color> myColor = {
    'grey': Color(0xFFDFDFDF),
    'blue': Color(0xFF58AFFF),
    'greyText': Color(0xFFA6A6A6)
  };

  ///локаль приложения
  String _currentLocale;

  AppBloc({this.navigatorKey}) : super(null) {
    getLocale();
  }

  ///получение локали для отображения даты на корректном языуке
  void getLocale() async {
    try {
      _currentLocale = await Devicelocale.currentLocale;
    } catch (e) {
      print("Error obtaining current locale ... $e");
    }
  }

  ///обработка событий
  @override
  Stream<AppStates> mapEventToState(AppEvents event) async* {
    ///поиск
    if (event is RepoSearchEvent) {
      ///строка поиска не должна быть пустой
      if (event.searchValue.trim() != "") {
        yield RepoLoadingState();
        try {
          final List<Repo> _loadedData = await _appRepo.getRepos(
            searchValue: event.searchValue,
            currentLocale: _currentLocale,
          );

          ///показ результатов, если они есть
          if (_loadedData.length > 0) {
            navigatorKey.currentState.pushNamed('/results');
            yield RepoLoadedState(
              searchValue: event.searchValue,
              repos: _loadedData,
            );
          } else {
            yield RepoEmptyState();
          }
        } catch (e) {
          print("error: ${e.toString()}");
          yield RepoErrorState();
        }
      }
    }
  }
}
