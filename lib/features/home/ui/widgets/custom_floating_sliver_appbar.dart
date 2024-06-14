import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomFloatingSliverAppBar extends StatelessWidget {
  const CustomFloatingSliverAppBar({
    super.key,
    required this.launchPad,
  });

  final LaunchPadModel launchPad;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 1, offset: Offset(1, 1))
            ],
          )),
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          launchPad.name ?? '',
          style: AppTextStyles.style20W600,
        ),
        background: CachedNetworkImage(
          imageUrl: launchPad.images!.large![0],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
