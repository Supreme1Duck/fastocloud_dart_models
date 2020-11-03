import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class BongaCams extends TagsRtmpOutputUrl {
  static const String NAME = 'BongaCams';
  static const BASE_URL = 'rtmp://origin.bcrncdn.com:1934/live';

  String webUrl = 'https://bongamodels.com';

  BongaCams({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.BONGACAMS);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/bongacams.png';
  }

  // must be
  BongaCams copy() {
    return BongaCams(id: id, uri: uri, webUrl: webUrl);
  }

  factory BongaCams.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return BongaCams(id: id, uri: uri, webUrl: web);
  }
}