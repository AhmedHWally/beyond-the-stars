import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/widgets/edit_profile_image_container.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class EditImageBlocConsumer extends StatelessWidget {
  const EditImageBlocConsumer({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          BlocListener<UploadProfileImageBloc, UploadProfileImageState>(
            listener: (context, state) {
              if (state is UploadProfileImageSuccess) {
                context.read<EditProfileBloc>().imagePath = state.imagePath;
                context.read<EditProfileBloc>().imageUrl = state.imageUrl;
              } else if (state is UploadProfileImageFailure) {
                showToast(text: state.errMessage);
              }
            },
            child: BlocBuilder<UploadProfileImageBloc, UploadProfileImageState>(
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
                  return Shimmer(
                    gradient: const LinearGradient(colors: [
                      Color(0xff415A77),
                      Color(0xff778DA9),
                      Colors.blueGrey
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    child: Container(
                      width: MediaQuery.sizeOf(context).height * 0.25,
                      height: MediaQuery.sizeOf(context).height * 0.25,
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
    );
  }
}
