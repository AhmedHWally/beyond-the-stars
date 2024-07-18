import 'package:flutter/material.dart';

class CustomPageScaleAnimation extends PageRouteBuilder {
  final Widget child;
  CustomPageScaleAnimation({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
}
