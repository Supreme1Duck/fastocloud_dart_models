import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class Flirt4FreeRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Flirt4Free';

  String webUrl = 'https://www.flirt4free.com';

  Flirt4FreeRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CAM4);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/flirt4free.png';
  }

  // must be
  Flirt4FreeRtmpOut copy() {
    return Flirt4FreeRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory Flirt4FreeRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return Flirt4FreeRtmpOut(id: id, uri: uri, webUrl: web);
  }
}