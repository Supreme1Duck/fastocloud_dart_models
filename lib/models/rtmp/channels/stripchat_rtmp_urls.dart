import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class StripchatRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Stripchat';
  static const BASE_URL = 'rtmp://s-sd.stripst.com/ext';

  String webUrl = 'https://stripchat.com/login';

  StripchatRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/stripchat.png';
  }

  // must be
  StripchatRtmpOut copy() {
    return StripchatRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory StripchatRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return StripchatRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
