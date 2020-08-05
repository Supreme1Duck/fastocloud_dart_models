import 'package:fastocloud_dart_models/common/utils.dart';
import 'package:fastocloud_dart_models/models/server_provider.dart';
import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';

class MlBackend {
  final int _value;

  const MlBackend._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    return 'NVIDIA';
  }

  factory MlBackend.fromInt(int value) {
    return MlBackend.NVIDIA;
  }

  static get values => [NVIDIA];

  static const MlBackend NVIDIA = MlBackend._(0);
}

class StreamType {
  final int _value;

  const StreamType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'Proxy';
    } else if (_value == 1) {
      return 'VOD/Serial proxy';
    } else if (_value == 2) {
      return 'Restream';
    } else if (_value == 3) {
      return 'Encode';
    } else if (_value == 4) {
      return 'Timeshift Player';
    } else if (_value == 5) {
      return 'Timeshift Recorder';
    } else if (_value == 6) {
      return 'Catchup';
    } else if (_value == 7) {
      return 'Test Life';
    } else if (_value == 8) {
      return 'VOD/Serial Restream';
    } else if (_value == 9) {
      return 'VOD/Serial Encode';
    } else if (_value == 10) {
      return 'COD Restream';
    } else if (_value == 11) {
      return 'COD Encode';
    }
    return 'Event';
  }

  factory StreamType.fromInt(int value) {
    if (value == 0) {
      return StreamType.PROXY;
    } else if (value == 1) {
      return StreamType.VOD_PROXY;
    } else if (value == 2) {
      return StreamType.RELAY;
    } else if (value == 3) {
      return StreamType.ENCODE;
    } else if (value == 4) {
      return StreamType.TIMESHIFT_PLAYER;
    } else if (value == 5) {
      return StreamType.TIMESHIFT_RECORDER;
    } else if (value == 6) {
      return StreamType.CATCHUP;
    } else if (value == 7) {
      return StreamType.TEST_LIFE;
    } else if (value == 8) {
      return StreamType.VOD_RELAY;
    } else if (value == 9) {
      return StreamType.VOD_ENCODE;
    } else if (value == 10) {
      return StreamType.COD_RELAY;
    } else if (value == 11) {
      return StreamType.COD_ENCODE;
    }
    return StreamType.EVENT;
  }

  static get values => [
        PROXY,
        VOD_PROXY,
        RELAY,
        ENCODE,
        TIMESHIFT_PLAYER,
        TIMESHIFT_RECORDER,
        CATCHUP,
        TEST_LIFE,
        VOD_RELAY,
        VOD_ENCODE,
        COD_RELAY,
        COD_ENCODE,
        EVENT
      ];

  static const StreamType PROXY = StreamType._(0);
  static const StreamType VOD_PROXY = StreamType._(1);
  static const StreamType RELAY = StreamType._(2);
  static const StreamType ENCODE = StreamType._(3);
  static const StreamType TIMESHIFT_PLAYER = StreamType._(4);
  static const StreamType TIMESHIFT_RECORDER = StreamType._(5);
  static const StreamType CATCHUP = StreamType._(6);
  static const StreamType TEST_LIFE = StreamType._(7);
  static const StreamType VOD_RELAY = StreamType._(8);
  static const StreamType VOD_ENCODE = StreamType._(9);
  static const StreamType COD_RELAY = StreamType._(10);
  static const StreamType COD_ENCODE = StreamType._(11);
  static const StreamType EVENT = StreamType._(12);
}

class StreamStatus {
  final int _value;

  const StreamStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'New';
    } else if (_value == 1) {
      return 'Init';
    } else if (_value == 2) {
      return 'Started';
    } else if (_value == 3) {
      return 'Ready';
    } else if (_value == 4) {
      return 'Streaming';
    } else if (_value == 5) {
      return 'Idle';
    }
    return 'Waiting';
  }

  factory StreamStatus.fromInt(int value) {
    if (value == 0) {
      return StreamStatus.NEW;
    } else if (value == 1) {
      return StreamStatus.INIT;
    } else if (value == 2) {
      return StreamStatus.STARTED;
    } else if (value == 3) {
      return StreamStatus.READY;
    } else if (value == 4) {
      return StreamStatus.PLAYING;
    } else if (value == 5) {
      return StreamStatus.FROZEN;
    }
    return StreamStatus.WAITING;
  }

  static get values => [NEW, INIT, STARTED, READY, PLAYING, FROZEN, WAITING];

  static const StreamStatus NEW = StreamStatus._(0);
  static const StreamStatus INIT = StreamStatus._(1);
  static const StreamStatus STARTED = StreamStatus._(2);
  static const StreamStatus READY = StreamStatus._(3);
  static const StreamStatus PLAYING = StreamStatus._(4);
  static const StreamStatus FROZEN = StreamStatus._(5);
  static const StreamStatus WAITING = StreamStatus._(6);
}

class VodType {
  final int _value;

  const VodType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'VODs';
    }
    return 'Series';
  }

  factory VodType.fromInt(int value) {
    if (value == 0) {
      return VodType.VOD;
    }
    return VodType.SERIAL;
  }

  static get values => [VOD, SERIAL];

  static const VodType VOD = VodType._(0);
  static const VodType SERIAL = VodType._(1);
}

class StreamLogLevel {
  final int _value;

  const StreamLogLevel._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'Emerg';
    } else if (_value == 1) {
      return 'Alert';
    } else if (_value == 2) {
      return 'Critical';
    } else if (_value == 3) {
      return 'Error';
    } else if (_value == 4) {
      return 'Warning';
    } else if (_value == 5) {
      return 'Notice';
    } else if (_value == 6) {
      return 'Info';
    }
    return 'Debug';
  }

  factory StreamLogLevel.fromInt(int value) {
    if (value == 0) {
      return StreamLogLevel.EMERG;
    } else if (value == 1) {
      return StreamLogLevel.ALERT;
    } else if (value == 2) {
      return StreamLogLevel.CRIT;
    } else if (value == 3) {
      return StreamLogLevel.ERR;
    } else if (value == 4) {
      return StreamLogLevel.WARNING;
    } else if (value == 5) {
      return StreamLogLevel.NOTICE;
    } else if (value == 6) {
      return StreamLogLevel.INFO;
    }
    return StreamLogLevel.DEBUG;
  }

  static const StreamLogLevel EMERG = StreamLogLevel._(0);
  static const StreamLogLevel ALERT = StreamLogLevel._(1);
  static const StreamLogLevel CRIT = StreamLogLevel._(2);
  static const StreamLogLevel ERR = StreamLogLevel._(3);
  static const StreamLogLevel WARNING = StreamLogLevel._(4);
  static const StreamLogLevel NOTICE = StreamLogLevel._(5);
  static const StreamLogLevel INFO = StreamLogLevel._(6);
  static const StreamLogLevel DEBUG = StreamLogLevel._(7);
}

class VideoCodec {
  final String _value;

  const VideoCodec._(this._value);

  String toString() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 'eavcenc') {
      return 'EAVC';
    } else if (_value == 'openh264enc') {
      return 'OPEN.H264';
    } else if (_value == 'x264enc') {
      return 'X264';
    } else if (_value == 'nvh264enc') {
      return 'NVIDIA.H264';
    } else if (_value == 'nvh265enc') {
      return 'NVIDIA.H265';
    } else if (_value == 'nvv4l2h264enc') {
      return 'NVIDIA.V4L.H264';
    } else if (_value == 'nvv4l2h265enc') {
      return 'NVIDIA.V4L.H265';
    } else if (_value == 'nvv4l2vp8enc') {
      return 'NVIDIA.V4L.VP8';
    } else if (_value == 'nvv4l2vp9enc') {
      return 'NVIDIA.V4L.VP9';
    } else if (_value == 'vaapih264enc') {
      return 'VAAPI.H264';
    } else if (_value == 'vaapimpeg2enc') {
      return 'VAAPI.MPEG2';
    } else if (_value == 'mfxh264enc') {
      return 'INTEL.H264';
    } else if (_value == 'x265enc') {
      return 'X265';
    }
    return 'MSDK.H264';
  }

  factory VideoCodec.fromString(String value) {
    if (value == 'eavcenc') {
      return EAVC_ENC;
    } else if (value == 'openh264enc') {
      return OPEN_H264_ENC;
    } else if (value == 'x264enc') {
      return X264_ENC;
    } else if (value == 'nvh264enc') {
      return NV_H264_ENC;
    } else if (value == 'nvh265enc') {
      return NV_H265_ENC;
    } else if (value == 'nvv4l2h264enc') {
      return NV_V4L_H264_ENC;
    } else if (value == 'nvv4l2h265enc') {
      return NV_V4L_H265_ENC;
    } else if (value == 'nvv4l2vp8enc') {
      return NV_V4L_VP8_ENC;
    } else if (value == 'nvv4l2vp9enc') {
      return NV_V4L_VP9_ENC;
    } else if (value == 'vaapih264enc') {
      return VAAPI_H264_ENC;
    } else if (value == 'vaapimpeg2enc') {
      return VAAPI_MPEG2_ENC;
    } else if (value == 'mfxh264enc') {
      return MFX_H264_ENC;
    } else if (value == 'x265enc') {
      return X265_ENC;
    }
    return MSDK_H264_ENC;
  }

  static get values => [
        EAVC_ENC,
        OPEN_H264_ENC,
        X264_ENC,
        NV_H264_ENC,
        NV_H265_ENC,
        NV_V4L_H264_ENC,
        NV_V4L_H265_ENC,
        NV_V4L_VP8_ENC,
        NV_V4L_VP9_ENC,
        VAAPI_H264_ENC,
        VAAPI_MPEG2_ENC,
        MFX_H264_ENC,
        X265_ENC,
        MSDK_H264_ENC
      ];

  static const VideoCodec EAVC_ENC = VideoCodec._('eavcenc');
  static const VideoCodec OPEN_H264_ENC = VideoCodec._('openh264enc');
  static const VideoCodec X264_ENC = VideoCodec._('x264enc');
  static const VideoCodec NV_H264_ENC = VideoCodec._('nvh264enc');
  static const VideoCodec NV_H265_ENC = VideoCodec._('nvh265enc');
  static const VideoCodec NV_V4L_H264_ENC = VideoCodec._('nvv4l2h264enc');
  static const VideoCodec NV_V4L_H265_ENC = VideoCodec._('nvv4l2h265enc');
  static const VideoCodec NV_V4L_VP8_ENC = VideoCodec._('nvv4l2vp8enc');
  static const VideoCodec NV_V4L_VP9_ENC = VideoCodec._('nvv4l2vp9enc');
  static const VideoCodec VAAPI_H264_ENC = VideoCodec._('vaapih264enc');
  static const VideoCodec VAAPI_MPEG2_ENC = VideoCodec._('vaapimpeg2enc');
  static const VideoCodec MFX_H264_ENC = VideoCodec._('mfxh264enc');
  static const VideoCodec X265_ENC = VideoCodec._('x265enc');
  static const VideoCodec MSDK_H264_ENC = VideoCodec._('msdkh264enc');
}

class AudioCodec {
  final String _value;

  const AudioCodec._(this._value);

  String toString() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 'lamemp3enc') {
      return 'LAMEMP3';
    } else if (_value == 'faac') {
      return 'AAC';
    } else if (_value == 'voaacenc') {
      return 'VOAAC';
    }
    return 'OPUS';
  }

  factory AudioCodec.fromString(String value) {
    if (value == 'lamemp3enc') {
      return LAME_MP3_ENC;
    } else if (value == 'faac') {
      return FAAC;
    } else if (value == 'voaacenc') {
      return VOAAC_ENC;
    }
    return OPUS;
  }

  static get values => [LAME_MP3_ENC, FAAC, VOAAC_ENC, OPUS];

  static const AudioCodec LAME_MP3_ENC = AudioCodec._('lamemp3enc');
  static const AudioCodec FAAC = AudioCodec._('faac');
  static const AudioCodec OPUS = AudioCodec._('opusenc');
  static const AudioCodec VOAAC_ENC = AudioCodec._('voaacenc');
}

class VideoParser {
  final String _value;

  const VideoParser._(this._value);

  String toString() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 'tsparse') {
      return 'MPEGTS';
    } else if (_value == 'h264parse') {
      return 'H264';
    }
    return 'H265';
  }

  factory VideoParser.fromString(String value) {
    if (value == 'tsparse') {
      return TS;
    } else if (value == 'h264parse') {
      return H264;
    }
    return H265;
  }

  static get values => [TS, H264, H265];

  static const VideoParser TS = VideoParser._('tsparse');
  static const VideoParser H264 = VideoParser._('h264parse');
  static const VideoParser H265 = VideoParser._('h265parse');
}

class AudioParser {
  final String _value;

  const AudioParser._(this._value);

  String toString() => _value;

  String toHumanReadable() {
    if (_value == 'aacparse') {
      return 'AAC';
    } else if (_value == 'ac3parse') {
      return 'AC3';
    } else if (_value == 'mpegaudioparse') {
      return 'MPEG';
    } else if (_value == 'opusparse') {
      return 'OPUS';
    }
    return 'RAW';
  }

  factory AudioParser.fromString(String value) {
    if (value == 'aacparse') {
      return AAC;
    } else if (value == 'ac3parse') {
      return AC3;
    } else if (value == 'mpegaudioparse') {
      return MPEG;
    } else if (value == 'opusparse') {
      return OPUS;
    }
    return RAW;
  }

  static get values => [AAC, AC3, MPEG, OPUS, RAW];

  static const AudioParser AAC = AudioParser._('aacparse');
  static const AudioParser AC3 = AudioParser._('ac3parse');
  static const AudioParser MPEG = AudioParser._('mpegaudioparse');
  static const AudioParser OPUS = AudioParser._('opusparse');
  static const AudioParser RAW = AudioParser._('rawaudioparse');
}

class Size {
  static const WIDTH_FIELD = 'width';
  static const HEIGHT_FIELD = 'height';

  static const MIN_WIDTH = 1;
  static const MIN_HEIGHT = 1;

  int width;
  int height;

  Size({@required this.width, @required this.height});

  Size.create640x480()
      : width = 640,
        height = 480;

  Size.create240x120()
      : width = 240,
        height = 120;

  Size copy() {
    return Size(width: width, height: height);
  }

  factory Size.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final width = json[WIDTH_FIELD];
    final height = json[HEIGHT_FIELD];
    return Size(width: width, height: height);
  }

  Map<String, dynamic> toJson() {
    return {WIDTH_FIELD: width, HEIGHT_FIELD: height};
  }

  bool isValid() {
    if (width == null || height == null) {
      return false;
    }
    return width >= MIN_WIDTH && height >= MIN_HEIGHT;
  }
}

class Rational {
  static const NUM_FIELD = 'num';
  static const DEN_FIELD = 'den';

  static const INVALID_NUM = 0;
  static const INVALID_DEN = 0;

  int numerator;
  int denominator;

  Rational({@required this.numerator, @required this.denominator});

  Rational.create4x3()
      : numerator = 4,
        denominator = 3;

  Rational copy() {
    return Rational(numerator: numerator, denominator: denominator);
  }

  factory Rational.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final numerator = json[NUM_FIELD];
    final denominator = json[DEN_FIELD];
    return Rational(numerator: numerator, denominator: denominator);
  }

  Map<String, dynamic> toJson() {
    return {NUM_FIELD: numerator, DEN_FIELD: denominator};
  }

  bool isValid() {
    if (numerator == null || denominator == null) {
      return false;
    }
    return numerator != INVALID_NUM && denominator != INVALID_DEN;
  }
}

class Point {
  static const X_FIELD = 'x';
  static const Y_FIELD = 'y';

  static const DEFAULT_X = 0;
  static const DEFAULT_Y = 0;

  int x;
  int y;

  Point({this.x = DEFAULT_X, this.y = DEFAULT_Y});

  Point.createStart()
      : x = 0,
        y = 0;

  Point copy() {
    return Point(x: x, y: y);
  }

  factory Point.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final x = json[X_FIELD];
    final y = json[Y_FIELD];
    return Point(x: x, y: y);
  }

  Map<String, dynamic> toJson() {
    return {X_FIELD: x, Y_FIELD: y};
  }

  bool isValid() {
    return true;
  }
}

class Logo {
  static const PATH_FIELD = 'path';
  static const POSITION_FIELD = 'position';
  static const ALPHA_FIELD = 'alpha';
  static const SIZE_FIELD = 'size';

  String path;
  Point position;
  double alpha;
  Size size;

  Logo({@required this.path, @required this.position, @required this.alpha, @required this.size});

  Logo.createExample()
      : path = '/home/sasha/1.png',
        position = Point.createStart(),
        size = Size.create240x120(),
        alpha = Alpha.DEFAULT;

  Logo copy() {
    return Logo(path: path, position: position.copy(), alpha: alpha, size: size.copy());
  }

  factory Logo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final path = json[PATH_FIELD];
    final position = Point.fromJson(json[POSITION_FIELD]);
    final alpha = json[ALPHA_FIELD];
    final size = Size.fromJson(json[SIZE_FIELD]);
    return Logo(path: path, position: position, alpha: alpha, size: size);
  }

  Map<String, dynamic> toJson() {
    return {PATH_FIELD: path, POSITION_FIELD: position.toJson(), ALPHA_FIELD: alpha, SIZE_FIELD: size.toJson()};
  }

  bool isValid() {
    return path.isValidFilePath() && position.isValid() && alpha.isValidAlpha() && size.isValid();
  }
}

class RsvgLogo {
  static const PATH_FIELD = 'path';
  static const POSITION_FIELD = 'position';
  static const SIZE_FIELD = 'size';

  String path;
  Point position;
  Size size;

  RsvgLogo({@required this.path, @required this.position, @required this.size});

  RsvgLogo.createExample()
      : path = '/home/sasha/1.png',
        position = Point.createStart(),
        size = Size.create240x120();

  RsvgLogo copy() {
    return RsvgLogo(path: path, position: position.copy(), size: size.copy());
  }

  factory RsvgLogo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final path = json[PATH_FIELD];
    final position = Point.fromJson(json[POSITION_FIELD]);
    final size = Size.fromJson(json[SIZE_FIELD]);
    return RsvgLogo(path: path, position: position, size: size);
  }

  Map<String, dynamic> toJson() {
    return {PATH_FIELD: path, POSITION_FIELD: position.toJson(), SIZE_FIELD: size.toJson()};
  }

  bool isValid() {
    return path.isValidFilePath() && position.isValid() && size.isValid();
  }
}

class HostAndPort {
  static const HOST_FIELD = 'host';
  static const PORT_FIELD = 'port';

  static const String DEFAULT_LOCAL_HOST_IPV4 = '127.0.0.1';
  static const String DEFAULT_LOCAL_HOST_IPV6 = '::1';
  static const String DEFAULT_ROUTE_HOST_IPV4 = '0.0.0.0';
  static const String DEFAULT_ROUTE_HOST_IPV6 = '::';

  String host;
  int port;

  HostAndPort({@required this.host, @required this.port});

  HostAndPort.createLocalHostV4({@required int port})
      : host = DEFAULT_LOCAL_HOST_IPV4,
        port = port;

  HostAndPort.createLocalHostV6({@required int port})
      : host = DEFAULT_LOCAL_HOST_IPV4,
        port = port;

  HostAndPort.createDefaultRouteHostV4({@required int port})
      : host = DEFAULT_ROUTE_HOST_IPV4,
        port = port;

  HostAndPort.createDefaultRouteHostV6({@required int port})
      : host = DEFAULT_ROUTE_HOST_IPV6,
        port = port;

  HostAndPort copy() {
    return HostAndPort(host: host, port: port);
  }

  factory HostAndPort.fromJson(Map<String, dynamic> json) {
    return HostAndPort(host: json[HOST_FIELD], port: json[PORT_FIELD]);
  }

  Map<String, dynamic> toJson() {
    return {HOST_FIELD: host, PORT_FIELD: port};
  }

  static bool isValidHost(String host) {
    return isValidIPV4(host) || isValidIPV6(host) || isValidDomain(host);
  }

  bool isValid() {
    return isValidHost(host) && port != null;
  }

  String toString() {
    return '$host:$port';
  }
}

class ServerProvider {
  static const ID_FIELD = 'id';
  static const ROLE_FIELD = 'role';

  String id;
  ProviderRole role;

  ServerProvider({@required this.id, @required this.role});

  factory ServerProvider.fromJson(Map<String, dynamic> json) {
    return ServerProvider(id: json[ID_FIELD], role: ProviderRole.fromInt(json[ROLE_FIELD]));
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, ROLE_FIELD: role.toInt()};
  }
}

class ChannelStats {
  static const ID_FIELD = 'id';
  static const BPS_FIELD = 'bps';

  final int id;
  final int bps;

  ChannelStats({@required this.id, @required this.bps});

  factory ChannelStats.fromJson(Map<String, dynamic> json) {
    return ChannelStats(id: json[ID_FIELD], bps: json[BPS_FIELD]);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, BPS_FIELD: bps};
  }
}

class MachineLearning {
  static const BACKEND_FIELD = 'backend';
  static const MODEL_PATH_FIELD = 'model_url';
  static const OVERLAY_FIELD = 'overlay';
  static const TRACKING_FIELD = 'tracking';

  MlBackend backend;
  String modelUrl;
  bool overlay;
  bool tracking;

  MachineLearning({@required this.backend, @required this.modelUrl, @required this.tracking, @required this.overlay});

  MachineLearning.createExample()
      : backend = MlBackend.NVIDIA,
        modelUrl =
            'file:///opt/nvidia/deepstream/deepstream-4.0/sources/objectDetector_Yolo/config_infer_primary_yoloV3.txt',
        tracking = false,
        overlay = false;

  bool isValid() {
    if (backend == null || modelUrl == null || overlay == null) {
      return false;
    }
    return modelUrl.isNotEmpty;
  }

  factory MachineLearning.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final MlBackend backend = MlBackend.fromInt(json[MachineLearning.BACKEND_FIELD]);
    final String uri = json[MachineLearning.MODEL_PATH_FIELD];
    final bool tracking = json[MachineLearning.TRACKING_FIELD];
    final bool overlay = json[MachineLearning.OVERLAY_FIELD];
    return MachineLearning(backend: backend, modelUrl: uri, tracking: tracking, overlay: overlay);
  }

  Map<String, dynamic> toJson() {
    return {
      MachineLearning.BACKEND_FIELD: backend.toInt(),
      MachineLearning.MODEL_PATH_FIELD: modelUrl,
      MachineLearning.TRACKING_FIELD: tracking,
      MachineLearning.OVERLAY_FIELD: overlay
    };
  }
}

class PhoneNumber {
  static const DIAL_CODE_FIELD = 'dial_code';
  static const PHONE_NUMBER_FIELD = 'phone_number';
  static const ISO_CODE_FILED = 'iso_code';

  String dialCode;
  String phoneNumber;
  String isoCode;

  PhoneNumber({@required this.dialCode, @required this.phoneNumber, @required this.isoCode});

  PhoneNumber.createUSADefault()
      : dialCode = '+1',
        phoneNumber = '123456789',
        isoCode = 'US';

  PhoneNumber copy() {
    return PhoneNumber(dialCode: dialCode, phoneNumber: phoneNumber, isoCode: isoCode);
  }

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final code = json[DIAL_CODE_FIELD];
    final number = json[PHONE_NUMBER_FIELD];
    final iso = json[ISO_CODE_FILED];
    return PhoneNumber(dialCode: code, phoneNumber: number, isoCode: iso);
  }

  Map<String, dynamic> toJson() {
    return {DIAL_CODE_FIELD: dialCode, PHONE_NUMBER_FIELD: phoneNumber, ISO_CODE_FILED: isoCode};
  }

  bool isValid() {
    return dialCode != null &&
        dialCode.isNotEmpty &&
        phoneNumber != null &&
        phoneNumber.isNotEmpty &&
        isoCode != null &&
        isoCode.isNotEmpty;
  }
}
