import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class OdnoklassnikiRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Odnoklassniki';
  static const BASE_URL = 'rtmp://vsu.mycdn.me/input/';

  String webUrl = 'https://ok.ru/video/liveApp';

  OdnoklassnikiRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/odnoklassniki.png';
  }

  // must be
  OdnoklassnikiRtmpOut copy() {
    return OdnoklassnikiRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory OdnoklassnikiRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return OdnoklassnikiRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
