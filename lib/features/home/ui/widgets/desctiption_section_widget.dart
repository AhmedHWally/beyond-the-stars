import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionSectionWidget extends StatefulWidget {
  const DescriptionSectionWidget(
      {super.key, required this.descriptionText, required this.rocketUrl});
  final String descriptionText;
  final String rocketUrl;
  @override
  State<DescriptionSectionWidget> createState() =>
      _DescriptionSectionWidgetState();
}

class _DescriptionSectionWidgetState extends State<DescriptionSectionWidget> {
  bool _showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: Text(
            'Description📜',
            style: AppTextStyles.style26W600,
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.topCenter,
          child: Container(
            padding:
                const EdgeInsets.only(top: 12, right: 10, bottom: 6, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.descriptionText,
                  maxLines: _showFullText ? null : 3,
                  style: AppTextStyles.style20W600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _showFullText = !_showFullText;
                        });
                      },
                      icon: Icon(_showFullText
                          ? Icons.arrow_circle_up
                          : Icons.arrow_circle_down),
                      color: Colors.white,
                      iconSize: 32,
                    ),
                    if (_showFullText)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white54,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            Uri url = Uri.parse(widget.rocketUrl);
                            try {
                              await launchUrl(url);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('There was an error, try again later'),
                              ));
                            }
                          },
                          child: const Text('Visit wikipedia'))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
