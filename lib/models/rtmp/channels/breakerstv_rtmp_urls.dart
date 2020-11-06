import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class BreakersTVRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Breakers TV';

  String webUrl = 'https://breakers.tv';

  BreakersTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.BREAKERSTV);

  String get name {
    return NAME;
  }

  // must be
  BreakersTVRtmpOut copy() {
    return BreakersTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory BreakersTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return BreakersTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
