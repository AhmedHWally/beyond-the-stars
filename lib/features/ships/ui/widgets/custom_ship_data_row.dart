import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomShipDataRow extends StatelessWidget {
  const CustomShipDataRow(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title:',
              style: AppTextStyles.style18W600,
            ),
            Expanded(
                child: Text(
              textAlign: TextAlign.end,
              value == 'null' ? '0' : value,
              style: AppTextStyles.style18W600,
            )),
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
