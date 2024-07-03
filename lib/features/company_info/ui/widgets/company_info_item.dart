import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/company_info/models/company_info_model.dart';
import 'package:flutter/material.dart';

class CompanyInfoItem extends StatelessWidget {
  const CompanyInfoItem(
      {super.key, required this.companyInfoModel, this.onTap});
  final CompanyInfoModel companyInfoModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage(
                      companyInfoModel.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              companyInfoModel.title,
              style: AppTextStyles.style25W500.copyWith(shadows: [
                const Shadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 1)
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
