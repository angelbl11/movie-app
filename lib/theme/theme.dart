import 'package:flutter/cupertino.dart';
import 'package:themed/themed.dart';

class LightTheme {
  static const primaryColor = ColorRef(Color(0xFF6200EE));
  static const backgroundColor = ColorRef(Color(0xFFFFFFFF));
  static const textColor = ColorRef(Color(0xFF000000));
  static const header = TextStyleRef(
    TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFF000000),
    ),
  );
  static const body = TextStyleRef(
    TextStyle(fontSize: 16, color: Color(0xFF000000)),
  );
}
