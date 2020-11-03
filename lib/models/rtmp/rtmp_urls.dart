import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/afreecatv_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/bilibili_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/bongacams_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/breakerstv_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/cam4_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/camplace_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/camsoda_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/chaturbate_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/custom_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/dlive_rtmp_urls.dart';
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
    } else if (_value == 4) {
      return AfreecaTVRtmpOut.NAME;
    } else if (_value == 5) {
      return BiliBiliRtmpOut.NAME;
    } else if (_value == 6) {
      return BongaCamsRtmpOut.NAME;
    } else if (_value == 7) {
      return Cam4RtmpOut.NAME;
    } else if (_value == 8) {
      return CamPlaceRtmpOut.NAME;
    } else if (_value == 9) {
      return CamSodaRtmpOut.NAME;
    } else if (_value == 10) {
      return BreakersTVRtmpOut.NAME;
    } else if (_value == 11) {
      return ChaturbateRtmpOut.NAME;
    } else if (_value == 12) {
      return DLiveRtmpOut.NAME;
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
    } else if (value == 4) {
      return AFREECATV;
    } else if (value == 5) {
      return BILIBILI;
    } else if (value == 6) {
      return BONGACAMS;
    } else if (value == 7) {
      return CAM4;
    } else if (value == 8) {
      return CAMPLACE;
    } else if (value == 9) {
      return CAMSODA;
    } else if (value == 10) {
      return BREAKERSTV;
    } else if (value == 11) {
      return CHATURBATE;
    } else if (value == 12) {
      return DLIVE;
    }
    return CUSTOM;
  }

  static get values => [
        CUSTOM,
        YOUTUBE,
        FACEBOOK,
        TWITCH,
        AFREECATV,
        BILIBILI,
        BONGACAMS,
        CAM4,
        CAMPLACE,
        CAMSODA,
        BREAKERSTV,
        CHATURBATE,
        DLIVE
      ];

  static const PubSubStreamType CUSTOM = PubSubStreamType._(0);
  static const PubSubStreamType YOUTUBE = PubSubStreamType._(1);
  static const PubSubStreamType FACEBOOK = PubSubStreamType._(2);
  static const PubSubStreamType TWITCH = PubSubStreamType._(3);
  static const PubSubStreamType AFREECATV = PubSubStreamType._(4);
  static const PubSubStreamType BILIBILI = PubSubStreamType._(5);
  static const PubSubStreamType BONGACAMS = PubSubStreamType._(6);
  static const PubSubStreamType CAM4 = PubSubStreamType._(7);
  static const PubSubStreamType CAMPLACE = PubSubStreamType._(8);
  static const PubSubStreamType CAMSODA = PubSubStreamType._(9);
  static const PubSubStreamType BREAKERSTV = PubSubStreamType._(10);
  static const PubSubStreamType CHATURBATE = PubSubStreamType._(11);
  static const PubSubStreamType DLIVE = PubSubStreamType._(12);
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
    } else if (type == PubSubStreamType.AFREECATV) {
      return AfreecaTVRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.BILIBILI) {
      return BiliBiliRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.BONGACAMS) {
      return BongaCamsRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.CAM4) {
      return Cam4RtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.CAMPLACE) {
      return CamPlaceRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.CAMSODA) {
      return CamSodaRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.BREAKERSTV) {
      return BreakersTVRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.DLIVE) {
      return DLiveRtmpOut.fromJson(json);
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
