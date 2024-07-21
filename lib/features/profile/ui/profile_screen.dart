import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:beyond_the_stars/features/profile/logic/profile_bloc/profile_bloc.dart';
import 'package:beyond_the_stars/features/profile/ui/widgets/custom_profilescreen_component.dart';
import 'package:beyond_the_stars/features/profile/ui/widgets/logout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileDataFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.style20W600,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is GetProfileDataSuccess) {
          print(state.profileData.image);
          return Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: Container(
                  width: MediaQuery.sizeOf(context).height * 0.25,
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: state.profileData.image,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const CustomLoadingShimmer(),
                    errorWidget: (context, url, error) => Container(
                        width: MediaQuery.sizeOf(context).height * 0.25,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff424F66)),
                        child: const Center(child: Icon(Icons.error_outline))),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ('welcome'),
                    style: AppTextStyles.style18W600,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    state.profileData.name,
                    style: AppTextStyles.style20W600,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomProfileScreenComponent(
                title: 'Edit profile',
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.editProfileScreen,
                      arguments: state.profileData);
                },
                icon: Icons.edit,
              ),
              const SizedBox(
                height: 18,
              ),
              const LogoutButton()
            ],
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
    );
  }
}
