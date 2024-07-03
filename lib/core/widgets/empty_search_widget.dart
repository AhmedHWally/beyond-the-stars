import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'No search results found',
          textAlign: TextAlign.center,
          style: AppTextStyles.style26W600,
        ),
      ),
    );
  }
}
