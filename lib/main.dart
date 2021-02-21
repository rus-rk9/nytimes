import 'package:flutter/material.dart';
import 'package:nytimes/screens/ribbon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';

import 'bloc/events.dart';

void main() {
  runApp(SearchApp());
}

class SearchApp extends StatelessWidget {
  ///navigator
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(
        navigatorKey: _navigatorKey,
      )..add(
          EventRibbonItemsGet(),
        ),
      child: MaterialApp(
        ///navigation will not work without this key
        navigatorKey: _navigatorKey,
        initialRoute: '/',
        routes: {
          '/': (context) => Ribbon(),
        },
      ),
    );
  }
}
