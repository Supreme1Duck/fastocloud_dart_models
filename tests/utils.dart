import 'package:fastocloud_dart_models/common/utils.dart';
import 'package:test/test.dart';

void main() {
  test('fixedDouble', () {
    final stabled = fixedDouble(2.901);
    expect(stabled, 2.90);
  });
}
