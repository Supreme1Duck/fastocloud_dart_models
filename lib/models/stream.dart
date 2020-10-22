import 'package:fastocloud_dart_models/common/utils.dart';
import 'package:fastocloud_dart_models/models/base.dart';
import 'package:fastocloud_dart_models/models/input_urls.dart';
import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:fastocloud_dart_models/models/types.dart';
import 'package:fastotv_dart/commands_info/meta_url.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class StreamRuntimeStats {
  static const STATUS_FIELD = 'status';
  static const CPU_FIELD = 'cpu';
  static const TIMESTAMP_FIELD = 'timestamp';
  static const IDLE_TIME_FIELD = 'idle_time';
  static const LOOP_START_TIME_FIELD = 'loop_start_time';
  static const RSS_FIELD = 'rss';
  static const RESTARTS_FIELD = 'restarts';
  static const START_TIME_FIELD = 'start_time';
  static const INPUT_STREAMS_FIELD = 'input_streams';
  static const OUTPUT_STREAMS_FIELD = 'output_streams';
  static const QUALITY_FIELD = 'quality';

  StreamStatus status = StreamStatus.NEW;
  double cpu = 0.0;
  int timestamp = 0;
  int idleTime = 0;
  int rss = 0;
  int loopStartTime = 0;
  int restarts = 0;
  int startTime = 0;
  List<ChannelStats> inputStreams = [];
  List<ChannelStats> outputStreams = [];
  double quality = 100.0;

  StreamRuntimeStats();

  factory StreamRuntimeStats.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    StreamRuntimeStats result = StreamRuntimeStats();
    result.status = StreamStatus.fromInt(json[STATUS_FIELD]);
    result.cpu = json[CPU_FIELD].toDouble();
    result.timestamp = json[TIMESTAMP_FIELD];
    result.idleTime = json[IDLE_TIME_FIELD];
    result.rss = json[RSS_FIELD];
    result.loopStartTime = json[LOOP_START_TIME_FIELD];
    result.restarts = json[RESTARTS_FIELD];
    result.startTime = json[START_TIME_FIELD];
    json[INPUT_STREAMS_FIELD].forEach((s) {
      result.inputStreams.add(ChannelStats.fromJson(s));
    });
    json[OUTPUT_STREAMS_FIELD].forEach((s) {
      result.outputStreams.add(ChannelStats.fromJson(s));
    });
    result.quality = json[QUALITY_FIELD].toDouble();
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data[STATUS_FIELD] = status.toInt();
    data[CPU_FIELD] = cpu;
    data[TIMESTAMP_FIELD] = timestamp;
    data[IDLE_TIME_FIELD] = idleTime;
    data[RSS_FIELD] = rss;
    data[LOOP_START_TIME_FIELD] = loopStartTime;
    data[RESTARTS_FIELD] = restarts;
    data[START_TIME_FIELD] = startTime;
    data[INPUT_STREAMS_FIELD] = inputStreams;
    data[OUTPUT_STREAMS_FIELD] = outputStreams;
    data[QUALITY_FIELD] = quality;
    return data;
  }
}

abstract class IStream {
  static const NAME_FIELD = 'name';
  static const ID_FIELD = 'id';
  static const TYPE_FIELD = 'type';
  static const ICON_FIELD = 'tvg_logo';
  static const GROUPS_FIELD = 'groups';
  static const PRICE_FIELD = 'price';
  static const VISIBLE_FIELD = 'visible';
  static const IARC_FIELD = 'iarc';
  static const VIEW_COUNT_FIELD = 'view_count';
  static const OUTPUT_FIELD = 'output';
  static const EPG_ID_FIELD = 'tvg_id';
  static const META_FIELD = 'meta';

  // CREATED_DATE_FIELD = 'created_date'
  // TVG_NAME_FIELD = 'tvg_name'

  // required
  String id;
  String name = StreamName.DEFAULT;

  String epgId;
  String icon;
  List<String> groups = [];
  double price = Price.DEFAULT;
  bool visible = true;
  int iarc = IARC.DEFAULT;
  int views = 0;
  List<OutputUrl> output = [OutputUrl(id: 0, uri: '')];
  List<MetaUrl> meta = [];

  IStream.create({@required String icon}) : icon = icon;

  IStream copy();

  IStream copyWith({@required String id, @required String name}) {
    IStream stream = copy();
    stream.id = id;
    stream.name = name;
    return stream;
  }

  IStream.edit({@required this.id, @required this.name});

  bool isSerial() {
    return false;
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta}) {
    this.icon = icon;
    this.epgId = epgId;
    this.groups = groups;
    this.price = price;
    this.visible = visible;
    this.iarc = iarc;
    this.views = views;
    this.meta = meta;
  }

  StreamType type();

  bool isValid();

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> _output = [];
    output.forEach((out) => _output.add(out.toJson()));
    List<Map<String, dynamic>> _meta = [];
    meta.forEach((out) => _meta.add(out.toJson()));
    return {
      ID_FIELD: id,
      NAME_FIELD: name,
      ICON_FIELD: icon,
      GROUPS_FIELD: groups,
      TYPE_FIELD: type().toInt(),
      PRICE_FIELD: price,
      VIEW_COUNT_FIELD: views,
      OUTPUT_FIELD: _output,
      VISIBLE_FIELD: visible,
      IARC_FIELD: iarc,
      EPG_ID_FIELD: epgId,
      META_FIELD: _meta
    };
  }
}

abstract class HardwareStream extends IStream {
  static const INPUT_FIELD = 'input';
  static const LOG_LEVEL_FIELD = 'log_level';
  static const FEEDBACK_DIR_FIELD = 'feedback_directory';
  static const HAVE_VIDEO_FIELD = 'have_video';
  static const HAVE_AUDIO_FIELD = 'have_audio';
  static const PHOENIX_FIELD = 'phoenix';
  static const LOOP_FIELD = 'loop';
  static const RESTART_ATTEMPTS_FIELD = 'restart_attempts';
  static const EXTRA_CONFIG_FIELD = 'extra_config';
  static const AUTO_START_FIELD = 'auto_start';
  static const RELAY_VIDEO_TYPE_FIELD = 'relay_video_type';
  static const RELAY_AUDIO_TYPE_FIELD = 'relay_audio_type';
  static const AUDIO_TRACKS_COUNT_FIELD = 'audio_tracks_count';

  // optional
  static const AUDIO_SELECT_FIELD = 'audio_select';
  static const AUTO_EXIT_TIME_FIELD = 'auto_exit_time';

  // dynamic
  static const RUNTIME_FIELD = 'runtime';

  List<InputUrl> input = [InputUrl(id: 1, uri: '')];
  StreamLogLevel logLevel = StreamLogLevel.INFO;
  String feedbackDirectory;
  bool haveVideo = true;
  bool haveAudio = true;
  RelayType relayVideoType = RelayType.DEEP;
  RelayType relayAudioType = RelayType.DEEP;
  bool phoenix = false;
  bool loop = false;
  int restartAttempts = RestartAttempts.DEFAULT;
  String extraConfig = '{}';
  bool autoStart = false;
  int audioTracksCount = 1;

  // optional
  Optional<int> _autoExit = Optional<int>.absent();
  Optional<int> _audioSelect = Optional<int>.absent();

  // dynamic should have defaults
  StreamRuntimeStats stats = StreamRuntimeStats();

  double rssInMegabytes() {
    final double inMegabytes = stats.rss / (1024 * 1024);
    return fixedDouble(inMegabytes);
  }

  double fixedCpu() {
    return fixedDouble(stats.cpu);
  }

  double fixedQuality() {
    return fixedDouble(stats.quality);
  }

  double fixedStartTime() {
    return fixedDouble((stats.timestamp - stats.startTime) / 1000);
  }

  double fixedLoopTime() {
    return fixedDouble((stats.timestamp - stats.loopStartTime) / 1000);
  }

  double fixedInputMBitsPerSecond() {
    final double inMegabits = 8 * inputBitsPerSecond() / (1024 * 1024);
    return fixedDouble(inMegabits);
  }

  int inputBitsPerSecond() {
    int result = 0;
    for (ChannelStats stat in stats.inputStreams) {
      result += stat.bps;
    }
    return result;
  }

  double fixedOutputMBitsPerSecond() {
    final double outMegabits = 8 * outputBitsPerSecond() / (1024 * 1024);
    return fixedDouble(outMegabits);
  }

  int outputBitsPerSecond() {
    int result = 0;
    for (ChannelStats stat in stats.outputStreams) {
      result += stat.bps;
    }
    return result;
  }

  HardwareStream.create({@required String icon}) : super.create(icon: icon);

  HardwareStream.edit({@required String id, @required String name}) : super.edit(id: id, name: name);

  HardwareStream copy();

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required StreamLogLevel logLevel,
      @required String feedbackDirectory,
      @required bool haveVideo,
      @required bool haveAudio,
      @required RelayType relayVideoType,
      @required RelayType relayAudioType,
      @required bool phoenix,
      @required bool loop,
      @required int restartAttempts,
      @required String extraConfig,
      @required bool autoStart,
      int autoExit,
      int audioSelect,
      @required int audioTracksCount,
      @required List<MetaUrl> meta}) {
    super.setOptional(
        icon: icon, epgId: epgId, groups: groups, price: price, visible: visible, iarc: iarc, views: views, meta: meta);
    this.logLevel = logLevel;
    this.feedbackDirectory = feedbackDirectory;
    this.haveVideo = haveVideo;
    this.haveAudio = haveAudio;
    this.relayAudioType = relayAudioType;
    this.relayVideoType = relayVideoType;
    this.phoenix = phoenix;
    this.loop = loop;
    this.restartAttempts = restartAttempts;
    this.extraConfig = extraConfig;
    this.autoStart = autoStart;
    this.autoExit = autoExit;
    this.audioSelect = audioSelect;
    this.audioTracksCount = audioTracksCount;
  }

  // optional
  int get autoExit {
    return _autoExit.orNull;
  }

  set autoExit(int exit) {
    _autoExit = Optional<int>.fromNullable(exit);
  }

  int get audioSelect {
    return _audioSelect.orNull;
  }

  set audioSelect(int audioSelect) {
    _audioSelect = Optional<int>.fromNullable(audioSelect);
  }

  void setRuntime({@required StreamRuntimeStats stats}) {
    this.stats = stats;
  }

  StreamType type();

  bool isValid() {
    final _name = name.isValidStreamName();
    final _icon = icon.isValidIconUrl();
    final _iarc = iarc.isValidIARC();
    final _price = price.isValidPrice();
    final _input = input.isValidInputUrls();
    final _output = output.isValidOutputUrls();
    final _rest = restartAttempts.isValidRestartAttempts();
    final _audioTracksCount = audioTracksCount.isValidAudioChannelsCount();
    bool req = _name && _price && _icon && _input && _output && _iarc && _rest && _audioTracksCount;
    if (req && _audioSelect.isPresent) {
      req &= _audioSelect.value.isValidAudioSelect();
    }
    if (req && _autoExit.isPresent) {
      req &= _autoExit.value.isValidAutoExitTime();
    }
    return req;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    List<Map<String, dynamic>> _input = [];
    input.forEach((inp) => _input.add(inp.toJson()));

    data[INPUT_FIELD] = _input;
    data[LOG_LEVEL_FIELD] = logLevel.toInt();
    data[FEEDBACK_DIR_FIELD] = feedbackDirectory;
    data[HAVE_VIDEO_FIELD] = haveVideo;
    data[HAVE_AUDIO_FIELD] = haveAudio;
    data[RELAY_AUDIO_TYPE_FIELD] = relayAudioType.toInt();
    data[RELAY_VIDEO_TYPE_FIELD] = relayVideoType.toInt();
    data[PHOENIX_FIELD] = phoenix;
    data[AUDIO_TRACKS_COUNT_FIELD] = audioTracksCount;
    if (_audioSelect.isPresent) {
      data[AUDIO_SELECT_FIELD] = _audioSelect.value;
    }
    if (_autoExit.isPresent) {
      data[AUTO_EXIT_TIME_FIELD] = _autoExit.value;
    }
    data[LOOP_FIELD] = loop;
    data[RESTART_ATTEMPTS_FIELD] = restartAttempts;
    data[EXTRA_CONFIG_FIELD] = extraConfig;
    data[AUTO_START_FIELD] = autoStart;

    //
    data[RUNTIME_FIELD] = stats.toJson();
    return data;
  }
}

// instances

class ProxyStream extends IStream {
  ProxyStream.create({@required String icon}) : super.create(icon: icon);

  ProxyStream.edit({@required String id, @required String name, @required List<OutputUrl> output})
      : super.edit(id: id, name: name) {
    this.output = output;
  }

  ProxyStream copy() {
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    ProxyStream stream = ProxyStream.edit(id: id, name: name, output: out);
    List<MetaUrl> copyMeta = [];
    for (MetaUrl met in meta) {
      copyMeta.add(met.copy());
    }
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: copyMeta);
    return stream;
  }

  StreamType type() {
    return StreamType.PROXY;
  }

  bool isValid() {
    final _name = name.isValidStreamName();
    final _icon = icon.isValidIconUrl();
    final _iarc = iarc.isValidIARC();
    final _price = price.isValidPrice();
    final _output = output.isValidOutputUrls();
    return _name && _price && _icon && _output && _iarc;
  }
}

mixin VodMixin {
  static const PRIME_DATE_FIELD = 'prime_date';
  static const DESCRIPTION_FIELD = 'description';
  static const VOD_TYPE_FIELD = 'vod_type';
  static const TRAILER_URL_FIELD = 'trailer_url';
  static const USER_SCORE_FIELD = 'user_score';
  static const COUNTRY_FIELD = 'country';
  static const DURATION_FIELD = 'duration';

  int get primeDate;

  String get description;

  VodType get vodType;

  String get trailerUrl;

  double get userScore;

  String get country;

  int get duration;

  Map<String, dynamic> _toJson() {
    return {
      PRIME_DATE_FIELD: primeDate,
      DESCRIPTION_FIELD: description,
      VOD_TYPE_FIELD: vodType.toInt(),
      TRAILER_URL_FIELD: trailerUrl,
      USER_SCORE_FIELD: userScore,
      COUNTRY_FIELD: country,
      DURATION_FIELD: duration
    };
  }
}

class VodDetails {
  String name;
  String icon;
  int primeDate;
  String description;
  double userScore = UserScore.DEFAULT;
  String country = Country.DEFAULT;
  int duration = VodDuration.DEFAULT;

  VodDetails(
      {@required this.name, @required this.icon, @required this.primeDate, @required this.description, this.userScore});

  factory VodDetails.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    final String name = json[IStream.NAME_FIELD];
    final String icon = json[IStream.ICON_FIELD];
    final int primeDate = json[VodMixin.PRIME_DATE_FIELD];
    final String description = json[VodMixin.DESCRIPTION_FIELD];
    final double userScore = json[VodMixin.USER_SCORE_FIELD];
    return VodDetails(name: name, icon: icon, primeDate: primeDate, description: description, userScore: userScore);
  }
}

class VodProxyStream extends ProxyStream with VodMixin {
  int primeDate;
  String description;
  VodType vodType = VodType.VOD;
  String trailerUrl;
  double userScore = UserScore.DEFAULT;
  String country = Country.DEFAULT;
  int duration = VodDuration.DEFAULT;

  VodProxyStream.create({@required int primeDate, @required String icon, @required String trailerUrl})
      : super.create(icon: icon) {
    this.primeDate = primeDate;
    this.trailerUrl = trailerUrl;
  }

  VodProxyStream.edit(
      {@required String id,
      @required String name,
      @required List<OutputUrl> output,
      @required int primeDate,
      @required VodType vodType})
      : super.edit(id: id, name: name, output: output) {
    this.primeDate = primeDate;
    this.vodType = vodType;
  }

  bool isSerial() {
    return vodType == VodType.SERIAL;
  }

  VodProxyStream copy() {
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    VodProxyStream stream =
        VodProxyStream.edit(id: id, name: name, output: out, primeDate: primeDate, vodType: vodType);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        description: description,
        trailerUrl: trailerUrl,
        userScore: userScore,
        country: country,
        duration: duration);
    return stream;
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta,
      @required String description,
      @required String trailerUrl,
      @required double userScore,
      @required String country,
      @required int duration}) {
    super.setOptional(
        icon: icon, epgId: epgId, groups: groups, price: price, visible: visible, iarc: iarc, views: views, meta: meta);
    this.description = description;
    this.trailerUrl = trailerUrl;
    this.userScore = userScore;
    this.country = country;
    this.duration = duration;
  }

  StreamType type() {
    return StreamType.VOD_PROXY;
  }

  bool isValid() {
    return super.isValid() && duration.isValidVodDuration() && userScore.isValidUserScore();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data.addAll(_toJson());
    return data;
  }
}

class RelayStream extends HardwareStream {
  static const DEFAULT_VIDEO_PARSER = VideoParser.H264;
  static const DEFAULT_AUDIO_PARSER = AudioParser.AAC;

  static const VIDEO_PARSER_FIELD = 'video_parser';
  static const AUDIO_PARSER_FIELD = 'audio_parser';

  Optional<VideoParser> _videoParser = Optional<VideoParser>.fromNullable(DEFAULT_VIDEO_PARSER);
  Optional<AudioParser> _audioParser = Optional<AudioParser>.fromNullable(DEFAULT_AUDIO_PARSER);

  VideoParser get videoParser {
    return _videoParser.orNull;
  }

  set videoParser(VideoParser parser) {
    _videoParser = Optional<VideoParser>.fromNullable(parser);
  }

  AudioParser get audioParser {
    return _audioParser.orNull;
  }

  set audioParser(AudioParser parser) {
    _audioParser = Optional<AudioParser>.fromNullable(parser);
  }

  RelayStream.create({@required String icon}) : super.create(icon: icon);

  RelayStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name) {
    this.input = input;
    this.output = output;
  }

  RelayStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    RelayStream stream = RelayStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta,
      @required StreamLogLevel logLevel,
      @required String feedbackDirectory,
      @required bool haveVideo,
      @required bool haveAudio,
      @required RelayType relayVideoType,
      @required RelayType relayAudioType,
      @required bool phoenix,
      @required bool loop,
      @required int restartAttempts,
      @required String extraConfig,
      @required bool autoStart,
      VideoParser videoParser,
      AudioParser audioParser,
      int autoExit,
      int audioSelect,
      @required int audioTracksCount}) {
    super.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    this.videoParser = videoParser;
    this.audioParser = audioParser;
  }

  StreamType type() {
    return StreamType.RELAY;
  }

  bool isValid() {
    bool req = super.isValid() && input.isValidInputUrls();
    if (req && _videoParser.isPresent) {
      req &= VideoParser.values.contains(_videoParser.value);
    }
    if (req && _audioParser.isPresent) {
      req &= AudioParser.values.contains(_audioParser.value);
    }
    return req;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    if (_videoParser.isPresent) {
      data[VIDEO_PARSER_FIELD] = _videoParser.value.toString();
    }
    if (_audioParser.isPresent) {
      data[AUDIO_PARSER_FIELD] = _audioParser.value.toString();
    }
    return data;
  }
}

class EncodeStream extends HardwareStream {
  static const RELAY_AUDIO_FIELD = 'relay_audio';
  static const RELAY_VIDEO_FIELD = 'relay_video';
  static const DEINTERLACE_FIELD = 'deinterlace';
  static const VOLUME_FIELD = 'volume';
  static const VIDEO_CODEC_FIELD = 'video_codec';
  static const AUDIO_CODEC_FIELD = 'audio_codec';

  // optional
  static const AUDIO_CHANNELS_COUNT_FIELD = 'audio_channels_count';
  static const FRAME_RATE_FIELD = 'frame_rate';
  static const SIZE_FIELD = 'size';
  static const MACHINE_LEARNING_FIELD = 'machine_learning';
  static const VIDEO_BITRATE_FIELD = 'video_bit_rate';
  static const AUDIO_BITRATE_FIELD = 'audio_bit_rate';
  static const ASPECT_RATIO_FIELD = 'aspect_ratio';
  static const LOGO_FIELD = 'logo';
  static const RSVG_LOGO_FIELD = 'rsvg_logo';

  bool relayVideo = false;
  bool relayAudio = false;
  bool deinterlace = false;
  double volume = Volume.DEFAULT;
  VideoCodec videoCodec = VideoCodec.X264_ENC;
  AudioCodec audioCodec = AudioCodec.FAAC;

  // optional
  Optional<int> _audioChannelsCount = Optional<int>.absent();
  Optional<int> _frameRate = Optional<int>.absent();
  Optional<Size> _size = Optional<Size>.absent();
  Optional<MachineLearning> _machineLearning = Optional<MachineLearning>.absent();
  Optional<int> _videoBitRate = Optional<int>.absent();
  Optional<int> _audioBitRate = Optional<int>.absent();
  Optional<Rational> _aspectRatio = Optional<Rational>.absent();
  Optional<Logo> _logo = Optional<Logo>.absent();
  Optional<RsvgLogo> _rsvgLogo = Optional<RsvgLogo>.absent();

  EncodeStream.create({@required String icon}) : super.create(icon: icon);

  EncodeStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name) {
    this.input = input;
    this.output = output;
  }

  EncodeStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    EncodeStream stream = EncodeStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    return stream;
  }

  int get audioChannelsCount {
    return _audioChannelsCount.orNull;
  }

  set audioChannelsCount(int channels) {
    _audioChannelsCount = Optional<int>.fromNullable(channels);
  }

  int get frameRate {
    return _frameRate.orNull;
  }

  set frameRate(int rate) {
    _frameRate = Optional<int>.fromNullable(rate);
  }

  Size get size {
    return _size.orNull;
  }

  set size(Size size) {
    _size = Optional<Size>.fromNullable(size);
  }

  MachineLearning get machineLearning {
    return _machineLearning.orNull;
  }

  set machineLearning(MachineLearning ml) {
    _machineLearning = Optional<MachineLearning>.fromNullable(ml);
  }

  int get videoBitRate {
    return _videoBitRate.orNull;
  }

  set videoBitRate(int bitRate) {
    _videoBitRate = Optional<int>.fromNullable(bitRate);
  }

  int get audioBitRate {
    return _audioBitRate.orNull;
  }

  set audioBitRate(int bitRate) {
    _audioBitRate = Optional<int>.fromNullable(bitRate);
  }

  Rational get aspectRatio {
    return _aspectRatio.orNull;
  }

  set aspectRatio(Rational ratio) {
    _aspectRatio = Optional<Rational>.fromNullable(ratio);
  }

  Logo get logo {
    return _logo.orNull;
  }

  set logo(Logo logo) {
    _logo = Optional<Logo>.fromNullable(logo);
  }

  RsvgLogo get rsvgLogo {
    return _rsvgLogo.orNull;
  }

  set rsvgLogo(RsvgLogo logo) {
    _rsvgLogo = Optional<RsvgLogo>.fromNullable(logo);
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta,
      @required StreamLogLevel logLevel,
      @required String feedbackDirectory,
      @required bool haveVideo,
      @required bool haveAudio,
      @required RelayType relayVideoType,
      @required RelayType relayAudioType,
      @required bool phoenix,
      @required bool loop,
      @required int restartAttempts,
      @required String extraConfig,
      @required bool autoStart,
      @required bool relayVideo,
      @required bool relayAudio,
      @required bool deinterlace,
      @required double volume,
      @required VideoCodec videoCodec,
      @required AudioCodec audioCodec,
      int autoExit,
      int audioSelect,
      @required int audioTracksCount,
      int audioChannelsCount,
      int frameRate,
      Size size,
      MachineLearning machineLearning,
      int videoBitRate,
      int audioBitRate,
      Rational aspectRatio,
      Logo logo,
      RsvgLogo rsvgLogo}) {
    super.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    this.relayVideo = relayVideo;
    this.relayAudio = relayAudio;
    this.deinterlace = deinterlace;
    this.volume = volume;
    this.videoCodec = videoCodec;
    this.audioCodec = audioCodec;
    this.audioChannelsCount = audioChannelsCount;
    this.frameRate = frameRate;
    this.size = size;
    this.machineLearning = machineLearning;
    this.videoBitRate = videoBitRate;
    this.audioBitRate = audioBitRate;
    this.aspectRatio = aspectRatio;
    this.logo = logo;
    this.rsvgLogo = rsvgLogo;
  }

  StreamType type() {
    return StreamType.ENCODE;
  }

  bool isValid() {
    bool req = super.isValid() && volume.isValidVolume();
    if (req && _audioChannelsCount.isPresent) {
      req &= _audioChannelsCount.value.isValidAudioChannelsCount();
    }
    if (req && _frameRate.isPresent) {
      req &= _frameRate.value.isValidFrameRate();
    }
    if (req && _size.isPresent) {
      req &= _size.value.isValid();
    }
    if (req && _machineLearning.isPresent) {
      req &= _machineLearning.value.isValid();
    }
    if (req && _videoBitRate.isPresent) {
      req &= _videoBitRate.value.isValidBitRate();
    }
    if (req && _audioBitRate.isPresent) {
      req &= _audioBitRate.value.isValidBitRate();
    }
    if (req && _aspectRatio.isPresent) {
      req &= _aspectRatio.value.isValid();
    }
    if (req && _logo.isPresent) {
      req &= _logo.value.isValid();
    }
    if (req && _rsvgLogo.isPresent) {
      req &= _rsvgLogo.value.isValid();
    }
    return req;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data[RELAY_VIDEO_FIELD] = relayVideo;
    data[RELAY_AUDIO_FIELD] = relayAudio;
    data[DEINTERLACE_FIELD] = deinterlace;
    data[VOLUME_FIELD] = volume;
    data[VIDEO_CODEC_FIELD] = videoCodec.toString();
    data[AUDIO_CODEC_FIELD] = audioCodec.toString();

    if (_frameRate.isPresent) {
      data[FRAME_RATE_FIELD] = _frameRate.value;
    }
    if (_audioChannelsCount.isPresent) {
      data[AUDIO_CHANNELS_COUNT_FIELD] = _audioChannelsCount.value;
    }
    if (_size.isPresent) {
      data[SIZE_FIELD] = _size.value.toJson();
    }
    if (_machineLearning.isPresent) {
      data[MACHINE_LEARNING_FIELD] = _machineLearning.value.toJson();
    }
    if (_videoBitRate.isPresent) {
      data[VIDEO_BITRATE_FIELD] = _videoBitRate.value;
    }
    if (_audioBitRate.isPresent) {
      data[AUDIO_BITRATE_FIELD] = _audioBitRate.value;
    }
    if (_aspectRatio.isPresent) {
      data[ASPECT_RATIO_FIELD] = _aspectRatio.value.toJson();
    }
    if (_logo.isPresent) {
      data[LOGO_FIELD] = _logo.value.toJson();
    }
    if (_rsvgLogo.isPresent) {
      data[RSVG_LOGO_FIELD] = _rsvgLogo.value.toJson();
    }
    return data;
  }
}

class TimeshiftRecorderStream extends RelayStream {
  TimeshiftRecorderStream.create({@required String icon}) : super.create(icon: icon);

  TimeshiftRecorderStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name, input: input, output: output);

  TimeshiftRecorderStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    TimeshiftRecorderStream stream = TimeshiftRecorderStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  StreamType type() {
    return StreamType.TIMESHIFT_RECORDER;
  }
}

class TimeshiftPlayerStream extends RelayStream {
  TimeshiftPlayerStream.create({@required String icon}) : super.create(icon: icon);

  TimeshiftPlayerStream.edit({@required String id, @required String name, @required List<OutputUrl> output})
      : super.edit(id: id, name: name, input: [], output: output);

  TimeshiftPlayerStream copy() {
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    TimeshiftPlayerStream stream = TimeshiftPlayerStream.edit(id: id, name: name, output: out);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  StreamType type() {
    return StreamType.TIMESHIFT_PLAYER;
  }
}

class CatchupStream extends TimeshiftRecorderStream {
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';

  int start;
  int stop;

  CatchupStream.create({@required String icon}) : super.create(icon: icon);

  CatchupStream.edit(
      {@required String id,
      @required String name,
      @required List<InputUrl> input,
      @required List<OutputUrl> output,
      @required int start,
      @required int stop})
      : super.edit(id: id, name: name, input: input, output: output) {
    this.start = start;
    this.stop = stop;
  }

  StreamType type() {
    return StreamType.CATCHUP;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data[START_FIELD] = start;
    data[STOP_FIELD] = stop;
    return data;
  }
}

class TestLifeStream extends RelayStream {
  TestLifeStream.create({@required String icon}) : super.create(icon: icon) {
    visible = false;
  }

  TestLifeStream.edit({@required String id, @required String name, @required List<InputUrl> input})
      : super.edit(id: id, name: name, input: input, output: []);

  TestLifeStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    TestLifeStream stream = TestLifeStream.edit(id: id, name: name, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  StreamType type() {
    return StreamType.TEST_LIFE;
  }
}

class VodRelayStream extends RelayStream with VodMixin {
  int primeDate;
  String description;
  VodType vodType = VodType.VOD;
  String trailerUrl;
  double userScore = UserScore.DEFAULT;
  String country = Country.DEFAULT;
  int duration = VodDuration.DEFAULT;

  VodRelayStream.create({@required int primeDate, @required String icon, @required String trailerUrl})
      : super.create(icon: icon) {
    this.primeDate = primeDate;
    this.trailerUrl = trailerUrl;
  }

  VodRelayStream.edit(
      {@required String id,
      @required String name,
      @required List<InputUrl> input,
      @required List<OutputUrl> output,
      @required int primeDate,
      @required VodType vodType})
      : super.edit(id: id, name: name, input: input, output: output) {
    this.primeDate = primeDate;
    this.vodType = vodType;
  }

  bool isSerial() {
    return vodType == VodType.SERIAL;
  }

  VodRelayStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    VodRelayStream stream =
        VodRelayStream.edit(id: id, name: name, input: inp, output: out, primeDate: primeDate, vodType: vodType);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        description: description,
        trailerUrl: trailerUrl,
        userScore: userScore,
        country: country,
        duration: duration,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta,
      @required StreamLogLevel logLevel,
      @required String feedbackDirectory,
      @required bool haveVideo,
      @required bool haveAudio,
      @required RelayType relayVideoType,
      @required RelayType relayAudioType,
      @required bool phoenix,
      @required bool loop,
      @required int restartAttempts,
      @required String extraConfig,
      @required bool autoStart,
      @required VideoParser videoParser,
      @required AudioParser audioParser,
      @required String description,
      @required String trailerUrl,
      @required double userScore,
      @required String country,
      @required int duration,
      int autoExit,
      int audioSelect,
      @required int audioTracksCount}) {
    super.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    this.description = description;
    this.trailerUrl = trailerUrl;
    this.userScore = userScore;
    this.country = country;
    this.duration = duration;
  }

  @override
  StreamType type() {
    return StreamType.VOD_RELAY;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data.addAll(_toJson());
    return data;
  }
}

class VodEncodeStream extends EncodeStream with VodMixin {
  int primeDate;
  String description;
  VodType vodType = VodType.VOD;
  String trailerUrl;
  double userScore = UserScore.DEFAULT;
  String country = Country.DEFAULT;
  int duration = VodDuration.DEFAULT;

  VodEncodeStream.create({@required int primeDate, @required String icon, @required String trailerUrl})
      : super.create(icon: icon) {
    this.primeDate = primeDate;
    this.trailerUrl = trailerUrl;
  }

  VodEncodeStream.edit(
      {@required String id,
      @required String name,
      @required List<InputUrl> input,
      @required List<OutputUrl> output,
      @required int primeDate,
      @required VodType vodType})
      : super.edit(id: id, name: name, input: input, output: output) {
    this.primeDate = primeDate;
    this.vodType = vodType;
  }

  bool isSerial() {
    return vodType == VodType.SERIAL;
  }

  VodEncodeStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    VodEncodeStream stream =
        VodEncodeStream.edit(id: id, name: name, output: out, input: inp, primeDate: primeDate, vodType: vodType);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        description: description,
        trailerUrl: trailerUrl,
        userScore: userScore,
        country: country,
        duration: duration,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    return stream;
  }

  void setOptional(
      {@required String icon,
      @required String epgId,
      @required List<String> groups,
      @required double price,
      @required bool visible,
      @required int iarc,
      @required int views,
      @required List<MetaUrl> meta,
      @required StreamLogLevel logLevel,
      @required String feedbackDirectory,
      @required bool haveVideo,
      @required bool haveAudio,
      @required RelayType relayVideoType,
      @required RelayType relayAudioType,
      @required bool phoenix,
      @required bool loop,
      @required int restartAttempts,
      @required String extraConfig,
      @required bool autoStart,
      @required String description,
      @required String trailerUrl,
      @required double userScore,
      @required String country,
      @required int duration,
      @required bool relayVideo,
      @required bool relayAudio,
      @required bool deinterlace,
      @required double volume,
      @required VideoCodec videoCodec,
      @required AudioCodec audioCodec,
      int autoExit,
      int audioSelect,
      @required int audioTracksCount,
      int audioChannelsCount,
      int frameRate,
      Size size,
      MachineLearning machineLearning,
      int videoBitRate,
      int audioBitRate,
      Rational aspectRatio,
      Logo logo,
      RsvgLogo rsvgLogo}) {
    super.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    this.description = description;
    this.trailerUrl = trailerUrl;
    this.userScore = userScore;
    this.country = country;
    this.duration = duration;
  }

  @override
  StreamType type() {
    return StreamType.VOD_ENCODE;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = super.toJson();
    data.addAll(_toJson());
    return data;
  }
}

class CodRelayStream extends RelayStream {
  CodRelayStream.create({@required String icon}) : super.create(icon: icon);

  CodRelayStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name, input: input, output: output);

  CodRelayStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    CodRelayStream stream = CodRelayStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        videoParser: videoParser,
        audioParser: audioParser,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount);
    return stream;
  }

  @override
  StreamType type() {
    return StreamType.COD_RELAY;
  }
}

class CodEncodeStream extends EncodeStream {
  CodEncodeStream.create({@required String icon}) : super.create(icon: icon);

  CodEncodeStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name, input: input, output: output);

  CodEncodeStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    CodEncodeStream stream = CodEncodeStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayAudioType: relayAudioType,
        relayVideoType: relayVideoType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    return stream;
  }

  @override
  StreamType type() {
    return StreamType.COD_ENCODE;
  }
}

class EventStream extends VodEncodeStream {
  EventStream.create({@required int primeDate, @required String icon, @required String trailerUrl})
      : super.create(primeDate: primeDate, icon: icon, trailerUrl: trailerUrl);

  EventStream.edit(
      {@required String id,
      @required String name,
      @required List<InputUrl> input,
      @required List<OutputUrl> output,
      @required int primeDate,
      @required VodType vodType})
      : super.edit(id: id, name: name, input: input, output: output, primeDate: primeDate, vodType: vodType);

  EventStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    EventStream stream =
        EventStream.edit(id: id, name: name, output: out, input: inp, primeDate: primeDate, vodType: vodType);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        description: description,
        trailerUrl: trailerUrl,
        userScore: userScore,
        country: country,
        duration: duration,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    return stream;
  }

  @override
  StreamType type() {
    return StreamType.EVENT;
  }
}

class CvDataStream extends EncodeStream {
  CvDataStream.create({@required String icon}) : super.create(icon: icon) {
    visible = false;
  }

  CvDataStream.edit(
      {@required String id, @required String name, @required List<InputUrl> input, @required List<OutputUrl> output})
      : super.edit(id: id, name: name, input: input, output: output);

  CvDataStream copy() {
    List<InputUrl> inp = [];
    for (InputUrl url in input) {
      inp.add(url.copy());
    }
    List<OutputUrl> out = [];
    for (OutputUrl url in output) {
      out.add(url.copy());
    }
    CvDataStream stream = CvDataStream.edit(id: id, name: name, output: out, input: inp);
    stream.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machineLearning,
        videoBitRate: videoBitRate,
        audioBitRate: audioBitRate,
        aspectRatio: aspectRatio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    return stream;
  }

  @override
  StreamType type() {
    return StreamType.CV_DATA;
  }
}

IStream makeStream(Map<String, dynamic> json) {
  final id = json[IStream.ID_FIELD];
  final name = json[IStream.NAME_FIELD];
  final icon = json[IStream.ICON_FIELD];
  final List<String> groups = json[IStream.GROUPS_FIELD].cast<String>();
  final double price = json[IStream.PRICE_FIELD].toDouble();
  final visible = json[IStream.VISIBLE_FIELD];
  final iarc = json[IStream.IARC_FIELD];
  final views = json[IStream.VIEW_COUNT_FIELD];
  final epgId = json[IStream.EPG_ID_FIELD];
  List<OutputUrl> output = [];
  json[IStream.OUTPUT_FIELD].forEach((element) => (output.add(makeOutputUrl(element))));
  List<MetaUrl> meta = [];
  json[IStream.META_FIELD].forEach((element) => (meta.add(MetaUrl.fromJson(element))));

  final type = StreamType.fromInt(json[IStream.TYPE_FIELD]);
  if (type == StreamType.PROXY) {
    ProxyStream proxy = ProxyStream.edit(id: id, name: name, output: output);
    proxy.setOptional(
        icon: icon, epgId: epgId, groups: groups, price: price, visible: visible, iarc: iarc, views: views, meta: meta);
    return proxy;
  } else if (type == StreamType.VOD_PROXY) {
    final primeDate = json[VodMixin.PRIME_DATE_FIELD];
    final description = json[VodMixin.DESCRIPTION_FIELD];
    final vodType = VodType.fromInt(json[VodMixin.VOD_TYPE_FIELD]);
    final trailerUrl = json[VodMixin.TRAILER_URL_FIELD];
    final double userScore = json[VodMixin.USER_SCORE_FIELD].toDouble();
    final country = json[VodMixin.COUNTRY_FIELD];
    final duration = json[VodMixin.DURATION_FIELD];
    VodProxyStream vod =
        VodProxyStream.edit(id: id, name: name, output: output, primeDate: primeDate, vodType: vodType);
    vod.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        description: description,
        trailerUrl: trailerUrl,
        userScore: userScore,
        country: country,
        duration: duration);
    return vod;
  }

  // hardware

  List<InputUrl> input = [];
  List<dynamic> result = json[HardwareStream.INPUT_FIELD];
  result.forEach((element) => (input.add(makeInputUrl(element))));
  StreamLogLevel logLevel = StreamLogLevel.fromInt(json[HardwareStream.LOG_LEVEL_FIELD]);
  String feedbackDirectory = json[HardwareStream.FEEDBACK_DIR_FIELD];
  bool haveVideo = json[HardwareStream.HAVE_VIDEO_FIELD];
  bool haveAudio = json[HardwareStream.HAVE_AUDIO_FIELD];
  RelayType relayVideoType = RelayType.fromInt(json[HardwareStream.RELAY_VIDEO_TYPE_FIELD]);
  RelayType relayAudioType = RelayType.fromInt(json[HardwareStream.RELAY_AUDIO_TYPE_FIELD]);
  bool phoenix = json[HardwareStream.PHOENIX_FIELD];
  bool loop = json[HardwareStream.LOOP_FIELD];
  int restartAttempts = json[HardwareStream.RESTART_ATTEMPTS_FIELD];
  String extraConfig = json[HardwareStream.EXTRA_CONFIG_FIELD];
  bool autoStart = json[HardwareStream.AUTO_START_FIELD];
  int audioTracksCount = json[HardwareStream.AUDIO_TRACKS_COUNT_FIELD];

  // optional
  int audioSelect;
  if (json.containsKey(HardwareStream.AUDIO_SELECT_FIELD)) {
    audioSelect = json[HardwareStream.AUDIO_SELECT_FIELD];
  }

  int autoExit;
  if (json.containsKey(HardwareStream.AUTO_EXIT_TIME_FIELD)) {
    autoExit = json[HardwareStream.AUTO_EXIT_TIME_FIELD];
  }

  // dynamic
  StreamRuntimeStats stats = StreamRuntimeStats();
  if (json.containsKey(HardwareStream.RUNTIME_FIELD)) {
    stats = StreamRuntimeStats.fromJson(json[HardwareStream.RUNTIME_FIELD]);
  }
  if (type == StreamType.RELAY ||
      type == StreamType.TIMESHIFT_PLAYER ||
      type == StreamType.TIMESHIFT_RECORDER ||
      type == StreamType.CATCHUP ||
      type == StreamType.TEST_LIFE ||
      type == StreamType.VOD_RELAY ||
      type == StreamType.COD_RELAY) {
    VideoParser videoParser;
    if (json.containsKey(RelayStream.VIDEO_PARSER_FIELD)) {
      videoParser = VideoParser.fromString(json[RelayStream.VIDEO_PARSER_FIELD]);
    }

    AudioParser audioParser;
    if (json.containsKey(RelayStream.AUDIO_PARSER_FIELD)) {
      audioParser = AudioParser.fromString(json[RelayStream.AUDIO_PARSER_FIELD]);
    }

    if (type == StreamType.RELAY) {
      RelayStream relay = RelayStream.edit(id: id, name: name, input: input, output: output);
      relay.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      relay.setRuntime(stats: stats);
      return relay;
    } else if (type == StreamType.TIMESHIFT_PLAYER) {
      TimeshiftPlayerStream time = TimeshiftPlayerStream.edit(id: id, name: name, output: output);
      time.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      time.setRuntime(stats: stats);
      return time;
    } else if (type == StreamType.TIMESHIFT_RECORDER) {
      TimeshiftRecorderStream time = TimeshiftRecorderStream.edit(id: id, name: name, input: input, output: output);
      time.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      time.setRuntime(stats: stats);
      return time;
    } else if (type == StreamType.CATCHUP) {
      final start = json[CatchupStream.START_FIELD];
      final stop = json[CatchupStream.STOP_FIELD];

      CatchupStream cat =
          CatchupStream.edit(id: id, name: name, input: input, output: output, start: start, stop: stop);
      cat.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      cat.setRuntime(stats: stats);
      return cat;
    } else if (type == StreamType.TEST_LIFE) {
      TestLifeStream test = TestLifeStream.edit(id: id, input: input, name: name);
      test.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      test.setRuntime(stats: stats);
      return test;
    } else if (type == StreamType.VOD_RELAY) {
      final primeDate = json[VodMixin.PRIME_DATE_FIELD];
      final description = json[VodMixin.DESCRIPTION_FIELD];
      final vodType = VodType.fromInt(json[VodMixin.VOD_TYPE_FIELD]);
      final trailerUrl = json[VodMixin.TRAILER_URL_FIELD];
      final double userScore = json[VodMixin.USER_SCORE_FIELD].toDouble();
      final country = json[VodMixin.COUNTRY_FIELD];
      final duration = json[VodMixin.DURATION_FIELD];
      VodRelayStream vod =
          VodRelayStream.edit(id: id, name: name, input: input, output: output, primeDate: primeDate, vodType: vodType);
      vod.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          description: description,
          trailerUrl: trailerUrl,
          userScore: userScore,
          country: country,
          duration: duration,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      vod.setRuntime(stats: stats);
      return vod;
    } else if (type == StreamType.COD_RELAY) {
      CodRelayStream cod = CodRelayStream.edit(id: id, name: name, input: input, output: output);
      cod.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          videoParser: videoParser,
          audioParser: audioParser,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount);
      cod.setRuntime(stats: stats);
      return cod;
    }
  }

  final bool relayVideo = json[EncodeStream.RELAY_VIDEO_FIELD];
  final bool relayAudio = json[EncodeStream.RELAY_AUDIO_FIELD];
  final bool deinterlace = json[EncodeStream.DEINTERLACE_FIELD];
  final double volume = json[EncodeStream.VOLUME_FIELD];
  final VideoCodec videoCodec = VideoCodec.fromString(json[EncodeStream.VIDEO_CODEC_FIELD]);
  final AudioCodec audioCodec = AudioCodec.fromString(json[EncodeStream.AUDIO_CODEC_FIELD]);

  // optional
  int frameRate;
  if (json.containsKey(EncodeStream.FRAME_RATE_FIELD)) {
    frameRate = json[EncodeStream.FRAME_RATE_FIELD];
  }
  int audioChannelsCount;
  if (json.containsKey(EncodeStream.AUDIO_CHANNELS_COUNT_FIELD)) {
    audioChannelsCount = json[EncodeStream.AUDIO_CHANNELS_COUNT_FIELD];
  }

  Size size;
  if (json.containsKey(EncodeStream.SIZE_FIELD)) {
    size = Size.fromJson(json[EncodeStream.SIZE_FIELD]);
  }
  MachineLearning machine;
  if (json.containsKey(EncodeStream.MACHINE_LEARNING_FIELD)) {
    machine = MachineLearning.fromJson(json[EncodeStream.MACHINE_LEARNING_FIELD]);
  }
  int videoBitrate;
  if (json.containsKey(EncodeStream.VIDEO_BITRATE_FIELD)) {
    videoBitrate = json[EncodeStream.VIDEO_BITRATE_FIELD];
  }
  int audioBitrate;
  if (json.containsKey(EncodeStream.AUDIO_BITRATE_FIELD)) {
    audioBitrate = json[EncodeStream.AUDIO_BITRATE_FIELD];
  }

  Rational ratio;
  if (json.containsKey(EncodeStream.ASPECT_RATIO_FIELD)) {
    ratio = Rational.fromJson(json[EncodeStream.ASPECT_RATIO_FIELD]);
  }
  Logo logo;
  if (json.containsKey(EncodeStream.LOGO_FIELD)) {
    logo = Logo.fromJson(json[EncodeStream.LOGO_FIELD]);
  }
  RsvgLogo rsvgLogo;
  if (json.containsKey(EncodeStream.RSVG_LOGO_FIELD)) {
    rsvgLogo = RsvgLogo.fromJson(json[EncodeStream.RSVG_LOGO_FIELD]);
  }
  if (type == StreamType.ENCODE) {
    EncodeStream encode = EncodeStream.edit(id: id, name: name, input: input, output: output);
    encode.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machine,
        videoBitRate: videoBitrate,
        audioBitRate: audioBitrate,
        aspectRatio: ratio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    encode.setRuntime(stats: stats);
    return encode;
  } else if (type == StreamType.COD_ENCODE) {
    CodEncodeStream cod = CodEncodeStream.edit(id: id, name: name, input: input, output: output);
    cod.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machine,
        videoBitRate: videoBitrate,
        audioBitRate: audioBitrate,
        aspectRatio: ratio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    cod.setRuntime(stats: stats);
    return cod;
  } else if (type == StreamType.CV_DATA) {
    CvDataStream cvdata = CvDataStream.edit(id: id, name: name, input: input, output: output);
    cvdata.setOptional(
        icon: icon,
        epgId: epgId,
        groups: groups,
        price: price,
        visible: visible,
        iarc: iarc,
        views: views,
        meta: meta,
        logLevel: logLevel,
        feedbackDirectory: feedbackDirectory,
        loop: loop,
        restartAttempts: restartAttempts,
        extraConfig: extraConfig,
        autoStart: autoStart,
        haveVideo: haveVideo,
        haveAudio: haveAudio,
        relayVideoType: relayVideoType,
        relayAudioType: relayAudioType,
        phoenix: phoenix,
        relayVideo: relayVideo,
        relayAudio: relayAudio,
        deinterlace: deinterlace,
        volume: volume,
        videoCodec: videoCodec,
        audioCodec: audioCodec,
        autoExit: autoExit,
        audioSelect: audioSelect,
        audioTracksCount: audioTracksCount,
        audioChannelsCount: audioChannelsCount,
        frameRate: frameRate,
        size: size,
        machineLearning: machine,
        videoBitRate: videoBitrate,
        audioBitRate: audioBitrate,
        aspectRatio: ratio,
        logo: logo,
        rsvgLogo: rsvgLogo);
    cvdata.setRuntime(stats: stats);
    return cvdata;
  }

  // enc vods
  if (type == StreamType.VOD_ENCODE || type == StreamType.EVENT) {
    final int primeDate = json[VodMixin.PRIME_DATE_FIELD];
    final String description = json[VodMixin.DESCRIPTION_FIELD];
    final VodType vodType = VodType.fromInt(json[VodMixin.VOD_TYPE_FIELD]);
    final String trailerUrl = json[VodMixin.TRAILER_URL_FIELD];
    final double userScore = json[VodMixin.USER_SCORE_FIELD].toDouble();
    final String country = json[VodMixin.COUNTRY_FIELD];
    final int duration = json[VodMixin.DURATION_FIELD];
    if (type == StreamType.VOD_ENCODE) {
      VodEncodeStream vod = VodEncodeStream.edit(
          id: id, name: name, input: input, output: output, primeDate: primeDate, vodType: vodType);
      vod.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          description: description,
          trailerUrl: trailerUrl,
          userScore: userScore,
          country: country,
          duration: duration,
          relayVideo: relayVideo,
          relayAudio: relayAudio,
          deinterlace: deinterlace,
          volume: volume,
          videoCodec: videoCodec,
          audioCodec: audioCodec,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount,
          audioChannelsCount: audioChannelsCount,
          frameRate: frameRate,
          size: size,
          machineLearning: machine,
          videoBitRate: videoBitrate,
          audioBitRate: audioBitrate,
          aspectRatio: ratio,
          logo: logo,
          rsvgLogo: rsvgLogo);
      vod.setRuntime(stats: stats);
      return vod;
    } else if (type == StreamType.EVENT) {
      EventStream event =
          EventStream.edit(id: id, name: name, input: input, output: output, primeDate: primeDate, vodType: vodType);
      event.setOptional(
          icon: icon,
          epgId: epgId,
          groups: groups,
          price: price,
          visible: visible,
          iarc: iarc,
          views: views,
          meta: meta,
          logLevel: logLevel,
          feedbackDirectory: feedbackDirectory,
          loop: loop,
          restartAttempts: restartAttempts,
          extraConfig: extraConfig,
          autoStart: autoStart,
          haveVideo: haveVideo,
          haveAudio: haveAudio,
          relayVideoType: relayVideoType,
          relayAudioType: relayAudioType,
          phoenix: phoenix,
          description: description,
          trailerUrl: trailerUrl,
          userScore: userScore,
          country: country,
          duration: duration,
          relayVideo: relayVideo,
          relayAudio: relayAudio,
          deinterlace: deinterlace,
          volume: volume,
          videoCodec: videoCodec,
          audioCodec: audioCodec,
          autoExit: autoExit,
          audioSelect: audioSelect,
          audioTracksCount: audioTracksCount,
          audioChannelsCount: audioChannelsCount,
          frameRate: frameRate,
          size: size,
          machineLearning: machine,
          videoBitRate: videoBitrate,
          audioBitRate: audioBitrate,
          aspectRatio: ratio,
          logo: logo,
          rsvgLogo: rsvgLogo);
      event.setRuntime(stats: stats);
      return event;
    }
  }

  return null;
}
