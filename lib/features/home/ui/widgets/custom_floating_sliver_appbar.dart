import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomFloatingSliverAppBar extends StatelessWidget {
  const CustomFloatingSliverAppBar(
      {super.key, required this.title, required this.image, this.style});

  final String? title;
  final String? image;
  final TextStyle? style;
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
          title ?? '',
          style: style ?? AppTextStyles.style20W600,
        ),
        background: CachedNetworkImage(
          imageUrl: image ?? '',
          errorWidget: (context, url, error) => Image.asset(
            AppImages.noImage,
            fit: BoxFit.cover,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
