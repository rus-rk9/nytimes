///states
import 'package:flutter/foundation.dart';
import 'package:nytimes/models/ribbon_item.dart';

abstract class AppStates {}

class StateRibbonItemError extends AppStates {}

class StateRibbonItemEmpty extends AppStates {}

class StateRibbonItemLoading extends AppStates {}

class StateRibbonItemLoaded extends AppStates {
  List<RibbonItem> items;

  StateRibbonItemLoaded({
    @required this.items,
  }) : assert(items != null);
}
