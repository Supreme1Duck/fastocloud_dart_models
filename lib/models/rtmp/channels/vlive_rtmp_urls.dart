import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class VLiveRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'VLive';

  String webUrl = 'https://www.vlive.tv';

  VLiveRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.VLIVE);

  String get name {
    return NAME;
  }

  // must be
  VLiveRtmpOut copy() {
    return VLiveRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory VLiveRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return VLiveRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
