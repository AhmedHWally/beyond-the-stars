import 'package:flutter/material.dart';

class CustomPageSlidingAnimation extends PageRouteBuilder {
  final Widget child;
  CustomPageSlidingAnimation({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 750),
            reverseTransitionDuration: const Duration(milliseconds: 750),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
