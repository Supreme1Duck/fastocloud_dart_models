import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class VimeoRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Vimeo';
  static const BASE_URL = 'rtmp://rtmp.cloud.vimeo.com/live';

  String webUrl = 'https://vimeo.com';

  VimeoRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/vimeo.png';
  }

  // must be
  VimeoRtmpOut copy() {
    return VimeoRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory VimeoRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return VimeoRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
