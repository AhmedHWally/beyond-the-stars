import 'package:beyond_the_stars/features/onBoarding/model/on_boarding_itemmodel.dart';
import 'package:flutter/material.dart';

class OnBoardingPageview extends StatelessWidget {
  const OnBoardingPageview(
      {super.key,
      required this.pageController,
      required this.onboardingItems,
      this.onPageChanged});
  final PageController pageController;
  final List<OnBoardingItemModel> onboardingItems;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      controller: pageController,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  onboardingItems[index].image,
                ),
                fit: BoxFit.fill)),
      ),
      itemCount: onboardingItems.length,
    );
  }
}
