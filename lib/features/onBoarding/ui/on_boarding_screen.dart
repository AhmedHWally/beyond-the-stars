import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/onBoarding/model/on_boarding_itemmodel.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/widgets/on_boarding_button.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/widgets/on_boarding_pageview.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnBoardingItemModel> onBoardingItems = [
    OnBoardingItemModel(
        image: Images.onBoardingOne, title: 'title', subtitle: 'subtitle'),
    OnBoardingItemModel(
        image: Images.onBoardingTwo, title: 'title', subtitle: 'subtitle'),
    OnBoardingItemModel(
        image: Images.onBoardingThree, title: 'title', subtitle: 'subtitle'),
  ];

  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingPageview(
        pageController: _pageController,
        onboardingItems: onBoardingItems,
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
      ),
      floatingActionButton: OnBoardingButton(
        pageController: _pageController,
        isLastPage: currentPage == 2,
      ),
    );
  }
}
