import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class StreamRayRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Streamray';

  String webUrl = 'https://models.streamray.com';

  StreamRayRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/streamray.png';
  }

  // must be
  StreamRayRtmpOut copy() {
    return StreamRayRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory StreamRayRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return StreamRayRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
