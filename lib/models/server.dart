import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/machine.dart';
import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/server_base.dart';
import 'package:fastocloud_dart_models/models/server_provider.dart';
import 'package:fastocloud_dart_models/models/stream.dart';
import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class OnlineUsers {
  static const DAEMON_FIELD = 'daemon';
  static const HTTP_FIELD = 'http';
  static const VODS_FIELD = 'vods';
  static const CODS_FIELD = 'cods';

  final int daemon;
  final int http;
  final int vods;
  final int cods;

  OnlineUsers({this.daemon, this.http, this.vods, this.cods});

  factory OnlineUsers.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final daemon = json[DAEMON_FIELD];
    final http = json[HTTP_FIELD];
    final vods = json[VODS_FIELD];
    final cods = json[CODS_FIELD];
    return OnlineUsers(daemon: daemon, http: http, vods: vods, cods: cods);
  }

  Map<String, dynamic> toJson() {
    return {DAEMON_FIELD: daemon, HTTP_FIELD: http, VODS_FIELD: vods, CODS_FIELD: cods};
  }
}

class MediaServerInfo extends Machine {
  static const ONLINE_USERS_FIELDS = 'online_users';

  OnlineUsers onlineUsers;

  MediaServerInfo(
      {double cpu,
      double gpu,
      String loadAverage,
      int memoryTotal,
      int memoryFree,
      int hddTotal,
      int hddFree,
      int bandwidthIn,
      int bandwidthOut,
      int uptime,
      int timestamp,
      int totalBytesIn,
      int totalBytesOut,
      int syncTime,
      String version,
      String project,
      ServerStatus status,
      int expirationTime,
      OperationSystem os,
      OnlineUsers onlineUsers})
      : onlineUsers = onlineUsers,
        super(
            cpu: cpu,
            gpu: gpu,
            loadAverage: loadAverage,
            memoryTotal: memoryTotal,
            memoryFree: memoryFree,
            hddTotal: hddTotal,
            hddFree: hddFree,
            bandwidthIn: bandwidthIn,
            bandwidthOut: bandwidthOut,
            timestamp: timestamp,
            uptime: uptime,
            totalBytesIn: totalBytesIn,
            totalBytesOut: totalBytesOut,
            syncTime: syncTime,
            version: version,
            project: project,
            status: status,
            expirationTime: expirationTime,
            os: os);

  factory MediaServerInfo.fromJson(Map<String, dynamic> json) {
    final Machine mach = Machine.fromJson(json);
    final onlineUsers = OnlineUsers.fromJson(json[ONLINE_USERS_FIELDS]);
    return MediaServerInfo(
        cpu: mach.cpu,
        gpu: mach.gpu,
        loadAverage: mach.loadAverage,
        memoryTotal: mach.memoryTotal,
        memoryFree: mach.memoryFree,
        hddTotal: mach.hddTotal,
        hddFree: mach.hddFree,
        bandwidthIn: mach.bandwidthIn,
        bandwidthOut: mach.bandwidthOut,
        uptime: mach.uptime,
        timestamp: mach.timestamp,
        syncTime: mach.syncTime,
        version: mach.version,
        project: mach.project,
        status: mach.status,
        expirationTime: mach.expirationTime,
        os: mach.os,
        onlineUsers: onlineUsers);
  }

  Map<String, dynamic> toJson() {
    return {ONLINE_USERS_FIELDS: onlineUsers?.toJson()};
  }
}

class Server extends MediaServerInfo {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';

  static const HOST_FIELD = 'host';
  static const HTTP_HOST_FIELD = 'http_host';
  static const VODS_HOST_FIELD = 'vods_host';
  static const CODS_HOST_FIELD = 'cods_host';
  static const NGINX_HOST_FIELD = 'nginx_host';
  static const RTMP_HOST_FILED = 'rtmp_host';
  static const FEEDBACK_DIRECOTRY_FIELD = 'feedback_directory';
  static const TIMESHIFTS_DIRECTORY_FIELD = 'timeshifts_directory';
  static const HLS_DIRECTORY_FIELD = 'hls_directory';
  static const VODS_DIRECTORY_FIELD = 'vods_directory';
  static const CODS_DIRECTORY_FIELD = 'cods_directory';
  static const PROXY_DIRECTORY_FIELD = 'proxy_directory';
  static const PROVIDERS_FIELD = 'providers';
  static const AUTO_START_FIELD = 'auto_start';
  static const ACTIVATION_KEY_FIELD = 'activation_key';
  static const MONITORING_FIELD = 'monitoring';

  static const String DEFAULT_SERVER_NAME = 'Server';
  static const String DEFAULT_FEEDBACK_DIR = '~/streamer/feedback';
  static const String DEFAULT_TIMESHIFTS_DIR = '~/streamer/timeshifts';
  static const String DEFAULT_HLS_DIR = '~/streamer/hls';
  static const String DEFAULT_VODS_DIR = '~/streamer/vods';
  static const String DEFAULT_CODS_DIR = '~/streamer/cods';
  static const String DEFAULT_PROXY_DIR = '~/streamer/proxy';

  static const MIN_NAME_LENGTH = ServiceName.MIN_LENGTH;
  static const MAX_NAME_LENGTH = ServiceName.MAX_LENGTH;

  final String id;
  String name;
  HostAndPort host;
  HostAndPort httpHost;
  HostAndPort vodsHost;
  HostAndPort codsHost;
  HostAndPort nginxHost;
  HostAndPort rtmpHost;
  String feedbackDirectory;
  String timeshiftsDirectory;
  String hlsDirectory;
  String vodsDirectory;
  String codsDirectory;
  String proxyDirectory;
  bool monitoring;
  bool autoStart;
  List<ServerProvider> providers;

  // optional
  Optional<String> _activationKey = Optional<String>.absent();

  Server(
      {@required this.id,
      @required this.name,
      @required this.host,
      @required this.httpHost,
      @required this.vodsHost,
      @required this.codsHost,
      @required this.nginxHost,
      @required this.rtmpHost,
      @required this.feedbackDirectory,
      @required this.timeshiftsDirectory,
      @required this.hlsDirectory,
      @required this.vodsDirectory,
      @required this.codsDirectory,
      @required this.proxyDirectory,
      @required this.providers,
      @required this.monitoring,
      @required this.autoStart,
      String activationKey,
      double cpu,
      double gpu,
      String loadAverage,
      int memoryTotal,
      int memoryFree,
      int hddTotal,
      int hddFree,
      int bandwidthIn,
      int bandwidthOut,
      int uptime,
      int timestamp,
      int totalBytesIn,
      int totalBytesOut,
      int syncTime,
      String version,
      String project,
      ServerStatus status,
      int expirationTime,
      OperationSystem os,
      OnlineUsers onlineUsers})
      : _activationKey = Optional<String>.fromNullable(activationKey),
        super(
            cpu: cpu,
            gpu: gpu,
            loadAverage: loadAverage,
            memoryTotal: memoryTotal,
            memoryFree: memoryFree,
            hddTotal: hddTotal,
            hddFree: hddFree,
            bandwidthIn: bandwidthIn,
            bandwidthOut: bandwidthOut,
            timestamp: timestamp,
            uptime: uptime,
            totalBytesIn: totalBytesIn,
            totalBytesOut: totalBytesOut,
            syncTime: syncTime,
            version: version,
            project: project,
            status: status,
            expirationTime: expirationTime,
            os: os,
            onlineUsers: onlineUsers);

  Server.createDefault()
      : id = null,
        name = DEFAULT_SERVER_NAME,
        host = HostAndPort.createLocalHostV4(port: 6317),
        httpHost = HostAndPort.createDefaultRouteHostV4(port: 8000),
        vodsHost = HostAndPort.createDefaultRouteHostV4(port: 7000),
        codsHost = HostAndPort.createDefaultRouteHostV4(port: 6001),
        nginxHost = HostAndPort.createDefaultRouteHostV4(port: 81),
        rtmpHost = HostAndPort.createDefaultRouteHostV4(port: 1935),
        feedbackDirectory = DEFAULT_FEEDBACK_DIR,
        timeshiftsDirectory = DEFAULT_TIMESHIFTS_DIR,
        hlsDirectory = DEFAULT_HLS_DIR,
        vodsDirectory = DEFAULT_VODS_DIR,
        codsDirectory = DEFAULT_CODS_DIR,
        proxyDirectory = DEFAULT_PROXY_DIR,
        monitoring = false,
        autoStart = false,
        providers = [];

  Server copy() {
    return Server(
        id: id,
        name: name,
        host: host.copy(),
        httpHost: httpHost.copy(),
        vodsHost: vodsHost.copy(),
        codsHost: codsHost.copy(),
        nginxHost: nginxHost.copy(),
        rtmpHost: rtmpHost.copy(),
        feedbackDirectory: feedbackDirectory,
        timeshiftsDirectory: timeshiftsDirectory,
        hlsDirectory: hlsDirectory,
        vodsDirectory: vodsDirectory,
        codsDirectory: codsDirectory,
        proxyDirectory: proxyDirectory,
        monitoring: monitoring,
        autoStart: autoStart,
        providers: providers,
        activationKey: activationKey);
  }

  bool isValid() {
    bool req = name.isValidServiceName() &&
        host.isValid() &&
        httpHost.isValid() &&
        vodsHost.isValid() &&
        codsHost.isValid() &&
        nginxHost.isValid() &&
        rtmpHost.isValid() &&
        feedbackDirectory.isNotEmpty &&
        timeshiftsDirectory.isNotEmpty &&
        hlsDirectory.isNotEmpty &&
        vodsDirectory.isNotEmpty &&
        codsDirectory.isNotEmpty &&
        proxyDirectory.isNotEmpty;

    if (req && _activationKey.isPresent) {
      req &= _activationKey.value.isValidActivationKey();
    }
    return req;
  }

  bool isPro() {
    return isActive() && (project == 'FastoCloud PRO' || project == 'FastoCloud PRO ML');
  }

  bool isActive() {
    return status == ServerStatus.ACTIVE;
  }

  String get activationKey {
    return _activationKey.orNull;
  }

  set activationKey(String key) {
    _activationKey = Optional<String>.fromNullable(key);
  }

  factory Server.fromJson(Map<String, dynamic> json) {
    List<ServerProvider> _providers = [];
    json[PROVIDERS_FIELD].forEach((element) {
      _providers.add(ServerProvider.fromJson(element));
    });

    final String id = json[ID_FIELD];
    final MediaServerInfo media = MediaServerInfo.fromJson(json);

    String activationKey;
    if (json.containsKey(ACTIVATION_KEY_FIELD)) {
      activationKey = json[ACTIVATION_KEY_FIELD];
    }

    return Server(
        id: id,
        name: json[NAME_FIELD],
        host: HostAndPort.fromJson(json[HOST_FIELD]),
        httpHost: HostAndPort.fromJson(json[HTTP_HOST_FIELD]),
        vodsHost: HostAndPort.fromJson(json[VODS_HOST_FIELD]),
        codsHost: HostAndPort.fromJson(json[CODS_HOST_FIELD]),
        nginxHost: HostAndPort.fromJson(json[NGINX_HOST_FIELD]),
        rtmpHost: HostAndPort.fromJson(json[RTMP_HOST_FILED]),
        feedbackDirectory: json[FEEDBACK_DIRECOTRY_FIELD],
        timeshiftsDirectory: json[TIMESHIFTS_DIRECTORY_FIELD],
        hlsDirectory: json[HLS_DIRECTORY_FIELD],
        vodsDirectory: json[VODS_DIRECTORY_FIELD],
        codsDirectory: json[CODS_DIRECTORY_FIELD],
        proxyDirectory: json[PROXY_DIRECTORY_FIELD],
        providers: _providers,
        monitoring: json[MONITORING_FIELD],
        autoStart: json[AUTO_START_FIELD],
        activationKey: activationKey,
        gpu: media.gpu,
        cpu: media.cpu,
        loadAverage: media.loadAverage,
        memoryTotal: media.memoryTotal,
        memoryFree: media.memoryFree,
        hddTotal: media.hddTotal,
        hddFree: media.hddFree,
        bandwidthIn: media.bandwidthIn,
        bandwidthOut: media.bandwidthOut,
        version: media.version,
        project: media.project,
        uptime: media.uptime,
        syncTime: media.syncTime,
        timestamp: media.timestamp,
        status: media.status,
        onlineUsers: media.onlineUsers,
        os: media.os,
        expirationTime: media.expirationTime);
  }

  Map<String, dynamic> toJson() {
    final _providersJson = [];
    providers.forEach((element) {
      _providersJson.add(element.toJson());
    });

    Map<String, dynamic> result = super.toJson();
    result[ID_FIELD] = id;
    result[NAME_FIELD] = name;
    result[HOST_FIELD] = host.toJson();
    result[PROVIDERS_FIELD] = providers;
    result[HOST_FIELD] = host.toJson();
    result[HTTP_HOST_FIELD] = httpHost.toJson();
    result[VODS_HOST_FIELD] = vodsHost.toJson();
    result[CODS_HOST_FIELD] = codsHost.toJson();
    result[NGINX_HOST_FIELD] = nginxHost.toJson();
    result[RTMP_HOST_FILED] = rtmpHost.toJson();
    result[FEEDBACK_DIRECOTRY_FIELD] = feedbackDirectory;
    result[TIMESHIFTS_DIRECTORY_FIELD] = timeshiftsDirectory;
    result[HLS_DIRECTORY_FIELD] = hlsDirectory;
    result[VODS_DIRECTORY_FIELD] = vodsDirectory;
    result[CODS_DIRECTORY_FIELD] = codsDirectory;
    result[PROXY_DIRECTORY_FIELD] = proxyDirectory;
    result[MONITORING_FIELD] = monitoring;
    result[AUTO_START_FIELD] = autoStart;
    if (_activationKey.isPresent) {
      result[ACTIVATION_KEY_FIELD] = _activationKey.value;
    }
    return result;
  }

  ProviderRole getProviderRoleById(String pid) {
    for (final ServerProvider provider in providers) {
      if (provider.id == pid) {
        return provider.role;
      }
    }
    return ProviderRole.READ;
  }

  Optional<Uri> generateRtmpUrl(String streamName, {String protocol = 'rtmp', String root = 'live'}) {
    if (streamName == null) {
      return Optional<Uri>.absent();
    }

    List<String> segments = [root, streamName];
    Uri rtmp = Uri(scheme: protocol, host: rtmpHost.host, port: rtmpHost.port, pathSegments: segments);
    return Optional<Uri>.of(rtmp);
  }

  Optional<Uri> generateNginxUrl(String httpUrl, {String root = 'fastocloud'}) {
    Uri original = Uri.tryParse(httpUrl);
    if (original == null) {
      return Optional<Uri>.absent();
    }
    List<String> parts;
    if (original.port == httpHost.port) {
      parts = hlsDirectory.split('/');
    } else if (original.port == vodsHost.port) {
      parts = vodsDirectory.split('/');
    } else if (original.port == codsHost.port) {
      parts = codsDirectory.split('/');
    }

    if (parts == null || parts.isEmpty) {
      return Optional<Uri>.absent();
    }

    List<String> segments = [root] + [parts.last] + original.pathSegments;
    Uri nginx = Uri(scheme: 'http', host: nginxHost.host, port: nginxHost.port, pathSegments: segments);
    return Optional<Uri>.of(nginx);
  }

  Optional<Uri> generateHttpProxyUrl(String filePath, {String root = 'fastocloud'}) {
    if (filePath == null) {
      return Optional<Uri>.absent();
    }

    List<String> parts = proxyDirectory.split('/');
    if (parts == null || parts.isEmpty) {
      return Optional<Uri>.absent();
    }

    final int repalced = filePath.indexOf(parts.last);
    if (repalced == -1) {
      return Optional<Uri>.absent();
    }

    final stabled = filePath.substring(repalced).split('/');
    List<String> segments = [root] + stabled;
    Uri nginx = Uri(scheme: 'http', host: nginxHost.host, port: nginxHost.port, pathSegments: segments);
    return Optional<Uri>.of(nginx);
  }

  HttpOutputUrl genTemplateHLSHttpOutputUrl(int id) {
    return HttpOutputUrl(
        id: 0,
        uri: 'http://${httpHost.toString()}/master.m3u8',
        httpRoot: hlsDirectory,
        hlsType: HlsType.HLS_PULL,
        hlsSinkType: HlsSinkType.HLSSINK);
  }

  HttpOutputUrl genTemplateCodsHttpOutputUrl(int id) {
    return HttpOutputUrl(
        id: 0,
        uri: 'http://${codsHost.toString()}/master.m3u8',
        httpRoot: codsDirectory,
        hlsType: HlsType.HLS_PULL,
        hlsSinkType: HlsSinkType.HLSSINK);
  }

  HttpOutputUrl genTemplateVodsHttpOutputUrl(int id) {
    return HttpOutputUrl(
        id: 0,
        uri: 'http://${vodsHost.toString()}/master.m3u8',
        httpRoot: vodsDirectory,
        hlsType: HlsType.HLS_PULL,
        hlsSinkType: HlsSinkType.HLSSINK);
  }

  IStream createDefault(StreamType type, String streamLogoIcon, String vodTrailerUrl) {
    if (type == StreamType.PROXY) {
      return ProxyStream.create(icon: streamLogoIcon);
    } else if (type == StreamType.VOD_PROXY) {
      return VodProxyStream.create(primeDate: 0, icon: streamLogoIcon, trailerUrl: vodTrailerUrl);
    } else if (type == StreamType.RELAY) {
      final relay = RelayStream.create(icon: streamLogoIcon);
      relay.output = [genTemplateHLSHttpOutputUrl(0)];
      return relay;
    } else if (type == StreamType.ENCODE) {
      final encode = EncodeStream.create(icon: streamLogoIcon);
      encode.output = [genTemplateHLSHttpOutputUrl(0)];
      return encode;
    } else if (type == StreamType.TIMESHIFT_RECORDER) {
      return TimeshiftRecorderStream.create(icon: streamLogoIcon);
    } else if (type == StreamType.TIMESHIFT_PLAYER) {
      final time = TimeshiftPlayerStream.create(icon: streamLogoIcon);
      time.output = [genTemplateHLSHttpOutputUrl(0)];
      return time;
    } else if (type == StreamType.CATCHUP) {
      final cat = CatchupStream.create(icon: streamLogoIcon);
      cat.output = [genTemplateHLSHttpOutputUrl(0)];
      return cat;
    } else if (type == StreamType.TEST_LIFE) {
      return TestLifeStream.create(icon: streamLogoIcon);
    } else if (type == StreamType.VOD_RELAY) {
      final vod = VodRelayStream.create(primeDate: 0, icon: streamLogoIcon, trailerUrl: vodTrailerUrl);
      vod.output = [genTemplateVodsHttpOutputUrl(0)];
      return vod;
    } else if (type == StreamType.VOD_ENCODE) {
      final vod = VodEncodeStream.create(primeDate: 0, icon: streamLogoIcon, trailerUrl: vodTrailerUrl);
      vod.output = [genTemplateVodsHttpOutputUrl(0)];
      return vod;
    } else if (type == StreamType.COD_RELAY) {
      final cod = CodRelayStream.create(icon: streamLogoIcon);
      cod.output = [genTemplateCodsHttpOutputUrl(0)];
      return cod;
    } else if (type == StreamType.COD_ENCODE) {
      final cod = CodEncodeStream.create(icon: streamLogoIcon);
      cod.output = [genTemplateCodsHttpOutputUrl(0)];
      return cod;
    }
    final event = EventStream.create(primeDate: 0, icon: streamLogoIcon, trailerUrl: vodTrailerUrl);
    event.output = [genTemplateVodsHttpOutputUrl(0)];
    return event;
  }
}
