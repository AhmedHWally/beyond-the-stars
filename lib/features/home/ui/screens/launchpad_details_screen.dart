import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/custom_floating_sliver_appbar.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/desctiption_section_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/launchpad_details_section_widget.dart';
import 'package:flutter/material.dart';

class LaunchpadDetailsScreen extends StatelessWidget {
  const LaunchpadDetailsScreen({super.key, required this.launchPad});
  final LaunchPadModel launchPad;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.rocketBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomFloatingSliverAppBar(launchPad: launchPad),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: DescriptionSectionWidget(
                  descriptionText: launchPad.details!,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: LaunchPadDetailsSectionWidget(launchPad: launchPad),
              ),
            )
          ],
        ),
      ),
    );
  }
}
