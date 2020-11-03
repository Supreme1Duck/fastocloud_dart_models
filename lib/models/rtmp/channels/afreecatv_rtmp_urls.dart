import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class AfreecaTVRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Afreeca TV';

  String webUrl = 'http://dashboard.afreecatv.com';

  AfreecaTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.AFREECATV);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/afreecatv.png';
  }

  // must be
  AfreecaTVRtmpOut copy() {
    return AfreecaTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory AfreecaTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return AfreecaTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
