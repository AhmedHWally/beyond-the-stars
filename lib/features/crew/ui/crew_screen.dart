import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/crew/logic/crew_bloc/crew_bloc.dart';
import 'package:beyond_the_stars/features/crew/ui/widgets/crew_item.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/go_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<CrewBloc, CrewState>(
                builder: (context, state) {
                  if (state is LoadCrewFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppTextStyles.style20W600,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is LoadCrewSuccess) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12),
                          itemCount: state.crew.length,
                          itemBuilder: (context, index) =>
                              CrewItem(crewPersonData: state.crew[index])),
                    );
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
                },
              ),
              const Positioned(left: 16, child: GoBackButton())
            ],
          ),
        ),
      ),
    );
  }
}
