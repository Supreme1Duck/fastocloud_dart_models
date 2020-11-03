import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class CamSodaRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'CamSoda';

  String webUrl = 'https://www.camsoda.com';

  CamSodaRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CAMSODA);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/camsoda.png';
  }

  // must be
  CamSodaRtmpOut copy() {
    return CamSodaRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory CamSodaRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return CamSodaRtmpOut(id: id, uri: uri, webUrl: web);
  }
}