import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/functions/build_companyinfotextstyle.dart';
import 'package:beyond_the_stars/features/company_info/data/models/company_info_model/company_info_model.dart';
import 'package:beyond_the_stars/core/widgets/company_info_animated_colorized_text.dart';
import 'package:beyond_the_stars/features/company_info/ui/widgets/company_info_column.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyInfoScreenBody extends StatelessWidget {
  const CompanyInfoScreenBody({super.key, required this.companyInfo});
  final CompanyInfoModel companyInfo;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            companyInfo.ceo ?? '',
            style: buildCompanyInfoTextStyle(fontSize: 28),
          ),
          const CompanyInfoAnimatedColorizedText(
            text: 'ceo of spaceX',
            fontSize: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompanyInfoColumn(
                    value: companyInfo.employees.toString(),
                    title: 'employees'),
                CompanyInfoColumn(
                    value: companyInfo.vehicles.toString(), title: 'launch'),
                CompanyInfoColumn(
                    value: companyInfo.founded.toString(), title: 'founded'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Image.asset(AppImages.elonmusk),
                const Divider(
                  height: 0,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: CompanyInfoAnimatedColorizedText(
                  text: 'spaceX Info: ', fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              companyInfo.summary ?? '',
              style: buildCompanyInfoTextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: CompanyInfoAnimatedColorizedText(
                  text: 'Social Media: ', fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompanyInfoColumn(
                  title: 'twitter',
                  link: companyInfo.links?.twitter,
                  icon: FontAwesomeIcons.twitter,
                ),
                CompanyInfoColumn(
                  title: 'website',
                  link: companyInfo.links?.website,
                  icon: FontAwesomeIcons.globe,
                ),
                CompanyInfoColumn(
                  title: 'flicker',
                  link: companyInfo.links?.flickr,
                  icon: FontAwesomeIcons.flickr,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
