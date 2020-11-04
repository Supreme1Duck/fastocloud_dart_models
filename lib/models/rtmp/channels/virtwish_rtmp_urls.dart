import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class VirtWishRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Virtwish';
  static const BASE_URL = 'rtmp://rtmp.virtwish.com/live';

  String webUrl = 'https://www.camplace.com/broadcaster/dashboard';

  VirtWishRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.VIRTWISH);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/virtwish.png';
  }

  // must be
  VirtWishRtmpOut copy() {
    return VirtWishRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory VirtWishRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return VirtWishRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
