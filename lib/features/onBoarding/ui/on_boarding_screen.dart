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
        image: AppImages.onBoardingOne,
        title: 'KNOWLEDGE',
        subtitle:
            'You will learn a lot of useful informations on this journey.'),
    OnBoardingItemModel(
      image: AppImages.onBoardingTwo,
      title: 'EXPLORE',
      subtitle:
          'You will explore our rockets, launch pads, crew, and much more.',
    ),
    OnBoardingItemModel(
      image: AppImages.onBoardingThree,
      title: 'READY!',
      subtitle: 'Hold my hand and let\'s go',
    ),
  ];

  late PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    try {
      precacheImage(const AssetImage(AppImages.onBoardingOne), context);
      precacheImage(const AssetImage(AppImages.onBoardingTwo), context);
      precacheImage(const AssetImage(AppImages.onBoardingThree), context);
      precacheImage(const AssetImage(AppImages.authBackGround), context);
    } catch (e) {
      print('could not cache images');
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // const AssetImage(Images.onBoardingOne).evict();
    // const AssetImage(Images.onBoardingTwo).evict();
    // const AssetImage(Images.onBoardingThree).evict();
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
