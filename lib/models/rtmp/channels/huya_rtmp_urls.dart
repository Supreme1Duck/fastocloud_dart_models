import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class HuyaRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Huya.com';
  static const BASE_URL = 'rtmp://ws.upstream.huya.com/huyalive';

  String webUrl = 'https://www.huya.com/l';

  HuyaRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.HUYA);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/huya.png';
  }

  // must be
  HuyaRtmpOut copy() {
    return HuyaRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory HuyaRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return HuyaRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
