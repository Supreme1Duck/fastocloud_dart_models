import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class MyFreeCamsRtmpOut extends IRtmpOutputUrl {
  static const String NAME = 'Myfreecams';
  static const BASE_URL = 'rtmp://publish.myfreecams.com/NxServer';

  String webUrl = 'https://profiles.myfreecams.com/_/model_start_page';

  MyFreeCamsRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.MYFREECAMS);

  String get name {
    return NAME;
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
    final web = json[IRtmpOutputUrl.WEB_URL_FIELD];
    return MyFreeCamsRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
