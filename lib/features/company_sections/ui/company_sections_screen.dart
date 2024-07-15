import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/company_sections/models/company_sections_model.dart';
import 'package:beyond_the_stars/features/company_sections/ui/widgets/company_sections_item.dart';
import 'package:flutter/material.dart';

class CompanySectionsScreen extends StatelessWidget {
  const CompanySectionsScreen({super.key});

  final List<CompanySectionsModel> companyInfo = const [
    CompanySectionsModel(
      title: 'Ships',
      image: 'assets/images/ships.jpg',
    ),
    CompanySectionsModel(
      title: 'Crew',
      image: 'assets/images/crew.jpg',
    ),
    CompanySectionsModel(
      title: 'About',
      image: 'assets/images/about.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CompanySectionsItem(
            companyInfoModel: companyInfo[0],
            onTap: () {
              Navigator.of(context).pushNamed(Routes.ships);
            },
          ),
          CompanySectionsItem(
            companyInfoModel: companyInfo[1],
            onTap: () {
              Navigator.of(context).pushNamed(Routes.crewScreen);
            },
          ),
          CompanySectionsItem(
            companyInfoModel: companyInfo[2],
            onTap: () {
              Navigator.of(context).pushNamed(Routes.companyInfo);
            },
          ),
          const SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
