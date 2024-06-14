import 'dart:ui';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/desctiption_section_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_details_section_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_images_slider.dart';

import 'package:flutter/material.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({super.key, required this.rocket});
  final RocketModel rocket;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.rocketBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
              shadows: [
                Shadow(
                    color: Colors.black, offset: (Offset(1, 1)), blurRadius: 1)
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            rocket.name ?? '',
            style: AppTextStyles.style20W600,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.275,
                        width: MediaQuery.of(context).size.width,
                        child: RocketImagesSlider(
                          rocketImages: rocket.flickrImages,
                        ),
                      ),
                      DescriptionSectionWidget(
                        descriptionText: rocket.description ?? '',
                        rocketUrl: rocket.wikipedia ?? '',
                      ),
                      RocketDetailsSectionWidget(rocket: rocket)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
