import 'package:flutter/material.dart';

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 52,
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
