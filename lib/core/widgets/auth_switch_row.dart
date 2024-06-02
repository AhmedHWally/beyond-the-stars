import 'package:beyond_the_stars/core/functions/build_shadow.dart';
import 'package:flutter/material.dart';

class AuthSwitchRow extends StatelessWidget {
  const AuthSwitchRow({
    super.key,
    required this.title,
    required this.description,
    this.onPressed,
  });
  final String title;
  final String description;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: FittedBox(
            child: Text(
              description,
              style: TextStyle(fontSize: 16, shadows: [buildShadow()]),
            ),
          )),
          TextButton(
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(
                    shadows: [buildShadow()],
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
    );
  }
}
