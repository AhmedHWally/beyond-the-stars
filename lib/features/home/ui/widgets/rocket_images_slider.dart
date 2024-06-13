import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/widgets/image_loading_failure_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RocketImagesSlider extends StatelessWidget {
  const RocketImagesSlider({super.key, required this.rocketImages});
  final List<String>? rocketImages;
  @override
  Widget build(BuildContext context) {
    return rocketImages != null
        ? CarouselSlider.builder(
            itemCount: rocketImages!.length,
            itemBuilder: (context, index, realIndex) => Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: rocketImages![index],
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) {
                        return const ImageLoadingFailureWidget();
                      },
                    ),
                  ),
                ),
            options: CarouselOptions(
                viewportFraction: 0.75,
                height: MediaQuery.sizeOf(context).height * 0.275,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                enlargeFactor: 0.25))
        : const Center(
            child: Text(
              'Failed loading the rocket images',
              textAlign: TextAlign.center,
              style: AppTextStyles.style20W600,
            ),
          );
  }
}
