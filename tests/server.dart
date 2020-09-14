import 'package:fastocloud_dart_models/models/server.dart';
import 'package:test/test.dart';

void main() {
  test('Valid input urls', () {
    final filePath =
        '/home/fastocloud/streamer/proxy/Media/TV/Ballers/Season 5/Ballers.2015.S05E02.720p.HEVC.x265-MeGusta.mkv';
    final server = Server.createDefault();
    final generated = server.generateHttpProxyUrl(filePath);
    expect(generated.value.toString(),
        'http://0.0.0.0:81/fastocloud/proxy/Media/TV/Ballers/Season%205/Ballers.2015.S05E02.720p.HEVC.x265-MeGusta.mkv');
  });
}
