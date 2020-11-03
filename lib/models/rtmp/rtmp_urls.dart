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
import 'package:fastocloud_dart_models/models/rtmp/channels/douyu_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/facebook_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/fc2_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/flirt4free_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/goodgame_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/huya_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/kakaotv_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/mixer_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/myfreecams_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/navertv_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/nimotv_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/odnoklassniki_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/periscope_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/picarto_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/smashcast_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/streamray_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/stripchat_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/twitch_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/vaughnlive_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/vimeo_rtmp_urls.dart';
import 'package:fastocloud_dart_models/models/rtmp/channels/virtwish_rtmp_urls.dart';
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
    } else if (_value == 13) {
      return DouyuRtmpOut.NAME;
    } else if (_value == 14) {
      return FC2RtmpOut.NAME;
    } else if (_value == 15) {
      return Flirt4FreeRtmpOut.NAME;
    } else if (_value == 16) {
      return GoodGameRtmpOut.NAME;
    } else if (_value == 17) {
      return HuyaRtmpOut.NAME;
    } else if (_value == 18) {
      return KakaoTVRtmpOut.NAME;
    } else if (_value == 19) {
      return MixerRtmpOut.NAME;
    } else if (_value == 20) {
      return MyFreeCamsRtmpOut.NAME;
    } else if (_value == 21) {
      return NaverTVRtmpOut.NAME;
    } else if (_value == 22) {
      return NimoTVRtmpOut.NAME;
    } else if (_value == 23) {
      return OdnoklassnikiRtmpOut.NAME;
    } else if (_value == 24) {
      return PeriscopeRtmpOut.NAME;
    } else if (_value == 25) {
      return PicartoRtmpOut.NAME;
    } else if (_value == 26) {
      return SmashCastRtmpOut.NAME;
    } else if (_value == 27) {
      return StreamRayRtmpOut.NAME;
    } else if (_value == 28) {
      return StripchatRtmpOut.NAME;
    } else if (_value == 29) {
      return VaughnLiveRtmpOut.NAME;
    } else if (_value == 30) {
      return VimeoRtmpOut.NAME;
    } else if (_value == 31) {
      return VirtWishRtmpOut.NAME;
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
    } else if (value == 13) {
      return DOUYU;
    } else if (value == 14) {
      return FC2;
    } else if (value == 15) {
      return FLIRT4FREE;
    } else if (value == 16) {
      return GOODGAME;
    } else if (value == 17) {
      return HUYA;
    } else if (value == 18) {
      return KAKAOTV;
    } else if (value == 19) {
      return MIXER;
    } else if (value == 20) {
      return MYFREECAMS;
    } else if (value == 21) {
      return NAVERTV;
    } else if (value == 22) {
      return NIMOTV;
    } else if (value == 23) {
      return ODNOKLASSNIKI;
    } else if (value == 24) {
      return PERISCOPE;
    } else if (value == 25) {
      return PICARTO;
    } else if (value == 26) {
      return SMASHCAST;
    } else if (value == 27) {
      return STREAMRAY;
    } else if (value == 28) {
      return STRIPCHAT;
    } else if (value == 29) {
      return VAUGHNLIVE;
    } else if (value == 30) {
      return VIMEO;
    } else if (value == 31) {
      return VIRTWISH;
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
        DLIVE,
        DOUYU,
        FC2,
        FLIRT4FREE,
        GOODGAME,
        HUYA,
        KAKAOTV,
        MIXER,
        MYFREECAMS,
        NAVERTV,
        NIMOTV,
        ODNOKLASSNIKI,
        PERISCOPE,
        PICARTO,
        SMASHCAST,
        STREAMRAY,
        STRIPCHAT,
        VAUGHNLIVE,
        VIMEO,
        VIRTWISH
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
  static const PubSubStreamType DOUYU = PubSubStreamType._(13);
  static const PubSubStreamType FC2 = PubSubStreamType._(14);
  static const PubSubStreamType FLIRT4FREE = PubSubStreamType._(15);
  static const PubSubStreamType GOODGAME = PubSubStreamType._(16);
  static const PubSubStreamType HUYA = PubSubStreamType._(17);
  static const PubSubStreamType KAKAOTV = PubSubStreamType._(18);
  static const PubSubStreamType MIXER = PubSubStreamType._(19);
  static const PubSubStreamType MYFREECAMS = PubSubStreamType._(20);
  static const PubSubStreamType NAVERTV = PubSubStreamType._(21);
  static const PubSubStreamType NIMOTV = PubSubStreamType._(22);
  static const PubSubStreamType ODNOKLASSNIKI = PubSubStreamType._(23);
  static const PubSubStreamType PERISCOPE = PubSubStreamType._(24);
  static const PubSubStreamType PICARTO = PubSubStreamType._(25);
  static const PubSubStreamType SMASHCAST = PubSubStreamType._(26);
  static const PubSubStreamType STREAMRAY = PubSubStreamType._(27);
  static const PubSubStreamType STRIPCHAT = PubSubStreamType._(28);

  static const PubSubStreamType VAUGHNLIVE = PubSubStreamType._(29);
  static const PubSubStreamType VIMEO = PubSubStreamType._(30);
  static const PubSubStreamType VIRTWISH = PubSubStreamType._(31);
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
    } else if (type == PubSubStreamType.DOUYU) {
      return DouyuRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.FC2) {
      return FC2RtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.FLIRT4FREE) {
      return Flirt4FreeRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.GOODGAME) {
      return GoodGameRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.HUYA) {
      return HuyaRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.KAKAOTV) {
      return KakaoTVRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.MIXER) {
      return MixerRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.MYFREECAMS) {
      return MyFreeCamsRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.NAVERTV) {
      return NaverTVRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.NIMOTV) {
      return NimoTVRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.ODNOKLASSNIKI) {
      return OdnoklassnikiRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.PERISCOPE) {
      return PeriscopeRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.PICARTO) {
      return PicartoRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.SMASHCAST) {
      return SmashCastRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.STREAMRAY) {
      return StreamRayRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.STRIPCHAT) {
      return StripchatRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.VAUGHNLIVE) {
      return VaughnLiveRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.VIMEO) {
      return VimeoRtmpOut.fromJson(json);
    } else if (type == PubSubStreamType.VIRTWISH) {
      return VirtWishRtmpOut.fromJson(json);
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
