import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class VaughnLiveRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Vaughn Live';

  String webUrl = 'https://vaughn.live';

  VaughnLiveRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.VAUGHNLIVE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/vaughnlive.png';
  }

  // must be
  VaughnLiveRtmpOut copy() {
    return VaughnLiveRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory VaughnLiveRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return VaughnLiveRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
