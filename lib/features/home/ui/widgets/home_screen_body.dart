import 'package:beyond_the_stars/core/constants/text_styles.dart';

import 'package:beyond_the_stars/features/home/ui/widgets/custom_expolre_message_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/launchpads_list_view.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rockets_list_view.dart';

import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomExploreMessageWidget(),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Rockets🚀",
              style: AppTextStyles.style26W600,
            ),
          ),
          SliverToBoxAdapter(
            child: RocketsListView(),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text("launch pads 🚩", style: AppTextStyles.style26W600),
          )),
          LaunchpadsListView(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
