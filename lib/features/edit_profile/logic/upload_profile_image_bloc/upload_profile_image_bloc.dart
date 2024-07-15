import 'package:beyond_the_stars/features/edit_profile/data/repos/user_image_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'upload_profile_image_event.dart';
part 'upload_profile_image_state.dart';

class UploadProfileImageBloc
    extends Bloc<UploadProfileImageEvent, UploadProfileImageState> {
  UploadProfileImageBloc(this.userImageRepo)
      : super(UploadProfileImageInitial()) {
    on<UploadProfileImageEvent>(_uploadProfileImage);
  }
  final UserImageRepo userImageRepo;
  _uploadProfileImage(UploadProfileImageEvent event,
      Emitter<UploadProfileImageState> emit) async {
    var result = await userImageRepo.pickImage();
    result.fold((left) {}, (imageModel) async {
      var uploadImageResult =
          await userImageRepo.updateProfileImage(imageModel: imageModel);
      uploadImageResult.fold(
          (failre) =>
              emit(UploadProfileImageFailure(errMessage: failre.message)),
          (imageUrl) => emit(UploadProfileImageSuccess(imageUrl: imageUrl)));
    });
  }
}
