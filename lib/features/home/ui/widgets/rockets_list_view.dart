import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/logic/rockets_bloc/rockets_bloc.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_item.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RocketsListView extends StatelessWidget {
  const RocketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<RocketsBloc, RocketsState>(
      builder: (context, state) {
        if (state is GetRocketsSuccess) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  state.rockets.length,
                  (index) => SizedBox(
                        width: screenWidth * 0.385,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 16, top: 8, bottom: 8),
                            child: RocketItem(
                              rocket: state.rockets[index],
                            ),
                          ),
                        ),
                      )),
            ),
          );
        } else if (state is GetRocketsFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.style20W600,
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  4,
                  (index) => SizedBox(
                        width: screenWidth * 0.385,
                        child: const Padding(
                          padding:
                              EdgeInsets.only(right: 16, top: 8, bottom: 8),
                          child: CustomLoadingShimmer(),
                        ),
                      )),
            ),
          );
        }
      },
    );
  }
}
