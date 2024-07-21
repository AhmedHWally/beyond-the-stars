import 'package:beyond_the_stars/features/onBoarding/model/on_boarding_itemmodel.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      itemBuilder: (context, index) => OnBoardingItem(
        onboardingItem: onboardingItems[index],
      ),
      itemCount: onboardingItems.length,
    );
  }
}
