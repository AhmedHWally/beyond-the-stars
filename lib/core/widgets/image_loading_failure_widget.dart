import 'package:flutter/material.dart';

class ImageLoadingFailureWidget extends StatelessWidget {
  const ImageLoadingFailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff5A72A0),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Network error',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(Icons.warning_amber_rounded)
          ],
        ),
      ),
    );
  }
}
