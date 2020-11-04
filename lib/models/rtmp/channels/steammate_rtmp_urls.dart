import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class SteamMateRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Streamate';
  static const BASE_URL = 'rtmp://ew1c-origin-ls.naiadsystems.com/origin';

  String webUrl = 'https://www.streamatemodels.com/smm/login.php';

  SteamMateRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.STEAMMATE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/streamate.png';
  }

  // must be
  SteamMateRtmpOut copy() {
    return SteamMateRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory SteamMateRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return SteamMateRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
