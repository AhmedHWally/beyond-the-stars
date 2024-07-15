import 'package:flutter/material.dart';

buildCompanyInfoTextStyle(
    {required double fontSize,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      shadows: const [
        Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 1)
      ]);
}
