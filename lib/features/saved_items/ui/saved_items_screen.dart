import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/saved_items/logic/save_items_bloc/save_items_bloc.dart';
import 'package:beyond_the_stars/features/saved_items/ui/widgets/saved_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isLottieAnimationDone = false;
  @override
  void initState() {
    context.read<SaveItemsBloc>().add(GetSavedItemsEvent());
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveItemsBloc, SaveItemsState>(
        builder: (context, state) {
      if (state is GetSavedItemsSuccess) {
        log('success');
        if (state.savedItems.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.35,
                  child: LottieBuilder.asset(
                    AppImages.emptyLottie,
                    repeat: false,
                    controller: animationController,
                    onLoaded: (composition) {
                      animationController.duration = composition.duration * 0.7;
                      animationController.forward().then((value) {
                        setState(() {
                          isLottieAnimationDone = true;
                        });
                      });
                    },
                  )),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: isLottieAnimationDone ? 1 : 0,
                child: const Text(
                  'No saved items',
                  style: AppTextStyles.style26W600,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
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
