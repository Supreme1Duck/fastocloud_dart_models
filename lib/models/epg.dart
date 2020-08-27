import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/machine.dart';
import 'package:fastocloud_dart_models/models/server_base.dart';
import 'package:fastocloud_dart_models/models/server_provider.dart';
import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class OnlineUsers {
  static const DAEMON_FIELD = 'daemon';

  final int daemon;

  OnlineUsers({this.daemon});

  factory OnlineUsers.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final daemon = json[DAEMON_FIELD];
    return OnlineUsers(daemon: daemon);
  }

  Map<String, dynamic> toJson() {
    return {DAEMON_FIELD: daemon};
  }
}

class EpgServerInfo extends Machine {
  static const ONLINE_USERS_FIELDS = 'online_users';

  OnlineUsers onlineUsers;

  EpgServerInfo(
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

  factory EpgServerInfo.fromJson(Map<String, dynamic> json) {
    final Machine mach = Machine.fromJson(json);
    final onlineUsers = OnlineUsers.fromJson(json[ONLINE_USERS_FIELDS]);
    return EpgServerInfo(
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

class Epg extends EpgServerInfo {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const HOST_FIELD = 'host';
  static const PROVIDERS_FIELD = 'providers';
  static const AUTO_START_FIELD = 'auto_start';
  static const ACTIVATION_KEY_FIELD = 'activation_key';
  static const MONITORING_FIELD = 'monitoring';

  static const String DEFAULT_SERVER_NAME = 'Epg';  
  static const MIN_NAME_LENGTH = ServiceName.MIN_LENGTH;
  static const MAX_NAME_LENGTH = ServiceName.MAX_LENGTH;

  final String id;
  String name;
  HostAndPort host;
  bool monitoring;
  bool autoStart;
  List<ServerProvider> providers;

  // optional
  Optional<String> _activationKey = Optional<String>.absent();

  Epg(
      {@required this.id,
      @required this.name,
      @required this.host,
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
      int syncTime,
      int totalBytesIn,
      int totalBytesOut,
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

  Epg.createDefault()
      : id = null,
        name = DEFAULT_SERVER_NAME,
        host = HostAndPort.createLocalHostV4(port: 4317),
        monitoring = false,
        autoStart = false,
        providers = [];

  Epg copy() {
    return Epg(
        id: id,
        name: name,
        host: host.copy(),
        providers: providers,
        autoStart: autoStart,
        monitoring: monitoring,
        activationKey: activationKey);
  }

  bool isActive() {
    return status == ServerStatus.ACTIVE;
  }

  bool isValid() {
    bool req = name.isValidServiceName() && host.isValid();
    if (req && _activationKey.isPresent) {
      req &= _activationKey.value.isValidActivationKey();
    }
    return req;
  }

  String get activationKey {
    return _activationKey.orNull;
  }

  set activationKey(String key) {
    _activationKey = Optional<String>.fromNullable(key);
  }

  factory Epg.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final _json = json[PROVIDERS_FIELD];
    List<ServerProvider> _providers = [];
    _json.forEach((element) => _providers.add(ServerProvider.fromJson(element)));

    String activationKey;
    if (json.containsKey(ACTIVATION_KEY_FIELD)) {
      activationKey = json[ACTIVATION_KEY_FIELD];
    }

    final EpgServerInfo epg = EpgServerInfo.fromJson(json);
    return Epg(
        id: id,
        name: json[NAME_FIELD],
        host: HostAndPort.fromJson(json[HOST_FIELD]),
        providers: _providers,
        monitoring: json[MONITORING_FIELD],
        activationKey: activationKey,
        autoStart: json[AUTO_START_FIELD],
        cpu: epg.cpu,
        loadAverage: epg.loadAverage,
        memoryTotal: epg.memoryTotal,
        memoryFree: epg.memoryFree,
        hddTotal: epg.hddTotal,
        hddFree: epg.hddFree,
        bandwidthIn: epg.bandwidthIn,
        bandwidthOut: epg.bandwidthOut,
        version: epg.version,
        project: epg.project,
        uptime: epg.uptime,
        syncTime: epg.syncTime,
        timestamp: epg.timestamp,
        status: epg.status,
        onlineUsers: epg.onlineUsers,
        os: epg.os,
        expirationTime: epg.expirationTime);
  }

  Map<String, dynamic> toJson() {
    final _providersJson = [];
    providers.forEach((element) => _providersJson.add(element.toJson()));
    Map<String, dynamic> result = super.toJson();
    result[ID_FIELD] = id;
    result[NAME_FIELD] = name;
    result[HOST_FIELD] = host.toJson();
    result[PROVIDERS_FIELD] = providers;
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
}
