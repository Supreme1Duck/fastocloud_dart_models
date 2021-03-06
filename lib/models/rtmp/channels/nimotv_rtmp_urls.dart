import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class NimoTVRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Nimo TV';
  static const BASE_URL = 'rtmp://txpush.rtmp.nimo.tv/live/';

  String webUrl = 'https://www.nimo.tv/i/stream-manager';

  NimoTVRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.NIMOTV);

  String get name {
    return NAME;
  }

  // must be
  NimoTVRtmpOut copy() {
    return NimoTVRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory NimoTVRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return NimoTVRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
