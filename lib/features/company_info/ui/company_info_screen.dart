import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/company_info/models/company_info_model.dart';
import 'package:beyond_the_stars/features/company_info/ui/widgets/company_info_item.dart';
import 'package:flutter/material.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  final List<CompanyInfoModel> companyInfo = const [
    CompanyInfoModel(
      title: 'Ships',
      image: 'assets/images/ships.jpg',
    ),
    CompanyInfoModel(
      title: 'Crew',
      image: 'assets/images/crew.jpg',
    ),
    CompanyInfoModel(
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
          CompanyInfoItem(
            companyInfoModel: companyInfo[0],
            onTap: () {
              Navigator.of(context).pushNamed(Routes.ships);
            },
          ),
          CompanyInfoItem(
            companyInfoModel: companyInfo[1],
            onTap: () {
              print('1');
            },
          ),
          CompanyInfoItem(
            companyInfoModel: companyInfo[2],
            onTap: () {
              print('2');
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
