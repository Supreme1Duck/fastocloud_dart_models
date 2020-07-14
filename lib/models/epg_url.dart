import 'package:meta/meta.dart';

class EpgUrl {
  static const ID_FIELD = 'id';
  static const URL_FIELD = 'url';

  final String id;
  String url;

  EpgUrl.create({this.url}) : id = null;

  EpgUrl.createDefault()
      : id = null,
        url = 'http://0.0.0.0/epg.xml';

  EpgUrl.edit({@required this.id, @required this.url});

  EpgUrl copy() {
    return EpgUrl.edit(id: id, url: url);
  }

  bool isValid() {
    return url != null && url.isNotEmpty;
  }

  // password field not exists in json
  factory EpgUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final url = json[URL_FIELD];
    return EpgUrl.edit(id: id, url: url);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, URL_FIELD: url};
  }
}
