import 'dart:ui';

import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/desctiption_section_widget.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/details_section_widget.dart';
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
              image: AssetImage('assets/images/rocket.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
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
                      DetailsSectionWidget(rocket: rocket)
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
