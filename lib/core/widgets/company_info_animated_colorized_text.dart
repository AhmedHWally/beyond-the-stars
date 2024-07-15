import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CompanyInfoAnimatedColorizedText extends StatelessWidget {
  const CompanyInfoAnimatedColorizedText({
    super.key,
    required this.text,
    required this.fontSize,
  });
  final String text;
  final double fontSize;

  final List<Color> animationColors = const [
    Colors.lightBlue,
    Color(0xFF3B69FF),
    Colors.purple,
    Colors.lightBlue
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(totalRepeatCount: 2, animatedTexts: [
      ColorizeAnimatedText(text,
          textStyle: TextStyle(fontSize: fontSize), colors: animationColors)
    ]);
  }
}
