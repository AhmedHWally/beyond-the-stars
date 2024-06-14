import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/functions/build_divider.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/display_details_row.dart';
import 'package:flutter/material.dart';

class RocketDetailsSectionWidget extends StatelessWidget {
  const RocketDetailsSectionWidget({super.key, required this.rocket});
  final RocketModel rocket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Text(
            'Details🚀',
            style: AppTextStyles.style26W600,
          ),
        ),
        DisplayDetailsRow(title: "Name", value: rocket.name),
        buildDivider(),
        DisplayDetailsRow(title: "Type", value: rocket.type),
        buildDivider(),
        DisplayDetailsRow(
            title: "Cost per launch", value: "${rocket.costPerLaunch} \$"),
        buildDivider(),
        DisplayDetailsRow(title: "First flight", value: rocket.firstFlight),
        buildDivider(),
        DisplayDetailsRow(title: "Company", value: rocket.company),
        buildDivider(),
        DisplayDetailsRow(title: "Country", value: rocket.country),
        buildDivider(),
        DisplayDetailsRow(
            title: "Height (m)",
            value: '${rocket.height?.meters ?? 'un known'}'),
        buildDivider(),
        DisplayDetailsRow(
            title: "Mass (kg)", value: '${rocket.mass?.kg ?? 'un known'}'),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
