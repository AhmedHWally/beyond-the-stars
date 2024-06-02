import 'package:beyond_the_stars/core/functions/build_shadow.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: 55,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue.shade900,
            ),
            child: FittedBox(
                child: Text(
              title,
              style: const TextStyle(shadows: [
                Shadow(color: Colors.blue, blurRadius: 10, offset: Offset(1, 1))
              ], fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ));
  }
}
