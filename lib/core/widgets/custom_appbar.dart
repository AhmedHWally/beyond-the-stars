import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.trailing});
  final String title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.style25W500,
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
