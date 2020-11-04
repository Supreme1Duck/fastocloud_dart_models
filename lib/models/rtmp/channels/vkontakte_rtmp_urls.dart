import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class VkontakteRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Vkontakte';

  String webUrl = 'https://vk.com/video';

  VkontakteRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.VKONTAKTE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/vkontakte.png';
  }

  // must be
  VkontakteRtmpOut copy() {
    return VkontakteRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory VkontakteRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return VkontakteRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
