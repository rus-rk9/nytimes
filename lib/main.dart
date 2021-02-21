import 'package:flutter/material.dart';
import 'package:nytimes/screens/ribbon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(SearchApp());
}

class SearchApp extends StatelessWidget {
  ///навигатор
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ///инициализация интерфейса форматирования дат
    initializeDateFormatting();
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(
        navigatorKey: _navigatorKey,
      ),
      child: MaterialApp(
        ///без указания этого ключа навигация работать не будет
        navigatorKey: _navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => Ribbon(),
        },
      ),
    );
  }
}
