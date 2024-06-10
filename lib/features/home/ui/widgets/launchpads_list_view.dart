import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/logic/launch_pad_bloc/launch_pad_bloc.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/launchpad_item.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaunchpadsListView extends StatelessWidget {
  const LaunchpadsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchPadBloc, LaunchPadState>(
        builder: (context, state) {
      if (state is GetLaunchPadsSuccess) {
        return SliverList.builder(
          itemBuilder: (context, index) => LaunchpadItem(
            launchPad: state.launchpads[index],
          ),
          itemCount: state.launchpads.length,
        );
      } else if (state is GetLaunchPadsFailure) {
        return SliverToBoxAdapter(
          child: Center(
              child:
                  Text(state.errorMessage, style: AppTextStyles.style20W600)),
        );
      } else {
        return SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    height: 150,
                    child: CustomLoadingShimmer(),
                  ),
                ));
      }
    });
  }
}
