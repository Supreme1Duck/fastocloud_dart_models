import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class UserAgent {
  final int _value;

  const UserAgent._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'GStreamer';
    } else if (_value == 1) {
      return 'VLC';
    } else if (_value == 2) {
      return 'FFMPEG';
    } else if (_value == 3) {
      return 'Wink';
    } else if (_value == 4) {
      return 'Chrome';
    } else if (_value == 5) {
      return 'Mozilla';
    }
    return 'Safari';
  }

  factory UserAgent.fromInt(int value) {
    if (value == 0) {
      return UserAgent.GSTREAMER;
    } else if (value == 1) {
      return UserAgent.VLC;
    } else if (value == 2) {
      return UserAgent.FFMPEG;
    } else if (value == 3) {
      return UserAgent.WINK;
    } else if (value == 4) {
      return UserAgent.CHROME;
    } else if (value == 5) {
      return UserAgent.MOZILLA;
    }
    return UserAgent.SAFARI;
  }

  static get values => [GSTREAMER, VLC, FFMPEG, WINK, CHROME, MOZILLA, SAFARI];

  static const UserAgent GSTREAMER = UserAgent._(0);
  static const UserAgent VLC = UserAgent._(1);
  static const UserAgent FFMPEG = UserAgent._(2);
  static const UserAgent WINK = UserAgent._(3);
  static const UserAgent CHROME = UserAgent._(4);
  static const UserAgent MOZILLA = UserAgent._(5);
  static const UserAgent SAFARI = UserAgent._(6);
}

class StreamLink {
  static const HTTP_PROXY_FIELD = 'http_proxy';
  static const HTTPS_PROXY_FIELD = 'https_proxy';

  Optional<String> _httpProxy = Optional<String>.absent();
  Optional<String> _httpsProxy = Optional<String>.absent();

  StreamLink({String httpProxy, String httpsProxy})
      : _httpProxy = Optional<String>.fromNullable(httpProxy),
        _httpsProxy = Optional<String>.fromNullable(httpsProxy);

  StreamLink.createExample();

  StreamLink copy() {
    return StreamLink(httpProxy: httpProxy, httpsProxy: httpsProxy);
  }

  String get httpProxy {
    return _httpProxy.orNull;
  }

  set httpProxy(String httpProxy) {
    _httpProxy = Optional<String>.fromNullable(httpProxy);
  }

  String get httpsProxy {
    return _httpsProxy.orNull;
  }

  set httpsProxy(String httpsProxy) {
    _httpsProxy = Optional<String>.fromNullable(httpsProxy);
  }

  factory StreamLink.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    String http;
    if (json.containsKey(HTTP_PROXY_FIELD)) {
      http = json[HTTP_PROXY_FIELD];
    }
    String https;
    if (json.containsKey(HTTPS_PROXY_FIELD)) {
      https = json[HTTPS_PROXY_FIELD];
    }
    return StreamLink(httpProxy: http, httpsProxy: https);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    if (_httpProxy.isPresent) {
      result[HTTP_PROXY_FIELD] = _httpProxy.value;
    }
    if (_httpsProxy.isPresent) {
      result[HTTPS_PROXY_FIELD] = _httpsProxy.value;
    }
    return result;
  }
}

class InputUrl {
  static const ID_FIELD = 'id';
  static const URI_FIELD = 'uri';

  int id;
  String uri;

  InputUrl({@required this.id, @required this.uri});

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, URI_FIELD: uri};
  }

  bool isValid() {
    if (uri == null) {
      return false;
    } else {
      final parsed = Uri.tryParse(uri);
      return id != null && uri.isNotEmpty && parsed != null;
    }
  }

  InputUrl copy() {
    return InputUrl(id: id, uri: uri);
  }
}

class HttpInputUrl extends InputUrl {
  static const STREAM_LINK_FIELD = 'stream_link';
  static const USER_AGENT_FIELD = 'user_agent';
  static const PROXY_FIELD = 'proxy';

  static const protocol_1 = Protocol.HTTP;
  static const protocol_2 = Protocol.HTTPS;

  Optional<StreamLink> _streamLink = Optional<StreamLink>.absent();
  Optional<UserAgent> _userAgent = Optional<UserAgent>.absent();
  Optional<String> _proxy = Optional<String>.absent();

  HttpInputUrl({@required int id, @required String uri, StreamLink streamLink, UserAgent userAgent, String proxy})
      : _streamLink = Optional<StreamLink>.fromNullable(streamLink),
        _userAgent = Optional<UserAgent>.fromNullable(userAgent),
        _proxy = Optional<String>.fromNullable(proxy),
        super(id: id, uri: uri);

  HttpInputUrl copy() {
    StreamLink streamLinkCopy = _streamLink.isPresent ? _streamLink.value.copy() : null;
    return HttpInputUrl(id: id, uri: uri, streamLink: streamLinkCopy, userAgent: userAgent, proxy: proxy);
  }

  UserAgent get userAgent {
    return _userAgent.orNull;
  }

  set userAgent(UserAgent agent) {
    _userAgent = Optional<UserAgent>.fromNullable(agent);
  }

  String get proxy {
    return _proxy.orNull;
  }

  set proxy(String proxy) {
    _proxy = Optional<String>.fromNullable(proxy);
  }

  StreamLink get streamLink {
    return _streamLink.orNull;
  }

  set streamLink(StreamLink link) {
    _streamLink = Optional<StreamLink>.fromNullable(link);
  }

  factory HttpInputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[InputUrl.ID_FIELD];
    final uri = json[InputUrl.URI_FIELD];
    HttpInputUrl result = HttpInputUrl(id: id, uri: uri);

    if (json.containsKey(STREAM_LINK_FIELD)) {
      final StreamLink stream = StreamLink.fromJson(json[STREAM_LINK_FIELD]);
      result._streamLink = Optional<StreamLink>.of(stream);
    }
    if (json.containsKey(USER_AGENT_FIELD)) {
      result._userAgent = Optional<UserAgent>.of(UserAgent.fromInt(json[USER_AGENT_FIELD]));
    }
    if (json.containsKey(PROXY_FIELD)) {
      result._proxy = Optional<String>.of(json[PROXY_FIELD]);
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    if (_streamLink.isPresent) {
      result[STREAM_LINK_FIELD] = _streamLink.value.toJson();
    }
    if (_userAgent.isPresent) {
      result[USER_AGENT_FIELD] = _userAgent.value.toInt();
    }
    if (_proxy.isPresent) {
      result[PROXY_FIELD] = _proxy.value;
    }
    return result;
  }
}

class UdpInputUrl extends InputUrl {
  static const PROGRAM_NUMBER_FIELD = 'program_number';
  static const MULTICAST_IFACE_FIELD = 'multicast_iface';

  static const protocol = Protocol.UDP;

  Optional<int> _programNumber = Optional<int>.absent();
  Optional<String> _multicastIface = Optional<String>.absent();

  UdpInputUrl({@required int id, @required String uri, int programNumber, String multicastIface})
      : _programNumber = Optional<int>.fromNullable(programNumber),
        _multicastIface = Optional<String>.fromNullable(multicastIface),
        super(id: id, uri: uri);

  UdpInputUrl copy() {
    return UdpInputUrl(id: id, uri: uri, programNumber: programNumber, multicastIface: multicastIface);
  }

  String get multicastIface {
    return _multicastIface.orNull;
  }

  set multicastIface(String iface) {
    _multicastIface = Optional<String>.fromNullable(iface);
  }

  int get programNumber {
    return _programNumber.orNull;
  }

  set programNumber(int number) {
    _programNumber = Optional<int>.fromNullable(number);
  }

  factory UdpInputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[InputUrl.ID_FIELD];
    final uri = json[InputUrl.URI_FIELD];
    UdpInputUrl result = UdpInputUrl(id: id, uri: uri);

    if (json.containsKey(PROGRAM_NUMBER_FIELD)) {
      result._programNumber = Optional<int>.of(json[PROGRAM_NUMBER_FIELD]);
    }
    if (json.containsKey(MULTICAST_IFACE_FIELD)) {
      result._multicastIface = Optional<String>.of(json[MULTICAST_IFACE_FIELD]);
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    if (_programNumber.isPresent) {
      result[PROGRAM_NUMBER_FIELD] = _programNumber.value;
    }
    if (_multicastIface.isPresent) {
      result[MULTICAST_IFACE_FIELD] = _multicastIface.value;
    }
    return result;
  }
}

class FileInputUrl extends InputUrl {
  static const protocol = Protocol.FILE;

  FileInputUrl({@required int id, @required String uri}) : super(id: id, uri: uri);

  FileInputUrl copy() {
    return FileInputUrl(id: id, uri: uri);
  }

  factory FileInputUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[InputUrl.ID_FIELD];
    final uri = json[InputUrl.URI_FIELD];
    FileInputUrl result = FileInputUrl(id: id, uri: uri);
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    return result;
  }
}

InputUrl makeInputUrl(Map<String, dynamic> json) {
  if (json == null) {
    return null;
  }

  final id = json[InputUrl.ID_FIELD];
  final uri = json[InputUrl.URI_FIELD];
  final Uri parsed = Uri.parse(uri);
  final proto = Protocol.fromString(parsed.scheme);
  if (proto == HttpInputUrl.protocol_1 || proto == HttpInputUrl.protocol_2) {
    return HttpInputUrl.fromJson(json);
  } else if (proto == UdpInputUrl.protocol) {
    return UdpInputUrl.fromJson(json);
  } else if (proto == FileInputUrl.protocol) {
    return FileInputUrl.fromJson(json);
  }
  return InputUrl(id: id, uri: uri);
}

extension InputUrls on List<InputUrl> {
  bool isValidInputUrls() {
    for (int i = 0; i < this.length; i++) {
      if (!this[i].isValid()) {
        return false;
      }
    }
    return true;
  }
}
