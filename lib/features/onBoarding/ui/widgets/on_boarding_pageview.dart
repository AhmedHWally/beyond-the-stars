import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/onBoarding/model/on_boarding_itemmodel.dart';
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
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  onboardingItems[index].image,
                ),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              Text(
                onboardingItems[index].title,
                style: AppTextStyles.style28Bold,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                onboardingItems[index].subtitle,
                style: AppTextStyles.style20W600,
              )
            ],
          ),
        ),
      ),
      itemCount: onboardingItems.length,
    );
  }
}
