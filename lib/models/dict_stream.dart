import 'package:meta/meta.dart';

class DictStream {
  static const TVG_ID_FIELD = 'tvg-id';
  static const TVG_NAME_FIELD = 'tvg-name';
  static const TVG_LOGO_FIELD = 'tvg-logo';
  static const GROUPS_FIELD = 'groups';
  static const URL_FIELD = 'url';

  String epgId;
  String name;
  String icon;
  List<String> groups;
  String url;

  DictStream(
      {@required this.epgId, @required this.name, @required this.icon, @required this.groups, @required this.url});

  DictStream copy() {
    return DictStream(epgId: epgId, name: name, icon: icon, groups: groups, url: url);
  }

  factory DictStream.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[DictStream.TVG_ID_FIELD];
    final name = json[DictStream.TVG_NAME_FIELD];
    final icon = json[DictStream.TVG_LOGO_FIELD];
    final List<String> groups = json[DictStream.GROUPS_FIELD].cast<String>();
    final url = json[DictStream.URL_FIELD];
    return DictStream(epgId: id, name: name, icon: icon, groups: groups, url: url);
  }

  Map<String, dynamic> toJson() {
    return {TVG_ID_FIELD: epgId, TVG_NAME_FIELD: name, TVG_LOGO_FIELD: icon, GROUPS_FIELD: groups, URL_FIELD: url};
  }
}
