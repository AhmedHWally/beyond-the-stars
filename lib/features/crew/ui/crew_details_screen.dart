import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
            child: Column(
              children: [
                Flexible(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    width: MediaQuery.sizeOf(context).width,
                    child: Hero(
                        tag: crewPerson.id!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: crewPerson.image!,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  top: 16,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            radius: 24,
                                            backgroundColor:
                                                Colors.black.withOpacity(0.3),
                                            child: const Center(
                                              child: FittedBox(
                                                  child: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: GestureDetector(
                                          onTap: () async {
                                            Uri url = Uri.parse(
                                                crewPerson.wikipedia ?? '');
                                            try {
                                              await launchUrl(url);
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'There was an error, try again later'),
                                              ));
                                            }
                                          },
                                          child: const Icon(
                                            Icons.info,
                                            size: 32,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 1)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        crewPerson.name ?? '',
                        style: AppTextStyles.style18W600,
                      )),
                      const Icon(Icons.work),
                      const SizedBox(width: 4),
                      Text(
                        crewPerson.agency ?? '',
                        style: AppTextStyles.style18W600,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
