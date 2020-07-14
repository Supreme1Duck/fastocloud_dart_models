import 'package:fastocloud_dart_models/models/types.dart';
import 'package:fastotv_dart/commands_info/serial_info.dart';
import 'package:meta/meta.dart';

class ServerSerial extends Serial {
  static const VISIBLE_FIELD = 'visible';
  static const PRICE_FIELD = 'price';

  bool visible = true;
  double price = Price.DEFAULT;

  ServerSerial.create(
      {String name,
      @required String icon,
      List<String> groups,
      bool visible = true,
      String description,
      int season,
      List<String> episodes,
      double price = Price.DEFAULT,
      int viewCount = 0})
      : visible = visible,
        price = price,
        super(null, name, icon, groups ?? [], description, season, episodes ?? [], viewCount);

  ServerSerial.edit(
      {@required String id,
      @required String name,
      String icon,
      List<String> groups,
      bool visible,
      String description,
      int season,
      List<String> episodes,
      double price,
      int viewCount = 0})
      : visible = visible,
        price = price,
        super(id, name, icon, groups ?? [], description, season, episodes ?? [], viewCount);

  Serial copy() {
    ServerSerial serial = ServerSerial.edit(
        id: id,
        name: name,
        icon: icon,
        groups: groups,
        visible: visible,
        description: description,
        season: season,
        episodes: episodes,
        price: price,
        viewCount: view_count);
    return serial;
  }

  bool isValid() {
    return name.isNotEmpty && icon.isValidIconUrl();
  }

  factory ServerSerial.fromJson(Map<String, dynamic> json) {
    Serial base = Serial.fromJson(json);
    final price = json[PRICE_FIELD];
    final visible = json[VISIBLE_FIELD];
    final views = json[Serial.VIEW_COUNT_FIELD];
    ServerSerial serial = ServerSerial.edit(
        id: base.id,
        name: base.name,
        icon: base.icon,
        groups: base.groups,
        visible: visible,
        description: base.description,
        season: base.season,
        episodes: base.episodes,
        price: price,
        viewCount: views);
    return serial;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    result[VISIBLE_FIELD] = visible;
    result[PRICE_FIELD] = price;
    return result;
  }
}
