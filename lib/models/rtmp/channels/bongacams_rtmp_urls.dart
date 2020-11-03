import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class BongaCamsRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'BongaCams';
  static const BASE_URL = 'rtmp://origin.bcrncdn.com:1934/live';

  String webUrl = 'https://bongamodels.com';

  BongaCamsRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.BONGACAMS);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/bongacams.png';
  }

  // must be
  BongaCamsRtmpOut copy() {
    return BongaCamsRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory BongaCamsRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return BongaCamsRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
