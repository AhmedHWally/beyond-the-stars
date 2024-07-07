import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CrewItem extends StatelessWidget {
  const CrewItem({super.key, required this.crewPersonData});
  final CrewModel crewPersonData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.crewDetailsScreen, arguments: crewPersonData);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
                tag: crewPersonData.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: crewPersonData.image ?? '',
                    placeholder: (context, url) => const CustomLoadingShimmer(),
                    errorWidget: (context, url, error) => Image.asset(
                      AppImages.noImage,
                      fit: BoxFit.cover,
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      color: const Color(0xff5A72A0).withOpacity(0.5)),
                  child: Center(
                      child: Text(
                    crewPersonData.name ?? '',
                    style: AppTextStyles.style18W600.copyWith(letterSpacing: 0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
