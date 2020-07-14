import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class HlsType {
  final int _value;

  const HlsType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'HLS PULL';
    }
    return 'HLS PUSH';
  }

  factory HlsType.fromInt(int value) {
    if (value == 0) {
      return HlsType.HLS_PULL;
    }
    return HlsType.HLS_PUSH;
  }

  static get values => [HLS_PULL, HLS_PUSH];

  static const HlsType HLS_PULL = HlsType._(0);
  static const HlsType HLS_PUSH = HlsType._(1);
}

class SrtMode {
  final int _value;

  const SrtMode._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'NONE';
    } else if (_value == 1) {
      return 'CALLER';
    } else if (_value == 2) {
      return 'LISTENER';
    }
    return 'RENDEZVOUS';
  }

  factory SrtMode.fromInt(int value) {
    if (value == 0) {
      return SrtMode.NONE;
    } else if (value == 1) {
      return SrtMode.CALLER;
    } else if (value == 2) {
      return SrtMode.LISTENER;
    }
    return SrtMode.RENDEZVOUS;
  }

  static get values => [NONE, CALLER, LISTENER, RENDEZVOUS];

  static const SrtMode NONE = SrtMode._(0);
  static const SrtMode CALLER = SrtMode._(1);
  static const SrtMode LISTENER = SrtMode._(2);
  static const SrtMode RENDEZVOUS = SrtMode._(3);
}

class OutputUrl {
  static const ID_FIELD = 'id';
  static const URI_FIELD = 'uri';

  int id;
  String uri;

  OutputUrl({@required this.id, @required this.uri});

  OutputUrl copy() {
    return OutputUrl(id: id, uri: uri);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, URI_FIELD: uri};
  }

  bool isValid() {
    return id != null && uri != null && uri.isNotEmpty;
  }
}

class HttpOutputUrl extends OutputUrl {
  static const HTTP_ROOT_FIELD = 'http_root';
  static const HLS_TYPE_FIELD = 'hls_type';

  static const protocol_1 = Protocol.HTTP;
  static const protocol_2 = Protocol.HTTP;

  Optional<String> _httpRoot = Optional<String>.absent();
  Optional<HlsType> _hlsType = Optional<HlsType>.absent();

  HttpOutputUrl({@required int id, @required String uri, String httpRoot, HlsType hlsType})
      : _httpRoot = Optional<String>.fromNullable(httpRoot),
        _hlsType = Optional<HlsType>.fromNullable(hlsType),
        super(id: id, uri: uri);

  HttpOutputUrl copy() {
    return HttpOutputUrl(id: id, uri: uri, httpRoot: httpRoot, hlsType: hlsType);
  }

  String get httpRoot {
    return _httpRoot.orNull;
  }

  set httpRoot(String http) {
    _httpRoot = Optional<String>.fromNullable(http);
  }

  HlsType get hlsType {
    return _hlsType.orNull;
  }

  set hlsType(HlsType hls) {
    _hlsType = Optional<HlsType>.fromNullable(hls);
  }

  factory HttpOutputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    HttpOutputUrl result = HttpOutputUrl(id: id, uri: uri);
    if (json.containsKey(HTTP_ROOT_FIELD) && json.containsKey(HLS_TYPE_FIELD)) {
      result._httpRoot = Optional<String>.of(json[HTTP_ROOT_FIELD]);
      result._hlsType = Optional<HlsType>.of(HlsType.fromInt(json[HLS_TYPE_FIELD]));
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    if (_httpRoot.isPresent && _hlsType.isPresent) {
      result[HttpOutputUrl.HTTP_ROOT_FIELD] = _httpRoot.value;
      result[HttpOutputUrl.HLS_TYPE_FIELD] = _hlsType.value.toInt();
    }
    return result;
  }
}

class SrtOutputUrl extends OutputUrl {
  static const SRT_MODE_FIELD = 'srt_mode';

  static const protocol = Protocol.SRT;

  SrtMode mode;

  SrtOutputUrl({@required int id, @required String uri, @required SrtMode mode})
      : mode = mode,
        super(id: id, uri: uri);

  SrtOutputUrl copy() {
    return SrtOutputUrl(id: id, uri: uri, mode: mode);
  }

  factory SrtOutputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    final mode = json[SrtOutputUrl.SRT_MODE_FIELD];
    return SrtOutputUrl(id: id, uri: uri, mode: SrtMode.fromInt(mode));
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    result[SrtOutputUrl.SRT_MODE_FIELD] = mode.toInt();
    return result;
  }
}

OutputUrl makeOutputUrl(Map<String, dynamic> json) {
  if (json == null) {
    return null;
  }

  final id = json[OutputUrl.ID_FIELD];
  final uri = json[OutputUrl.URI_FIELD];
  final Uri parsed = Uri.parse(uri);
  final proto = Protocol.fromString(parsed.scheme);
  if (proto == HttpOutputUrl.protocol_1 || proto == HttpOutputUrl.protocol_2) {
    return HttpOutputUrl.fromJson(json);
  } else if (proto == SrtOutputUrl.protocol) {
    return SrtOutputUrl.fromJson(json);
  }
  return OutputUrl(id: id, uri: uri);
}
