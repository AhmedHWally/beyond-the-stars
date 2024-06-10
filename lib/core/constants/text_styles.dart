import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle style28Bold = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 6,
      shadows: [
        Shadow(
            color: Color.fromRGBO(0, 0, 0, 1),
            offset: Offset(2, 2),
            blurRadius: 2)
      ]);
  static const style26W600 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 26,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black45, offset: Offset(2, 2), blurRadius: 1)
      ]);
  static const TextStyle style20W600 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black54, offset: Offset(2, 2), blurRadius: 2)
      ]);
  static const TextStyle style24W600 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle style25W500 = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textFieldErrorStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1))
      ]);
}
