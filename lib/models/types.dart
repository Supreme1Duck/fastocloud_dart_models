const int _MAX_INTEGER_NUMBER = 1000000;

extension Credits on int {
  static const int MIN = 1;
  static const int MAX = _MAX_INTEGER_NUMBER;
  static const int DEFAULT = Credits.MAX;

  bool isValidCredits() {
    if (this == null) {
      return false;
    }
    return this >= Credits.MIN && this <= Credits.MAX;
  }
}

extension IARC on int {
  static const int MIN = 0;
  static const int MAX = 21;
  static const int DEFAULT = 18;

  bool isValidIARC() {
    if (this == null) {
      return false;
    }
    return this >= IARC.MIN && this <= IARC.MAX;
  }
}

extension Price on double {
  static const double MIN = 0.0;
  static const double MAX = 1000.0;
  static const double DEFAULT = Price.MIN;

  bool isValidPrice() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension ServiceName on String {
  static const String DEFAULT = 'Service';

  static const MIN_LENGTH = 3;
  static const MAX_LENGTH = 30;

  bool isValidServiceName() {
    if (this == null) {
      return false;
    }
    return this.length >= ServiceName.MIN_LENGTH && this.length <= ServiceName.MAX_LENGTH;
  }
}

extension StreamName on String {
  static const String DEFAULT = 'Stream';

  static const MIN_LENGTH = 1;
  static const MAX_LENGTH = 64;

  bool isValidStreamName() {
    return this.length >= StreamName.MIN_LENGTH && this.length <= StreamName.MAX_LENGTH;
  }
}

extension Country on String {
  static const String DEFAULT = 'USA';

  static const MIN_LENGTH = 1;
  static const MAX_LENGTH = 2048;

  bool isValidCountry() {
    return this.length >= Country.MIN_LENGTH && this.length <= Country.MAX_LENGTH;
  }
}

extension StreamDescription on String {
  static const String DEFAULT = 'Some description';

  static const MIN_LENGTH = 1;
  static const MAX_LENGTH = 4096;

  bool isValidStreamDescription() {
    return this.length >= StreamDescription.MIN_LENGTH && this.length <= StreamDescription.MAX_LENGTH;
  }
}

extension EpgID on String {
  static const MIN_LENGTH = 1;
  static const MAX_LENGTH = 64;

  bool isValidEpgID() {
    return this.length >= EpgID.MIN_LENGTH && this.length <= EpgID.MAX_LENGTH;
  }
}

extension EpgName on String {
  static const MIN_LENGTH = 1;
  static const MAX_LENGTH = 64;

  bool isValidEpgName() {
    return this.length >= EpgName.MIN_LENGTH && this.length <= EpgName.MAX_LENGTH;
  }
}

extension IconUrl on String {
  static const int MIN_LENGTH = 3;
  static const int MAX_LENGTH = 2048;

  bool isValidIconUrl() {
    if (this == null) {
      return false;
    }
    return this.length >= IconUrl.MIN_LENGTH && this.length <= IconUrl.MAX_LENGTH;
  }
}

extension RestartAttempts on int {
  static const int MIN = 1;
  static const int MAX = _MAX_INTEGER_NUMBER;
  static const int DEFAULT = 10;

  bool isValidRestartAttempts() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension AutoExitTime on int {
  static const MIN = 1;
  static const MAX = _MAX_INTEGER_NUMBER;

  bool isValidAutoExitTime() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension AudioSelect on int {
  static const MIN = 0;
  static const MAX = _MAX_INTEGER_NUMBER;

  bool isValidAudioSelect() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension AudioTracksCount on int {
  static const MIN = 1;
  static const MAX = _MAX_INTEGER_NUMBER;

  bool isValidAudioTracksCount() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension AudioChannelsCount on int {
  static const MIN = 1;
  static const MAX = 8;

  bool isValidAudioChannelsCount() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension UserScore on double {
  static const double MIN = 0.0;
  static const double MAX = 100.0;
  static const double DEFAULT = UserScore.MIN;

  bool isValidUserScore() {
    return this >= MIN && this <= MAX;
  }
}

extension TrailerUrl on String {
  static const int MIN_LENGTH = 3;
  static const int MAX_LENGTH = 2048;

  bool isValidTrailerUrl() {
    return this.length >= IconUrl.MIN_LENGTH && this.length <= IconUrl.MAX_LENGTH;
  }
}

extension VodDuration on int {
  static const MAX = 3600 * 1000 * 365;
  static const int MIN = 0;
  static const int DEFAULT = 3600 * 1000;

  bool isValidVodDuration() {
    return this >= MIN && this <= MAX;
  }
}

extension FrameRate on int {
  static const int MAX = 100;
  static const int MIN = 1;

  bool isValidFrameRate() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension Volume on double {
  static const double DEFAULT = 1.0;
  static const double MAX = 10.0;
  static const double MIN = 0.0;

  bool isValidVolume() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension BitRate on int {
  bool isValidBitRate() {
    if (this == null) {
      return false;
    }
    return this != 0;
  }
}

extension Alpha on double {
  static const double MIN = 0.0;
  static const double MAX = 1.0;
  static const double DEFAULT = Alpha.MAX;

  bool isValidAlpha() {
    if (this == null) {
      return false;
    }
    return this >= MIN && this <= MAX;
  }
}

extension FilePath on String {
  static const int MIN_PATH_LENGTH = 1;
  static const int MAX_PATH_LENGTH = 255;

  bool isValidFilePath() {
    if (this == null) {
      return false;
    }
    return this.length >= IconUrl.MIN_LENGTH && this.length <= IconUrl.MAX_LENGTH;
  }
}

class Protocol {
  final String _value;

  const Protocol._(this._value);

  String toString() {
    return _value;
  }

  factory Protocol.fromString(String value) {
    if (value == 'http') {
      return HTTP;
    } else if (value == 'https') {
      return HTTPS;
    } else if (value == 'file') {
      return FILE;
    } else if (value == 'udp') {
      return UDP;
    } else if (value == 'tcp') {
      return TCP;
    } else if (value == 'rtmp') {
      return RTMP;
    } else if (value == 'rtmps') {
      return RTMPS;
    } else if (value == 'dev') {
      return DEV;
    } else if (value == 'rtsp') {
      return RTSP;
    } else if (value == 'rtp') {
      return RTP;
    }
    return SRT;
  }

  static get values => [HTTP, HTTPS, FILE, UDP, TCP, RTMP, RTMPS, DEV, RTSP, RTP, SRT];

  static const Protocol HTTP = Protocol._('http');
  static const Protocol HTTPS = Protocol._('https');
  static const Protocol FILE = Protocol._('file');
  static const Protocol UDP = Protocol._('udp');
  static const Protocol TCP = Protocol._('tcp');
  static const Protocol RTMP = Protocol._('rtmp');
  static const Protocol RTMPS = Protocol._('rtmps');
  static const Protocol DEV = Protocol._('dev');
  static const Protocol RTSP = Protocol._('rtsp');
  static const Protocol RTP = Protocol._('rtp');
  static const Protocol SRT = Protocol._('srt');
}

extension ActivationKey on String {
  static const int KEY_LENGTH = 97;

  bool isValidActivationKey() {
    if (this == null) {
      return false;
    }
    return this.length == KEY_LENGTH;
  }
}
