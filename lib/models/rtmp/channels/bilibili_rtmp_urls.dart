import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class BiliBiliRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'BiliBili';

  String webUrl = 'https://live.bilibili.com';

  BiliBiliRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.BILIBILI);

  String get name {
    return NAME;
  }

  // must be
  BiliBiliRtmpOut copy() {
    return BiliBiliRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory BiliBiliRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return BiliBiliRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
