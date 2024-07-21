import 'dart:developer';

import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/onBoarding/model/on_boarding_itemmodel.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatefulWidget {
  const OnBoardingItem({
    super.key,
    required this.onboardingItem,
  });

  final OnBoardingItemModel onboardingItem;

  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();
}

class _OnBoardingItemState extends State<OnBoardingItem>
    with TickerProviderStateMixin {
  late AnimationController imageAnimationController;
  late AnimationController textAnimationController;
  late AnimationController subTitleAnimationController;
  late Animation<double> imageScaleAnimation;
  late Animation<double> opactyTextAnimation;
  late Animation<double> subTitleTextAnimation;
  bool isFirstAnimationDone = false;
  @override
  void initState() {
    imageAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    imageScaleAnimation =
        Tween<double>(begin: 1, end: 1.5).animate(imageAnimationController);
    textAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    subTitleAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    subTitleTextAnimation =
        Tween<double>(begin: 0, end: 1).animate(subTitleAnimationController);
    opactyTextAnimation =
        Tween<double>(begin: 0, end: 1).animate(textAnimationController);
    imageAnimationController.repeat(reverse: true);
    Future.delayed(const Duration(milliseconds: 750), () {
      textAnimationController.forward().whenComplete(() {
        subTitleAnimationController.forward();
      });
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant OnBoardingItem oldWidget) {
    imageAnimationController.value = 0;
    imageAnimationController.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    textAnimationController.dispose();
    subTitleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaleTransition(
          scale: imageScaleAnimation,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Image(
              image: AssetImage(
                widget.onboardingItem.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              AnimatedBuilder(
                animation: textAnimationController,
                builder: (context, child) => Opacity(
                  opacity: opactyTextAnimation.value,
                  child: Text(
                    widget.onboardingItem.title,
                    style: AppTextStyles.style28Bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedBuilder(
                animation: subTitleAnimationController,
                builder: (context, child) => Opacity(
                  opacity: subTitleTextAnimation.value,
                  child: Text(
                    widget.onboardingItem.subtitle,
                    style: AppTextStyles.style20W600,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
