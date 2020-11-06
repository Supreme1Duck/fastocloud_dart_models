import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class ChaturbateRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Breakers TV';

  String webUrl = 'https://chaturbate.com/auth/login';
  static const BASE_URL = 'rtmp://live.stream.highwebmedia.com/live-origin';

  ChaturbateRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CHATURBATE);

  String get name {
    return NAME;
  }

  // must be
  ChaturbateRtmpOut copy() {
    return ChaturbateRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory ChaturbateRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return ChaturbateRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
