import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EditProfileImageContainer extends StatelessWidget {
  const EditProfileImageContainer({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).height * 0.25,
      height: MediaQuery.sizeOf(context).height * 0.25,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, progress) =>
            const CustomLoadingShimmer(),
        errorWidget: (context, url, error) => Container(
            width: MediaQuery.sizeOf(context).height * 0.25,
            height: MediaQuery.sizeOf(context).height * 0.25,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xff424F66)),
            child: const Center(child: Icon(Icons.error_outline))),
      ),
    );
  }
}
