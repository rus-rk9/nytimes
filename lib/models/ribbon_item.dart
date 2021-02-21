///item model
import 'package:intl/intl.dart';

class RibbonItem {
  String title;
  String abstr;
  String avatar;
  String username;
  String published;
  String updated;

  RibbonItem({
    this.title,
    this.abstr,
    this.avatar,
    this.username,
    this.published,
    this.updated,
  });

  ///convert results to object
  factory RibbonItem.fromJSON(Map<String, dynamic> json) {
    print(json['title']);
    return RibbonItem(
      title: json['title']
          .toString()
          //not sure, is it right way to escape characters, but didn't found another way yet, to-do!
          .replaceAll('â', '\'')
          .replaceAll('â', '‘')
          .replaceAll('â', '’'),
      abstr: json['abstract'],
      avatar: json['multimedia'][1]['url'],
      username: json['byline'],
      published: DateFormat('MMM d, y').format(
        DateTime.parse(json['published_date']),
      ),
      updated: DateFormat('MMM d, y').format(
        DateTime.parse(json['updated_date']),
      ),
    );
  }
}
