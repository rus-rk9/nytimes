///модель карточки
import 'package:intl/intl.dart';

class Repo {
  String name;
  String userName;
  int rate;
  String dt;
  String avaURL;

  Repo({
    this.name,
    this.userName,
    this.rate,
    this.dt,
    this.avaURL,
  });

  ///преобразование результата в объект модели
  factory Repo.fromJSON(Map<String, dynamic> json, String languageCode) {
    DateTime d = DateTime.parse(json['updated_at']);
    return Repo(
      name: json['name'],
      userName: json['owner']['login'],
      rate: json['stargazers_count'],
      dt: DateFormat('d MMMM', languageCode).format(d), //"2021-02-03T14:13:28Z"
      avaURL: json['owner']['avatar_url'],
    );
  }
}
