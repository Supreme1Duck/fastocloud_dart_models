import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class PeriscopeRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Periscope';

  String webUrl = 'https://www.pscp.tv';

  PeriscopeRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/periscope.png';
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
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return PeriscopeRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
