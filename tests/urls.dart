import 'package:fastocloud_dart_models/models/input_urls.dart';
import 'package:fastocloud_dart_models/models/output_urls.dart';
import 'package:test/test.dart';

void main() {
  test('Valid input urls', () {
    final url = InputUrl(
        id: 0, uri: 'file:///home/ytvmedia/Media/TV/Ballers/Season 5/Ballers.2015.S05E02.720p.HEVC.x265-MeGusta.mkv');
    expect(url.isValid(), true);
  });

  test('Valid output urls', () {
    final url = OutputUrl(
        id: 0, uri: 'file:///home/ytvmedia/Media/TV/Ballers/Season 5/Ballers.2015.S05E02.720p.HEVC.x265-MeGusta.mkv');
    expect(url.isValid(), true);
  });

}
