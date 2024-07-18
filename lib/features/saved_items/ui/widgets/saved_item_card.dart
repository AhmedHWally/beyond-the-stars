import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:beyond_the_stars/features/saved_items/data/models/saved_item_model.dart';
import 'package:beyond_the_stars/features/saved_items/logic/save_items_bloc/save_items_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedItemCard extends StatelessWidget {
  const SavedItemCard({super.key, required this.item});
  final SavedItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        color: const Color(0xff5A72A0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(9)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .325,
                    height: MediaQuery.sizeOf(context).height * .175,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: item.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CustomLoadingShimmer(),
                        errorWidget: (context, error, stackTrace) =>
                            Image.asset(
                          AppImages.noImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.type,
                    style: AppTextStyles.style18W600,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    item.title,
                    style: AppTextStyles.style16W600,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('🌎${item.country}')),
                      BlocListener<SaveItemsBloc, SaveItemsState>(
                          listener: (context, state) {
                            if (state is IsItemSaved) {
                              log('done save or delete ');
                              context
                                  .read<SaveItemsBloc>()
                                  .add(GetSavedItemsEvent());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () {
                                context.read<SaveItemsBloc>().add(
                                    AddOrRemoveItemEvent(
                                        isSaved: true, savedItem: item));
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
