import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class TwitchRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Twitch';

  String webUrl = 'https://www.twitch.tv';

  TwitchRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.TWITCH);

  String get name {
    return NAME;
  }

  // must be
  TwitchRtmpOut copy() {
    return TwitchRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory TwitchRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return TwitchRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
