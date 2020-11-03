import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class GoodGameRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'GoodGame';
  static const BASE_URL = 'rtmp://msk.goodgame.ru:1940/live';

  String webUrl = 'https://goodgame.ru';

  GoodGameRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CAM4);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/goodgame.png';
  }

  // must be
  GoodGameRtmpOut copy() {
    return GoodGameRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory GoodGameRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return GoodGameRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
