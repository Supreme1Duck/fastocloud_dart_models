import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class CustomRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Custom';

  String webUrl = 'https://pubsub.me/weburl';

  CustomRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CUSTOM);

  String get name {
    return NAME;
  }

  // must be
  CustomRtmpOut copy() {
    return CustomRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory CustomRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return CustomRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
