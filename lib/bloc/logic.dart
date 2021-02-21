///main bloc logic
import 'package:nytimes/models/ribbon_item.dart';
import 'events.dart';
import 'states.dart';
import 'package:nytimes/bloc/services/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  ///access to navigator
  final GlobalKey<NavigatorState> navigatorKey;

  ///app repository
  final AppRepository _appRepo = AppRepository();
  AppBloc({this.navigatorKey}) : super(null);

  ///event handling
  @override
  Stream<AppStates> mapEventToState(AppEvents event) async* {
    ///getting items
    if (event is EventRibbonItemsGet) {
      yield StateRibbonItemLoading();
      try {
        final List<RibbonItem> _loadedData = await _appRepo.getRibbonItems();

        ///if results are exists
        if (_loadedData.length > 0) {
          yield StateRibbonItemLoaded(
            items: _loadedData,
          );
        } else {
          yield StateRibbonItemEmpty();
        }
      } catch (e) {
        print("error: ${e.toString()}");
        yield StateRibbonItemError();
      }
    }
  }
}
