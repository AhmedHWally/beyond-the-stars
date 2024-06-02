import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton(
      {super.key, required this.pageController, required this.isLastPage});
  final PageController pageController;
  final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return !isLastPage
        ? Container(
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
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }),
          )
        : FloatingActionButton.extended(
            backgroundColor: Colors.teal[50],
            elevation: 0,
            icon: const Icon(
              Icons.rocket_launch,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Scaffold(
                        body: Center(
                          child: Text('hi'),
                        ),
                      )));
            },
            label: const Text(
              'Let\'s go',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ));
  }
}
