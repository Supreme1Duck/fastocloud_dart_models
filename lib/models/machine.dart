import 'package:fastocloud_dart_models/models/server_base.dart';

class Machine {
  static const CPU_FIELD = 'cpu';
  static const GPU_FIELD = 'gpu';
  static const LOAD_AVERAGE_FIELD = 'load_average';
  static const MEMORY_TOTAL_FIELD = 'memory_total';
  static const MEMORY_FREE_FIELD = 'memory_free';
  static const HDD_TOTAL_FIELD = 'hdd_total';
  static const HDD_FREE_FIELD = 'hdd_free';
  static const BANDWIDTH_IN_FIELD = 'bandwidth_in';
  static const BANDWIDTH_OUT_FIELD = 'bandwidth_out';
  static const UPTIME_FIELD = 'uptime';
  static const TIMESTAMP_FIELD = 'timestamp';

  static const SYNCTIME_FIELD = 'synctime';
  static const PROJECT_FIELD = 'project';
  static const VERSION_FIELD = 'version';
  static const STATUS_FIELD = 'status';
  static const EXP_TIME = 'expiration_time';
  static const OS_FIELD = 'os';

  double cpu;
  double gpu;
  String loadAverage;
  int memoryTotal;
  int memoryFree;
  int hddTotal;
  int hddFree;
  int bandwidthIn;
  int bandwidthOut;
  int uptime;
  int timestamp;

  int synctime;
  String version;
  String project;
  ServerStatus status;
  int expirationTime;
  OperationSystem os;

  Machine(
      {this.cpu,
      this.gpu,
      this.loadAverage,
      this.memoryTotal,
      this.memoryFree,
      this.hddTotal,
      this.hddFree,
      this.bandwidthIn,
      this.bandwidthOut,
      this.timestamp,
      this.uptime,
      this.synctime,
      this.version,
      this.project,
      this.status,
      this.expirationTime,
      this.os});

  factory Machine.fromJson(Map<String, dynamic> json) {
    final gpu = json[GPU_FIELD];
    final cpu = json[CPU_FIELD];
    final loadAverage = json[LOAD_AVERAGE_FIELD];
    final memoryTotal = json[MEMORY_TOTAL_FIELD];
    final memoryFree = json[MEMORY_FREE_FIELD];
    final hddTotal = json[HDD_TOTAL_FIELD];
    final hddFree = json[HDD_FREE_FIELD];
    final bandwidthIn = json[BANDWIDTH_IN_FIELD];
    final bandwidthOut = json[BANDWIDTH_OUT_FIELD];
    final uptime = json[UPTIME_FIELD];
    final timestamp = json[TIMESTAMP_FIELD];

    final version = json[VERSION_FIELD];
    final project = json[PROJECT_FIELD];
    final synctime = json[SYNCTIME_FIELD];
    final status = ServerStatus.fromInt(json[STATUS_FIELD]);
    final os = OperationSystem.fromJson(json[OS_FIELD]);
    final expirationTime = json[EXP_TIME];

    return Machine(
        gpu: gpu,
        cpu: cpu,
        loadAverage: loadAverage,
        memoryTotal: memoryTotal,
        memoryFree: memoryFree,
        hddTotal: hddTotal,
        hddFree: hddFree,
        bandwidthIn: bandwidthIn,
        bandwidthOut: bandwidthOut,
        uptime: uptime,
        timestamp: timestamp,
        synctime: synctime,
        version: version,
        project: project,
        status: status,
        expirationTime: expirationTime,
        os: os);
  }

  Map<String, dynamic> toJson() {
    return {
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
      OS_FIELD: os?.toJson(),
      EXP_TIME: expirationTime
    };
  }
}
