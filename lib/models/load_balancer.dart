import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/machine.dart';
import 'package:fastocloud_dart_models/models/server_base.dart';
import 'package:fastocloud_dart_models/models/server_provider.dart';
import 'package:meta/meta.dart';

class OnlineUsers {
  static const DAEMON_FIELD = 'daemon';
  static const SUBSCRIBERS_FIELD = 'subscribers';

  final int daemon;
  final int subscribers;

  OnlineUsers({this.daemon, this.subscribers});

  factory OnlineUsers.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final daemon = json[DAEMON_FIELD];
    final subscribers = json[SUBSCRIBERS_FIELD];
    return OnlineUsers(daemon: daemon, subscribers: subscribers);
  }

  Map<String, dynamic> toJson() {
    return {DAEMON_FIELD: daemon, SUBSCRIBERS_FIELD: subscribers};
  }
}

class LoadBalanceServerInfo extends Machine {
  static const ONLINE_USERS_FIELDS = 'online_users';

  OnlineUsers onlineUsers;

  LoadBalanceServerInfo(
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
            syncTime: syncTime,
            version: version,
            project: project,
            status: status,
            expirationTime: expirationTime,
            os: os);

  factory LoadBalanceServerInfo.fromJson(Map<String, dynamic> json) {
    final Machine mach = Machine.fromJson(json);
    final onlineUsers = OnlineUsers.fromJson(json[ONLINE_USERS_FIELDS]);
    return LoadBalanceServerInfo(
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

class LoadBalancer extends LoadBalanceServerInfo {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const HOST_FIELD = 'host';
  static const CLIENTS_HOST = 'clients_host';
  static const CATCHUPS_HOST_FIELD = 'catchups_host';
  static const CATCHUPS_HTTP_ROOT_FIELD = 'catchups_http_root';
  static const PROVIDERS_FIELD = 'providers';

  static const String DEFAULT_SERVER_NAME = 'Load Balancer';
  static const String DEFAULT_CATHUPS_HTTP_DIR = '~/streamer/hls';

  final String id;
  String name;
  HostAndPort host;
  HostAndPort clientsHost;
  HostAndPort catchupsHost;
  String catchupsHttpRoot;
  List<ServerProvider> providers;

  LoadBalancer(
      {@required this.id,
      @required this.name,
      @required this.host,
      @required this.clientsHost,
      @required this.catchupsHost,
      @required this.catchupsHttpRoot,
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
      int syncTime,
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
            syncTime: syncTime,
            version: version,
            project: project,
            status: status,
            expirationTime: expirationTime,
            os: os,
            onlineUsers: onlineUsers);

  LoadBalancer.createDefault()
      : id = null,
        name = DEFAULT_SERVER_NAME,
        host = HostAndPort.createLocalHostV4(port: 5317),
        clientsHost = HostAndPort.createDefaultRouteHostV4(port: 6000),
        catchupsHost = HostAndPort.createDefaultRouteHostV4(port: 8000),
        catchupsHttpRoot = DEFAULT_CATHUPS_HTTP_DIR,
        providers = [];

  LoadBalancer copy() {
    return LoadBalancer(
        id: id,
        name: name,
        host: host.copy(),
        clientsHost: clientsHost.copy(),
        catchupsHost: catchupsHost.copy(),
        catchupsHttpRoot: catchupsHttpRoot,
        providers: providers);
  }

  bool isActive() {
    return status == ServerStatus.ACTIVE;
  }

  bool isValid() {
    return name.isNotEmpty &&
        host.isValid() &&
        clientsHost.isValid() &&
        catchupsHost.isValid() &&
        catchupsHttpRoot.isNotEmpty;
  }

  factory LoadBalancer.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final _json = json[PROVIDERS_FIELD];
    List<ServerProvider> _providers = [];
    _json.forEach((element) => _providers.add(ServerProvider.fromJson(element)));

    final LoadBalanceServerInfo load = LoadBalanceServerInfo.fromJson(json);
    return LoadBalancer(
        id: id,
        name: json[NAME_FIELD],
        host: HostAndPort.fromJson(json[HOST_FIELD]),
        clientsHost: HostAndPort.fromJson(json[CLIENTS_HOST]),
        catchupsHost: HostAndPort.fromJson(json[CATCHUPS_HOST_FIELD]),
        catchupsHttpRoot: json[CATCHUPS_HTTP_ROOT_FIELD],
        providers: _providers,
        cpu: load.cpu,
        loadAverage: load.loadAverage,
        memoryTotal: load.memoryTotal,
        memoryFree: load.memoryFree,
        hddTotal: load.hddTotal,
        hddFree: load.hddFree,
        bandwidthIn: load.bandwidthIn,
        bandwidthOut: load.bandwidthOut,
        version: load.version,
        project: load.project,
        uptime: load.uptime,
        syncTime: load.syncTime,
        timestamp: load.timestamp,
        status: load.status,
        onlineUsers: load.onlineUsers,
        os: load.os,
        expirationTime: load.expirationTime);
  }

  Map<String, dynamic> toJson() {
    final _providersJson = [];
    providers.forEach((element) => _providersJson.add(element.toJson()));

    Map<String, dynamic> result = super.toJson();
    result[ID_FIELD] = id;
    result[NAME_FIELD] = name;
    result[HOST_FIELD] = host.toJson();
    result[PROVIDERS_FIELD] = providers;
    result[CLIENTS_HOST] = clientsHost.toJson();
    result[CATCHUPS_HOST_FIELD] = catchupsHost.toJson();
    result[CATCHUPS_HTTP_ROOT_FIELD] = catchupsHttpRoot;
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
