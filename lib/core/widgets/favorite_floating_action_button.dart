import 'package:flutter/material.dart';

class FavoriteFloatingActionButton extends StatelessWidget {
  const FavoriteFloatingActionButton(
      {super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xff5A72A0),
      child: Icon(icon, size: 30, color: Colors.amber),
    );
  }
}
