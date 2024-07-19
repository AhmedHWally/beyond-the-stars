import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/widgets/edit_image_bloc_consumer.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/widgets/edit_profile_image_container.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/widgets/edit_username_form.dart';

import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:beyond_the_stars/features/profile/logic/profile_bloc/profile_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.profile});
  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          if (context.read<UploadProfileImageBloc>().state
              is! UploadProfileImageLoading) {
            if (context.read<EditProfileBloc>().imagePath.isNotEmpty) {
              context.read<EditProfileBloc>().add(CancelEditedDataEvent());
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
            }
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                EditImageBlocConsumer(profile: profile),
                const SizedBox(
                  height: 16,
                ),
                EditUserNameForm(profile: profile),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color(0xff424F66),
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  splashFactory: InkSplash.splashFactory),
                              onPressed: () {
                                if (context.read<UploadProfileImageBloc>().state
                                    is! UploadProfileImageLoading) {
                                  if (context
                                      .read<EditProfileBloc>()
                                      .imagePath
                                      .isNotEmpty) {
                                    context
                                        .read<EditProfileBloc>()
                                        .add(CancelEditedDataEvent());
                                  } else {
                                    Navigator.of(context).pop();
                                  }
                                }
                              },
                              child: const Text(
                                'cancel',
                                style: TextStyle(color: Colors.white),
                              ))),
                      Expanded(
                          child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            onPressed: () {
                              if (context
                                      .read<EditProfileBloc>()
                                      .formKey
                                      .currentState!
                                      .validate() &&
                                  context.read<UploadProfileImageBloc>().state
                                      is! UploadProfileImageLoading) {
                                log(context.read<EditProfileBloc>().name);
                                context
                                    .read<EditProfileBloc>()
                                    .add(SaveEditedDataEvent());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                splashFactory: InkSplash.splashFactory),
                            child:
                                BlocListener<EditProfileBloc, EditProfileState>(
                              listener: (context, state) {
                                log(state.toString());
                                if (state is EditProfileSuccess) {
                                  Navigator.of(context).pop();
                                  context
                                      .read<ProfileBloc>()
                                      .add(GetProfileDataEvent());
                                } else if (state is EditProfileFailure) {
                                  showToast(text: state.errorMessage);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: BlocBuilder<EditProfileBloc,
                                  EditProfileState>(
                                builder: (context, state) {
                                  if (state is EditProfileLoading) {
                                    return const Center(
                                      child: SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      'save',
                                      style: TextStyle(color: Colors.white),
                                    );
                                  }
                                },
                              ),
                            )),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
