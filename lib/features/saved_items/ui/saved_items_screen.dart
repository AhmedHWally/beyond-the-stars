import 'dart:developer';

import 'package:beyond_the_stars/features/saved_items/logic/save_items_bloc/save_items_bloc.dart';
import 'package:beyond_the_stars/features/saved_items/ui/widgets/saved_item_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  void initState() {
    log('helllo my friend');
    context.read<SaveItemsBloc>().add(GetSavedItemsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveItemsBloc, SaveItemsState>(
        builder: (context, state) {
      if (state is GetSavedItemsSuccess) {
        log('success');
        if (state.savedItems.isEmpty) {
          return const Center(
            child: Text('no saved items'),
          );
        } else {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  SavedItemCard(item: state.savedItems[index]),
              itemCount: state.savedItems.length);
        }
      } else {
        return const Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: SpinKitWave(
              color: Colors.white,
            ),
          ),
        );
      }
    });
  }
}
