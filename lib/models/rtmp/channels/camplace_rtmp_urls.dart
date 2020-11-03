import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class CamPlace extends TagsRtmpOutputUrl {
  static const String NAME = 'Camplace';
  static const BASE_URL = 'rtmp://rtmp.camplace.com:1935';

  String webUrl = 'https://www.camplace.com/broadcaster/dashboard';

  CamPlace({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CAMPLACE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/camplace.png';
  }

  // must be
  CamPlace copy() {
    return CamPlace(id: id, uri: uri, webUrl: webUrl);
  }

  factory CamPlace.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return CamPlace(id: id, uri: uri, webUrl: web);
  }
}
