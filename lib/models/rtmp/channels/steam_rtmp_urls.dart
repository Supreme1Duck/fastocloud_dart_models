import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class SteamRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Steam';

  String webUrl = 'https://store.steampowered.com/login';

  SteamRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.STEAM);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/steam.png';
  }

  // must be
  SteamRtmpOut copy() {
    return SteamRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory SteamRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return SteamRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
