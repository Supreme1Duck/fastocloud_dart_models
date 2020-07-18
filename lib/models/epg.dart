import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/machine.dart';
import 'package:fastocloud_dart_models/models/server_base.dart';
import 'package:fastocloud_dart_models/models/server_provider.dart';
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
      int synctime,
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
            synctime: synctime,
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
        synctime: mach.synctime,
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

  static const String DEFAULT_SERVER_NAME = 'Epg';

  final String id;
  String name;
  HostAndPort host;
  List<ServerProvider> providers;

  Epg(
      {@required this.id,
      @required this.name,
      @required this.host,
      @required this.providers,
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
      int synctime,
      String version,
      String project,
      ServerStatus status,
      int expirationTime,
      OperationSystem os,
      OnlineUsers onlineUsers})
      : super(
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
            synctime: synctime,
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

    final EpgServerInfo epg = EpgServerInfo.fromJson(json);
    return Epg(
        id: id,
        name: json[NAME_FIELD],
        host: HostAndPort.fromJson(json[HOST_FIELD]),
        providers: _providers,
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
        synctime: epg.synctime,
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
