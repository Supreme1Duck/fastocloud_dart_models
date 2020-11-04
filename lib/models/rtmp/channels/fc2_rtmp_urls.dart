import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class FC2RtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'FC2 Live';

  String webUrl = 'https://live.fc2.com';

  FC2RtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.FC2);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/fc2live.png';
  }

  // must be
  FC2RtmpOut copy() {
    return FC2RtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory FC2RtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return FC2RtmpOut(id: id, uri: uri, webUrl: web);
  }
}
