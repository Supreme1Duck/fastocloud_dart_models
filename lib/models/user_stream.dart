import 'package:fastocloud_dart_models/models/stream.dart';
import 'package:meta/meta.dart';

class UserStreamInfo {
  static const FAVORITE_FIELD = 'favorite';
  static const PRIVATE_FIELD = 'private';
  static const RECENT_FIELD = 'recent';
  static const LOCKED_FIELD = 'locked';
  static const INTERRUPTION_TIME_FIELD = 'interruption_time';

  final bool favorite; // not changed
  final bool locked;
  final bool private;
  final int recent;
  final int interruptionTime;
  final IStream sid;

  UserStreamInfo(
      {@required this.favorite,
      @required this.locked,
      @required this.private,
      @required this.recent,
      @required this.interruptionTime,
      @required this.sid});

  factory UserStreamInfo.fromJson(Map<String, dynamic> json) {
    final favorite = json[FAVORITE_FIELD];
    final private = json[PRIVATE_FIELD];
    final recent = json[RECENT_FIELD];
    final locked = json[LOCKED_FIELD];
    final interruption = json[INTERRUPTION_TIME_FIELD];
    final sid = makeStream(json);
    return UserStreamInfo(
        favorite: favorite, private: private, recent: recent, locked: locked, interruptionTime: interruption, sid: sid);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = sid.toJson();
    result[FAVORITE_FIELD] = favorite;
    result[PRIVATE_FIELD] = private;
    result[RECENT_FIELD] = recent;
    result[LOCKED_FIELD] = locked;
    result[INTERRUPTION_TIME_FIELD] = interruptionTime;
    return result;
  }
}
