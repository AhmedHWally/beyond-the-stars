import 'package:flutter/material.dart';

class CustomProfileScreenComponent extends StatelessWidget {
  const CustomProfileScreenComponent(
      {super.key, this.icon, this.onPressed, required this.title});
  final IconData? icon;
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xff424F66)),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}
