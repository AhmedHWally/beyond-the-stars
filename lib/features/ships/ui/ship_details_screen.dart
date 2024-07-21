import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/widgets/favorite_floating_action_button.dart';
import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:beyond_the_stars/features/saved_items/logic/save_items_bloc/save_items_bloc.dart';
import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/ship_informations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipDetailsScreen extends StatelessWidget {
  const ShipDetailsScreen({super.key, required this.ship});
  final ShipsModel ship;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Flexible(
                    child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  width: MediaQuery.sizeOf(context).width,
                  child: Hero(
                      tag: ship.id ?? '',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: ship.image ?? '',
                              errorWidget: (context, url, error) => Image.asset(
                                AppImages.noImage,
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.3),
                                  child: const Center(
                                    child: FittedBox(
                                        child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                )),
                ShipInformations(ship: ship)
              ],
            ),
          ),
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
                        title: ship.name.toString(),
                        imageUrl: ship.image.toString(),
                        country: ship.homePort.toString(),
                        type: "Ship")));
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
