import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LaunchpadItem extends StatelessWidget {
  const LaunchpadItem({super.key, required this.launchPad});
  final LaunchPadModel launchPad;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xff5A72A0),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 150,
                    child: CachedNetworkImage(
                      imageUrl: launchPad.images!.large![0],
                      fit: BoxFit.cover,
                      // placeholder: (context, url) => Center(
                      //   child: LoadingAnimationWidget.flickr(
                      //     leftDotColor: const Color(0xFF1A1A3F),
                      //     rightDotColor: const Color(0xFFEA3799),
                      //     size: 40,
                      //   ),
                      // ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      launchPad.fullName ?? '',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 1)
                          ]),
                    ),
                    const Flexible(
                        child: SizedBox(
                      height: 8,
                    )),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 28,
                        ),
                        Expanded(
                            child: Text(
                          launchPad.locality ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
