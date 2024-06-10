import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
          colors: [Color(0xff415A77), Color(0xff778DA9), Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
