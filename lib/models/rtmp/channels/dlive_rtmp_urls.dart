import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class DLiveRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'DLive';

  String webUrl = 'https://dlive.tv/s/dashboard';
  static const BASE_URL = 'rtmp://stream.dlive.tv/live';

  DLiveRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.DLIVE);

  String get icon {
    return 'https://pubsub.me/images/channels/dlive.png';
  }

  String get name {
    return NAME;
  }

  // must be
  DLiveRtmpOut copy() {
    return DLiveRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory DLiveRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return DLiveRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
