import 'package:beyond_the_stars/core/errors/cloud_firestore_failure.dart';
import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/firebase_storage_failure.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileRepo {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;
  EditProfileRepo(
      {required this.firebaseFirestore, required this.firebaseStorage});

  Future<Either<Failure, Unit>> updateProfile(
      {required ProfileModel profileData}) async {
    try {
      if (profileData.image == '' && profileData.name == '') {
        return right(unit);
      }
      if (profileData.image == '') {
        await firebaseFirestore.collection('users').doc(profileData.id).update({
          'name': profileData.name,
          'id': profileData.id,
        });
      }
      if (profileData.name == '') {
        await firebaseFirestore.collection('users').doc(profileData.id).update({
          'image': profileData.image,
          'id': profileData.id,
        });
      } else if (profileData.image != "" && profileData.name != "") {
        await firebaseFirestore
            .collection('users')
            .doc(profileData.id)
            .update(profileData.toJson());
      }
      return right(unit);
    } catch (error) {
      if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(CloudFirestoreFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> deleteProfileImage(String imagePath) async {
    try {
      Reference reference =
          firebaseStorage.ref('profilePictures').child(imagePath);
      await reference.delete();
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return Left(FirebaseStorageFailure(error.toString()));
      }
    }
  }
}
