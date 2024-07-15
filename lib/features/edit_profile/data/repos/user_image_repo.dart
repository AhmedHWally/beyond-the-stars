import 'dart:io';

import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/firebase_storage_failure.dart';
import 'package:beyond_the_stars/features/edit_profile/data/models/image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UserImageRepo {
  final FirebaseStorage firebaseStorage;

  UserImageRepo({required this.firebaseStorage});

  Future<Either<Unit, ImageModel>> pickImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return left(unit);
    }
    final File image = File(pickedImage.path);
    final String imagePath = basename(image.path);
    return right(ImageModel(file: image, imagePath: imagePath));
  }

  Future<Either<Failure, String>> updateProfileImage(
      {required ImageModel imageModel}) async {
    try {
      Reference reference =
          firebaseStorage.ref('profilePictures').child(imageModel.imagePath);
      await reference.putFile(imageModel.file);
      String imageUrl = await reference.getDownloadURL();
      return Right(imageUrl);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }
    }
  }
}
