import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class RocketItem extends StatelessWidget {
  const RocketItem({
    super.key,
    required this.rocket,
  });
  final RocketModel rocket;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: rocket.flickrImages![0],
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
        ),
        placeholder: (context, url) => const CustomLoadingShimmer(),
      ),
    );
  }
}
