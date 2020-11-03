import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class SmashCastRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Smashcast';
  static const BASE_URL = 'rtmp://live.hitbox.tv/push';

  String webUrl = 'https://www.smashcast.tv';

  SmashCastRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.SMASHCAST);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/smashcast.png';
  }

  // must be
  SmashCastRtmpOut copy() {
    return SmashCastRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory SmashCastRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return SmashCastRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
