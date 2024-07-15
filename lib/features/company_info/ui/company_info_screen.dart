import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/company_info/logic/company_info_bloc/company_info_bloc.dart';
import 'package:beyond_the_stars/features/company_info/ui/widgets/company_info_screen_body.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/go_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.rocketBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<CompanyInfoBloc, CompanyInfoState>(
                  builder: (context, state) {
                if (state is CompanyInfoFailure) {
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: AppTextStyles.style20W600,
                      textAlign: TextAlign.center,
                    ),
                  );
                } else if (state is CompanyInfoSuccess) {
                  return CompanyInfoScreenBody(companyInfo: state.companyInfo);
                } else {
                  return const Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: SpinKitWave(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              }),
              const Positioned(left: 16, child: GoBackButton())
            ],
          ),
        ),
      ),
    );
  }
}
