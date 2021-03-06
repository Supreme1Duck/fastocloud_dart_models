import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class PeriscopeRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Periscope';

  String webUrl = 'https://www.pscp.tv';

  PeriscopeRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.PERISCOPE);

  String get name {
    return NAME;
  }

  // must be
  PeriscopeRtmpOut copy() {
    return PeriscopeRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory PeriscopeRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return PeriscopeRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
