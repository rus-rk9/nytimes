///wrapper over the request interface

import 'package:nytimes/bloc/services/api.dart';
import 'package:nytimes/models/ribbon_item.dart';

class AppRepository {
  ApiProvider api = ApiProvider();

  ///getting ribbon data
  Future<List<RibbonItem>> getRibbonItems() async {
    List<dynamic> result = await api.getRibbonItemList();
    if (result != null) {
      return result.map((json) => RibbonItem.fromJSON(json)).toList();
    } else {
      print("api.getRibbonItems returned null");
    }
    return null;
  }
}
