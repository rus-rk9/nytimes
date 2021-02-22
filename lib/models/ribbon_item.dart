///item model
import 'package:intl/intl.dart';

class RibbonItem {
  String title;
  String abstr;
  String avatar;
  String username;
  String published;
  String updated;
  String url;

  RibbonItem({
    this.title,
    this.abstr,
    this.avatar,
    this.username,
    this.published,
    this.updated,
    this.url,
  });

  ///convert results to object
  factory RibbonItem.fromJSON(Map<String, dynamic> json) {
    String _avaURL;

    try {
      _avaURL = json['multimedia'][1]['url'];
    } catch (_) {
      _avaURL = null;
    }

    return RibbonItem(
      title: (json.containsKey('title'))
          ? escapeCharacters(json['title'].toString())
          : null,
      abstr: (json.containsKey('abstract'))
          ? escapeCharacters(json['abstract'].toString())
          : null,
      avatar: _avaURL,
      username: (json.containsKey('byline'))
          ? escapeCharacters(json['byline'].toString())
          : null,
      published: (json.containsKey('published_date'))
          ? 'Published ' +
              DateFormat('MMM d, y').format(
                DateTime.parse(json['published_date']),
              )
          : null,
      updated: (json.containsKey('updated_date'))
          ? 'Updated ' +
              DateFormat('MMM d, y').format(
                DateTime.parse(json['updated_date']),
              )
          : null,
      url: json['url'],
    );
  }

  static String escapeCharacters(String str) {
    //not sure, this is right way to escape characters, but didn't found another way yet, to-do!
    return str
        .replaceAll('â', '\'')
        .replaceAll('â', '‘')
        .replaceAll('â¦', '...')
        .replaceAll('Ã©', 'é')
        .replaceAll('Ã³', 'ó')
        .replaceAll('â', '’');
  }
}
