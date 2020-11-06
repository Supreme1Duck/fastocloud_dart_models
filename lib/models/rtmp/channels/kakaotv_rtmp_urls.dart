import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class KakaoTVRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Kakao TV';

  String webUrl = 'https://tv.kakao.com/';

  KakaoTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.KAKAOTV);

  String get name {
    return NAME;
  }

  // must be
  KakaoTVRtmpOut copy() {
    return KakaoTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory KakaoTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return KakaoTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
