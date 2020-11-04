import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class DouyuRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Douyu';

  String webUrl = 'https://www.douyu.com';

  DouyuRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.DOUYU);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/douyu.png';
  }

  // must be
  DouyuRtmpOut copy() {
    return DouyuRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory DouyuRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return DouyuRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
