import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/server_base.dart';
import 'package:meta/meta.dart';

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

class Epg {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const HOST_FIELD = 'host';
  static const PROVIDERS_FIELD = 'providers';

  static const String DEFAULT_SERVER_NAME = 'Epg';

  static const CPU_FIELD = 'cpu';
  static const LOAD_AVERAGE_FIELD = 'load_average';
  static const MEMORY_TOTAL_FIELD = 'memory_total';
  static const MEMORY_FREE_FIELD = 'memory_free';
  static const HDD_TOTAL_FIELD = 'hdd_total';
  static const HDD_FREE_FIELD = 'hdd_free';
  static const BANDWIDTH_IN_FIELD = 'bandwidth_in';
  static const BANDWIDTH_OUT_FIELD = 'bandwidth_out';
  static const PROJECT_FIELD = 'project';
  static const VERSION_FIELD = 'version';
  static const UPTIME_FIELD = 'uptime';
  static const SYNCTIME_FIELD = 'synctime';
  static const TIMESTAMP_FIELD = 'timestamp';
  static const STATUS_FIELD = 'status';
  static const ONLINE_USERS_FIELDS = 'online_users';
  static const EXP_TIME = 'expiration_time';
  static const OS_FIELD = 'os';

  final String id;
  String name;
  HostAndPort host;
  List<ServerProvider> providers;

  double cpu;
  String loadAverage;
  int memoryTotal;
  int memoryFree;
  int hddTotal;
  int hddFree;
  int bandwidthIn;
  int bandwidthOut;
  String version;
  String project;
  int uptime;
  int synctime;
  int timestamp;
  ServerStatus status;
  OnlineUsers onlineUsers;
  OperationSystem os;
  int expirationTime;

  Epg(
      {@required this.id,
      @required this.name,
      @required this.host,
      @required this.providers,
      this.cpu,
      this.loadAverage,
      this.memoryTotal,
      this.memoryFree,
      this.hddTotal,
      this.hddFree,
      this.bandwidthIn,
      this.bandwidthOut,
      this.version,
      this.project,
      this.uptime,
      this.synctime,
      this.timestamp,
      this.status,
      this.onlineUsers,
      this.os,
      this.expirationTime});

  Epg.createDefault()
      : id = null,
        name = DEFAULT_SERVER_NAME,
        host = HostAndPort.createLocalHostV4(port: 4317),
        providers = [];

  Epg copy() {
    return Epg(id: id, name: name, host: host.copy(), providers: providers);
  }

  bool isActive() {
    return status == ServerStatus.ACTIVE;
  }

  bool isValid() {
    return name.isNotEmpty && host.isValid();
  }

  factory Epg.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final _json = json[PROVIDERS_FIELD];
    List<ServerProvider> _providers = [];
    _json.forEach((element) => _providers.add(ServerProvider.fromJson(element)));

    final cpu = json[CPU_FIELD];
    final loadAverage = json[LOAD_AVERAGE_FIELD];
    final memoryTotal = json[MEMORY_TOTAL_FIELD];
    final memoryFree = json[MEMORY_FREE_FIELD];
    final hddTotal = json[HDD_TOTAL_FIELD];
    final hddFree = json[HDD_FREE_FIELD];
    final bandwidthIn = json[BANDWIDTH_IN_FIELD];
    final bandwidthOut = json[BANDWIDTH_OUT_FIELD];
    final version = json[VERSION_FIELD];
    final project = json[PROJECT_FIELD];
    final uptime = json[UPTIME_FIELD];
    final synctime = json[SYNCTIME_FIELD];
    final timestamp = json[TIMESTAMP_FIELD];
    final status = ServerStatus.fromInt(json[STATUS_FIELD]);
    final onlineUsers = OnlineUsers.fromJson(json[ONLINE_USERS_FIELDS]);
    final os = OperationSystem.fromJson(json[OS_FIELD]);
    final expirationTime = json[EXP_TIME];
    return Epg(
        id: id,
        name: json[NAME_FIELD],
        host: HostAndPort.fromJson(json[HOST_FIELD]),
        providers: _providers,
        cpu: cpu,
        loadAverage: loadAverage,
        memoryTotal: memoryTotal,
        memoryFree: memoryFree,
        hddTotal: hddTotal,
        hddFree: hddFree,
        bandwidthIn: bandwidthIn,
        bandwidthOut: bandwidthOut,
        version: version,
        project: project,
        uptime: uptime,
        synctime: synctime,
        timestamp: timestamp,
        status: status,
        onlineUsers: onlineUsers,
        os: os,
        expirationTime: expirationTime);
  }

  Map<String, dynamic> toJson() {
    final _providersJson = [];
    providers.forEach((element) => _providersJson.add(element.toJson()));

    return {
      ID_FIELD: id,
      NAME_FIELD: name,
      HOST_FIELD: host.toJson(),
      PROVIDERS_FIELD: providers,
      CPU_FIELD: cpu,
      LOAD_AVERAGE_FIELD: loadAverage,
      MEMORY_TOTAL_FIELD: memoryTotal,
      MEMORY_FREE_FIELD: memoryFree,
      HDD_TOTAL_FIELD: hddTotal,
      HDD_FREE_FIELD: hddFree,
      BANDWIDTH_IN_FIELD: bandwidthIn,
      BANDWIDTH_OUT_FIELD: bandwidthOut,
      VERSION_FIELD: version,
      PROJECT_FIELD: project,
      UPTIME_FIELD: uptime,
      SYNCTIME_FIELD: synctime,
      TIMESTAMP_FIELD: timestamp,
      STATUS_FIELD: status?.toInt(),
      ONLINE_USERS_FIELDS: onlineUsers?.toJson(),
      OS_FIELD: os?.toJson(),
      EXP_TIME: expirationTime
    };
  }
}
