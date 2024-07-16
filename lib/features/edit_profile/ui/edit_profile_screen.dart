import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/widgets/edit_profile_image_container.dart';

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
                Flexible(
                  child: Stack(
                    children: [
                      BlocListener<UploadProfileImageBloc,
                          UploadProfileImageState>(
                        listener: (context, state) {
                          if (state is UploadProfileImageSuccess) {
                            context.read<EditProfileBloc>().imagePath =
                                state.imagePath;
                            context.read<EditProfileBloc>().imageUrl =
                                state.imageUrl;
                          } else if (state is UploadProfileImageFailure) {
                            showToast(text: state.errMessage);
                          }
                        },
                        child: BlocBuilder<UploadProfileImageBloc,
                            UploadProfileImageState>(
                          builder: (context, state) {
                            if (state is UploadProfileImageSuccess) {
                              return EditProfileImageContainer(
                                imageUrl: state.imageUrl,
                              );
                            } else if (state is UploadProfileImageInitial) {
                              return EditProfileImageContainer(
                                imageUrl: profile.image,
                              );
                            } else {
                              log('message');
                              return Shimmer(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xff415A77),
                                      Color(0xff778DA9),
                                      Colors.blueGrey
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.black87,
                          radius: 16,
                          child: FittedBox(
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                BlocProvider.of<UploadProfileImageBloc>(context)
                                    .add(UploadProfileImageEvent());
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: context.read<EditProfileBloc>().formKey,
                    child: TextFormField(
                      initialValue: profile.name,
                      onChanged: (value) {
                        context.read<EditProfileBloc>().name = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'We don\'t accept empty names';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xff424F66),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                ),
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
