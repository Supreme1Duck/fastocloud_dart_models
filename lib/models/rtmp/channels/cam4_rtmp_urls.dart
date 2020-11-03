import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class Cam4 extends TagsRtmpOutputUrl {
  static const String NAME = 'CAM4';
  static const BASE_URL = 'rtmp://origin.cam4.com/cam4-origin-live';

  String webUrl = 'https://www.cam4models.com';

  Cam4({@required int id, @required String uri, this.webUrl}) : super(id: id, uri: uri, type: PubSubStreamType.CAM4);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/cam4.png';
  }

  // must be
  Cam4 copy() {
    return Cam4(id: id, uri: uri, webUrl: webUrl);
  }

  factory Cam4.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return Cam4(id: id, uri: uri, webUrl: web);
  }
}
