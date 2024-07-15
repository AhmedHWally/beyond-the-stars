import 'package:beyond_the_stars/core/widgets/company_info_animated_colorized_text.dart';
import 'package:beyond_the_stars/core/widgets/company_info_animated_typer_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfoColumn extends StatelessWidget {
  const CompanyInfoColumn(
      {super.key, this.value, required this.title, this.link, this.icon});
  final String? value;
  final String title;
  final String? link;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return value != null
        ? Column(
            children: [
              CompanyInfoAnimatedTyperText(
                text: value!,
                fontSize: 27,
              ),
              CompanyInfoAnimatedColorizedText(
                text: title,
                fontSize: 16,
              )
            ],
          )
        : InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              Uri url = Uri.parse(link ?? '');
              try {
                await launchUrl(url);
              } catch (e) {
                debugPrint('error happend');
              }
            },
            child: Column(
              children: [
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 26,
                  shadows: const [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 1)
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                CompanyInfoAnimatedColorizedText(text: title, fontSize: 16)
              ],
            ));
  }
}
