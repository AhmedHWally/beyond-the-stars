import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CrewDetailsScreen extends StatelessWidget {
  const CrewDetailsScreen({super.key, required this.crewPerson});
  final CrewModel crewPerson;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: 300,
            height: 350,
            child: Hero(
                tag: crewPerson.id!,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: crewPerson.image!,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
