import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/functions/build_divider.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/display_details_row.dart';
import 'package:flutter/material.dart';

class LaunchPadDetailsSectionWidget extends StatelessWidget {
  const LaunchPadDetailsSectionWidget({super.key, required this.launchPad});
  final LaunchPadModel launchPad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Text(
            'Details👨‍💻',
            style: AppTextStyles.style26W600,
          ),
        ),
        DisplayDetailsRow(title: "Full name", value: launchPad.fullName),
        buildDivider(),
        DisplayDetailsRow(title: "Locality", value: launchPad.locality),
        buildDivider(),
        DisplayDetailsRow(title: "Region", value: launchPad.region),
        buildDivider(),
        DisplayDetailsRow(
            title: "Number of launches",
            value: '${launchPad.launches?.length ?? 'un known'}'),
        buildDivider(),
        DisplayDetailsRow(
            title: "Success Landings",
            value: '${launchPad.launchSuccesses ?? 'un known'}'),
        buildDivider(),
        DisplayDetailsRow(title: "Status", value: launchPad.status),
      ],
    );
  }
}
