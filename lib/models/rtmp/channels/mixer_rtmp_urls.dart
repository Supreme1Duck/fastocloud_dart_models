import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
import 'package:meta/meta.dart';

class MixerRtmpOut extends TagsRtmpOutputUrl {
  static const String NAME = 'Mixer';

  String webUrl = 'https://mixer.com/';

  MixerRtmpOut({@required int id, @required String uri, this.webUrl})
      : super(id: id, uri: uri, type: PubSubStreamType.MIXER);

  String get name {
    return NAME;
  }

  String get icon {
    return 'https://pubsub.me/images/channels/mixer.png';
  }

  // must be
  MixerRtmpOut copy() {
    return MixerRtmpOut(id: id, uri: uri, webUrl: webUrl);
  }

  factory MixerRtmpOut.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final web = json[TagsRtmpOutputUrl.WEB_URL_FIELD];
    return MixerRtmpOut(id: id, uri: uri, webUrl: web);
  }
}
