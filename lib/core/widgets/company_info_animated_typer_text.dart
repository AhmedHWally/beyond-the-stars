import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CompanyInfoAnimatedTyperText extends StatelessWidget {
  const CompanyInfoAnimatedTyperText(
      {super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          speed: const Duration(milliseconds: 1000),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
    );
  }
}
