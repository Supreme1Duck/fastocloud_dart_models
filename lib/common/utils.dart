import 'dart:math';

double fixedDouble(double value, {int precision = 2}) {
  if (value == null || value == 0 || value.isNaN) {
    return 0.00;
  }

  final double mod = pow(10.0, precision);
  final int rounded = (value * mod).round();
  return rounded.toDouble() / mod;
}

bool isValidDomain(String text) {
  if (text == 'localhost') {
    return true;
  }

  return RegExp(r'^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$').hasMatch(text);
}

bool isValidIPV4(String text) {
  return RegExp(r'^(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)\.(\d?\d?\d)$').hasMatch(text);
}

bool isValidIPV6(String text) {
  return RegExp(r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$').hasMatch(text);
}
