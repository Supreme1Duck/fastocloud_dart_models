import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class MyFreeCamsRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Myfreecams';
  static const BASE_URL = 'rtmp://publish.myfreecams.com/NxServer';

  String webUrl = 'https://profiles.myfreecams.com/_/model_start_page';

  MyFreeCamsRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.YOUTUBE);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/myfreecams.png';
  }

  // must be
  MyFreeCamsRtmpOut copy() {
    return MyFreeCamsRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory MyFreeCamsRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return MyFreeCamsRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
