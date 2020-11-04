import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class ZhanqiTVRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Zhanqi TV';
  static const BASE_URL = 'rtmp://yfrtmpup.cdn.zhanqi.tv/zqlive';

  String webUrl = 'https://www.zhanqi.tv';

  ZhanqiTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.ZHANQITV);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/zhanqitv.png';
  }

  // must be
  ZhanqiTVRtmpOut copy() {
    return ZhanqiTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory ZhanqiTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return ZhanqiTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
