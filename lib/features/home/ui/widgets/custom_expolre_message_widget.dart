import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:flutter/material.dart';

class CustomExploreMessageWidget extends StatelessWidget {
  const CustomExploreMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.25,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              image: AssetImage(AppImages.homeImage), fit: BoxFit.fill)),
      child: FittedBox(
        child: DefaultTextStyle(
          style: const TextStyle(shadows: [
            Shadow(color: Colors.black, offset: Offset(0.5, 0.5), blurRadius: 1)
          ]),
          child: AnimatedTextKit(repeatForever: true, animatedTexts: [
            TypewriterAnimatedText('Explore the \nUniverse with \nBeyond The ✨')
          ]),
        ),
      ),
    );
  }
}
