import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/widgets/favorite_floating_action_button.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/custom_floating_sliver_appbar.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/desctiption_section_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/launchpad_details_section_widget.dart';
import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:beyond_the_stars/features/saved_items/logic/save_items_bloc/save_items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            CustomFloatingSliverAppBar(
              title: launchPad.name,
              image: launchPad.images?.large?[0],
            ),
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
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 58,
              ),
            )
          ],
        ),
        floatingActionButton: BlocBuilder<SaveItemsBloc, SaveItemsState>(
            builder: (context, state) {
          if (state is IsItemSaved) {
            return FavoriteFloatingActionButton(
              onPressed: () {
                context.read<SaveItemsBloc>().add(AddOrRemoveItemEvent(
                    isSaved: state.isItemSaved,
                    savedItem: SavedItemModel(
                        id: null,
                        title: launchPad.fullName.toString(),
                        imageUrl: launchPad.images!.large![0].toString(),
                        country: launchPad.locality.toString(),
                        type: "Launch Pad")));
              },
              icon: state.isItemSaved ? Icons.star : Icons.star_border_outlined,
            );
          } else {
            return FloatingActionButton(
              onPressed: () {},
              backgroundColor: const Color(0xff5A72A0),
            );
          }
        }),
      ),
    );
  }
}
