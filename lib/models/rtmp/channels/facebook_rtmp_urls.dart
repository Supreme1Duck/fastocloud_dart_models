import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class FacebookRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Facebook';
  static const BASE_URL = 'rtmps://live-api-s.facebook.com:443/rtmp';

  String webUrl = 'https://www.facebook.com';

  FacebookRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.FACEBOOK);

  String get name {
    return NAME;
  }

  // must be
  FacebookRtmpOut copy() {
    return FacebookRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory FacebookRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return FacebookRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
