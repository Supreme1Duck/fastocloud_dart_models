import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class NaverTVRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Naver TV';

  String webUrl = 'https://tv.naver.com/';

  NaverTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.MIXER);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/navertv.png';
  }

  // must be
  NaverTVRtmpOut copy() {
    return NaverTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory NaverTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return NaverTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}