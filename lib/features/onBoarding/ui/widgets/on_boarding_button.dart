import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/core/helpers/cache_helper.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:flutter/material.dart';

class OnBoardingButton extends StatefulWidget {
  const OnBoardingButton(
      {super.key, required this.pageController, required this.isLastPage});
  final PageController pageController;
  final bool isLastPage;

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    Future.delayed(const Duration(milliseconds: 2500), () {
      animationController.forward();
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant OnBoardingButton oldWidget) {
    animationController.value = 0;
    Future.delayed(const Duration(milliseconds: 2500), () {
      animationController.forward();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isLastPage
        ? AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Opacity(
              opacity: animation.value,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(4),
                child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: const Icon(
                      Icons.rocket_launch,
                      size: 56,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    }),
              ),
            ),
          )
        : AnimatedBuilder(
            animation: animationController,
            builder: (context, child) => Transform.scale(
              scale: animation.value,
              child: FloatingActionButton.extended(
                  splashColor: Colors.black12,
                  backgroundColor: Colors.grey[50],
                  elevation: 0,
                  icon: const Icon(
                    Icons.rocket_launch,
                    color: Colors.black,
                    size: 26,
                  ),
                  onPressed: () {
                    AppStrings.isOnBoardingDone = true;
                    CacheHelper.set(key: 'isOnBoardingDone', value: true);
                    Navigator.of(context).pushReplacementNamed(Routes.login);
                  },
                  label: const Text(
                    'Let\'s go',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
            ),
          );
  }
}
