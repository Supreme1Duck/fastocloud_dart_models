import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class XLoveCamRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'XLoveCam';

  String webUrl = 'https://www.xlovecam.com';

  XLoveCamRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.XLOVECAM);

  String get name {
    return NAME;
  }

  // must be
  XLoveCamRtmpOut copy() {
    return XLoveCamRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory XLoveCamRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return XLoveCamRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
