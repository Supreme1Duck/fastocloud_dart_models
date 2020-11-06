import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class YouTubeRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'YouTube';
  static const BASE_URL = 'rtmp://a.rtmp.youtube.com/live2';

  String webUrl = 'https://studio.youtube.com';

  YouTubeRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  // must be
  YouTubeRtmpOut copy() {
    return YouTubeRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory YouTubeRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return YouTubeRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
