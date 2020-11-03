import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class BiliBili extends TagsRtmpOutputUrl {
  static const String NAME = 'Bilibili';

  String webUrl = 'https://live.bilibili.com';

  BiliBili({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.BILIBILI);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/bilibili.png';
  }

  // must be
  BiliBili copy() {
    return BiliBili(id: id, uri: uri, webUrl: webUrl);
  }

  factory BiliBili.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return BiliBili(id: id, uri: uri, webUrl: web);
  }
}
