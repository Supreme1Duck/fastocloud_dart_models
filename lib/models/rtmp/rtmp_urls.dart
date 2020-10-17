import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/custom_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/facebook_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/twitch_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/youtube_rtmp_urls.dart';
import 'package:meta/meta.dart';

class PubSubStreamType {
  final int _value;

  const PubSubStreamType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return CustomRtmpOut.NAME;
    } else if (_value == 1) {
      return YouTubeRtmpOut.NAME;
    } else if (_value == 2) {
      return FacebookRtmpOut.NAME;
    } else if (_value == 3) {
      return TwitchRtmpOut.NAME;
    }
    return CustomRtmpOut.NAME;
  }

  factory PubSubStreamType.fromInt(int value) {
    if (value == 0) {
      return CUSTOM;
    } else if (value == 1) {
      return YOUTUBE;
    } else if (value == 2) {
      return FACEBOOK;
    } else if (value == 3) {
      return TWITCH;
    }
    return CUSTOM;
  }

  static get values => [CUSTOM, YOUTUBE, FACEBOOK, TWITCH];

  static const PubSubStreamType CUSTOM = PubSubStreamType._(0);
  static const PubSubStreamType YOUTUBE = PubSubStreamType._(1);
  static const PubSubStreamType FACEBOOK = PubSubStreamType._(2);
  static const PubSubStreamType TWITCH = PubSubStreamType._(3);
}

abstract class TagsRtmpOutputUrl extends RtmpOutputUrl {
  static const TYPE_FIELD = 'rtmp_type';
  static const String WEB_URL_FIELD = 'rtmp_web_url';

  final PubSubStreamType type;

  String get name;

  String get icon;

  String get webUrl;

  set webUrl(String url);

  TagsRtmpOutputUrl({@required int id, @required String uri, this.type});

  factory TagsRtmpOutputUrl.fromJson(PubSubStreamType type, Map<String, dynamic> json) {
    if (type == PubSubStreamType.CUSTOM) {
      return CustomRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.FACEBOOK) {
      return FacebookRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.YOUTUBE) {
      return YouTubeRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.TWITCH) {
      return TwitchRtmpOut.fromJson(json);
    }
    return CustomRtmpOut.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    result[TagsRtmpOutputUrl.WEB_URL_FIELD] = webUrl;
    result[TagsRtmpOutputUrl.TYPE_FIELD] = type.toInt();
    return result;
  }
}
