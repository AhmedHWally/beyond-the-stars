import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DisplayDetailsRow extends StatelessWidget {
  final String title;
  final String? value;

  const DisplayDetailsRow(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: AppTextStyles.style20W600,
          ),
          Flexible(
            child: Text(
              value ?? 'not known',
              textAlign: TextAlign.end,
              style: AppTextStyles.style20W600,
            ),
          ),
        ],
      ),
    );
  }
}
