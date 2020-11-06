import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class Cam4RtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'CAM4';
  static const BASE_URL = 'rtmp://origin.cam4.com/cam4-origin-live';

  String webUrl = 'https://www.cam4models.com';

  Cam4RtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.CAM4);

  String get name {
    return NAME;
  }

  // must be
  Cam4RtmpOut copy() {
    return Cam4RtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory Cam4RtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return Cam4RtmpOut(id: id, uri: uri, webUrl: web);
  }
}
