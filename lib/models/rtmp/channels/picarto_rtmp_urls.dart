import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class PicartoRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Picarto';

  String webUrl = 'https://picarto.tv';

  PicartoRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.PICARTO);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/picarto.png';
  }

  // must be
  PicartoRtmpOut copy() {
    return PicartoRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory PicartoRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return PicartoRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
