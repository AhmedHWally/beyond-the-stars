import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.profile});
  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
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
                    Container(
                      width: MediaQuery.sizeOf(context).height * 0.25,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: profile.image,
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const CustomLoadingShimmer(),
                        errorWidget: (context, url, error) => Container(
                            width: MediaQuery.sizeOf(context).height * 0.25,
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff424F66)),
                            child:
                                const Center(child: Icon(Icons.error_outline))),
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
                child: TextFormField(
                  initialValue: profile.name,
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
                            onPressed: () {},
                            child: const Text(
                              'cancel',
                              style: TextStyle(color: Colors.white),
                            ))),
                    Expanded(
                        child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              splashFactory: InkSplash.splashFactory),
                          child: const Text(
                            'save',
                            style: TextStyle(color: Colors.white),
                          )),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
