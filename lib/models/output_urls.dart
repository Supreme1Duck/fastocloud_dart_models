import 'package:fastocloud_dart_models/models/rtmp/rtmp_urls.dart';
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

class HlsSinkType {
  final int _value;

  const HlsSinkType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'HLSSINK';
    }
    return 'HLSSINK2';
  }

  factory HlsSinkType.fromInt(int value) {
    if (value == 0) {
      return HlsSinkType.HLSSINK;
    }
    return HlsSinkType.HLSSINK2;
  }

  static get values => [HLSSINK, HLSSINK2];

  static const HlsSinkType HLSSINK = HlsSinkType._(0);
  static const HlsSinkType HLSSINK2 = HlsSinkType._(1);
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
  static const TEST_URL = 'test';
  static const FAKE_URL = 'fake';

  static const ID_FIELD = 'id';
  static const URI_FIELD = 'uri';

  int id;
  String uri;

  OutputUrl({@required this.id, @required this.uri});

  OutputUrl.createTest({@required this.id}) : uri = TEST_URL;

  OutputUrl.createFake({@required this.id}) : uri = FAKE_URL;

  OutputUrl copy() {
    return OutputUrl(id: id, uri: uri);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, URI_FIELD: uri};
  }

  bool isValid() {
    if (uri == null || uri.isEmpty) {
      return false;
    }
    final parsed = Uri.tryParse(uri);
    return id != null && parsed != null;
  }
}

class HttpOutputUrl extends OutputUrl {
  static const HTTP_ROOT_FIELD = 'http_root';
  static const HLS_TYPE_FIELD = 'hls_type';
  static const HLSSINK_TYPE_FIELD = 'hlssink_type';
  static const CHUNK_DURATION_FIELD = 'chunk_duration';
  static const PLAYLIST_ROOT_FIELD = 'playlist_root';

  static const List<Protocol> protocols = [Protocol.HTTP, Protocol.HTTPS];

  Optional<HlsSinkType> _hlsSinkType = Optional<HlsSinkType>.absent();
  Optional<String> _httpRoot = Optional<String>.absent();
  Optional<HlsType> _hlsType = Optional<HlsType>.absent();
  Optional<int> _chunkDuration = Optional<int>.absent();
  Optional<String> _playlistRoot = Optional<String>.absent();

  HttpOutputUrl(
      {@required int id,
      @required String uri,
      HlsSinkType hlsSinkType,
      String httpRoot,
      int chunkDuration,
      HlsType hlsType,
      String playlistRoot})
      : _hlsSinkType = Optional<HlsSinkType>.fromNullable(hlsSinkType),
        _httpRoot = Optional<String>.fromNullable(httpRoot),
        _hlsType = Optional<HlsType>.fromNullable(hlsType),
        _chunkDuration = Optional<int>.fromNullable(chunkDuration),
        _playlistRoot = Optional<String>.fromNullable(playlistRoot),
        super(id: id, uri: uri);

  HttpOutputUrl copy() {
    return HttpOutputUrl(
        id: id,
        uri: uri,
        httpRoot: httpRoot,
        hlsType: hlsType,
        hlsSinkType: hlsSinkType,
        chunkDuration: chunkDuration,
        playlistRoot: playlistRoot);
  }

  HlsSinkType get hlsSinkType {
    return _hlsSinkType.orNull;
  }

  set hlsSinkType(HlsSinkType hlsSinkType) {
    _hlsSinkType = Optional<HlsSinkType>.fromNullable(hlsSinkType);
  }

  String get httpRoot {
    return _httpRoot.orNull;
  }

  set httpRoot(String http) {
    _httpRoot = Optional<String>.fromNullable(http);
  }

  String get playlistRoot {
    return _playlistRoot.orNull;
  }

  set playlistRoot(String root) {
    _playlistRoot = Optional<String>.fromNullable(root);
  }

  int get chunkDuration {
    return _chunkDuration.orNull;
  }

  set chunkDuration(int duration) {
    _chunkDuration = Optional<int>.fromNullable(duration);
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
    if (json.containsKey(HTTP_ROOT_FIELD) && json.containsKey(HLS_TYPE_FIELD) && json.containsKey(HLSSINK_TYPE_FIELD)) {
      result._hlsSinkType = Optional<HlsSinkType>.of(HlsSinkType.fromInt(json[HLSSINK_TYPE_FIELD]));
      result._httpRoot = Optional<String>.of(json[HTTP_ROOT_FIELD]);
      result._hlsType = Optional<HlsType>.of(HlsType.fromInt(json[HLS_TYPE_FIELD]));
      if (json.containsKey(CHUNK_DURATION_FIELD)) {
        result._chunkDuration = Optional<int>.of(json[CHUNK_DURATION_FIELD]);
      }
      if (json.containsKey(PLAYLIST_ROOT_FIELD)) {
        result._playlistRoot = Optional<String>.of(json[PLAYLIST_ROOT_FIELD]);
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    if (_httpRoot.isPresent && _hlsType.isPresent && _hlsSinkType.isPresent) {
      result[HttpOutputUrl.HLSSINK_TYPE_FIELD] = _hlsSinkType.value.toInt();
      result[HttpOutputUrl.HTTP_ROOT_FIELD] = _httpRoot.value;
      result[HttpOutputUrl.HLS_TYPE_FIELD] = _hlsType.value.toInt();
      if (_chunkDuration.isPresent) {
        result[HttpOutputUrl.CHUNK_DURATION_FIELD] = _chunkDuration.value;
      }
      if (_playlistRoot.isPresent) {
        result[PLAYLIST_ROOT_FIELD] = _playlistRoot.value;
      }
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

class RtmpOutputUrl extends OutputUrl {
  static const List<Protocol> protocols = [
    Protocol.RTMP,
    Protocol.RTMPS,
    Protocol.RTMPT,
    Protocol.RTMPE,
    Protocol.RTMFP
  ];

  RtmpOutputUrl({@required int id, @required String uri}) : super(id: id, uri: uri);

  RtmpOutputUrl copy() {
    return RtmpOutputUrl(id: id, uri: uri);
  }

  factory RtmpOutputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[OutputUrl.ID_FIELD];
    final uri = json[OutputUrl.URI_FIELD];
    return RtmpOutputUrl(id: id, uri: uri);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
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
  if (HttpOutputUrl.protocols.contains(proto)) {
    return HttpOutputUrl.fromJson(json);
  } else if (proto == SrtOutputUrl.protocol) {
    return SrtOutputUrl.fromJson(json);
  } else if (RtmpOutputUrl.protocols.contains(proto)) {
    if (!json.containsKey(IRtmpOutputUrl.TYPE_FIELD)) {
      return RtmpOutputUrl.fromJson(json);
    }
    final type = json[IRtmpOutputUrl.TYPE_FIELD];
    return IRtmpOutputUrl.fromJson(PubSubStreamType.fromInt(type), json);
  }
  return OutputUrl(id: id, uri: uri);
}

extension OutputUrls on List<OutputUrl> {
  bool isValidOutputUrls() {
    if (this.isEmpty) {
      return false;
    }

    for (int i = 0; i < this.length; i++) {
      if (!this[i].isValid()) {
        return false;
      }
    }
    return true;
  }
}
