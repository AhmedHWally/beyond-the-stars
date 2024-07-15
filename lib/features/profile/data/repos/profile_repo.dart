import 'package:beyond_the_stars/core/errors/cloud_firestore_failure.dart';
import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/firebase_auth_failure.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  final FirebaseFirestore firebaseFirestoreInstance;
  final FirebaseAuth firebaseAuthInstance;

  ProfileRepo(
      {required this.firebaseFirestoreInstance,
      required this.firebaseAuthInstance});
  Future<Either<Failure, ProfileModel>> getProfileData(
      {required String id}) async {
    try {
      final response =
          await firebaseFirestoreInstance.collection('users').doc(id).get();
      return right(ProfileModel.fromJson(response.data()!));
    } catch (error) {
      if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(CloudFirestoreFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> logout() async {
    try {
      await firebaseAuthInstance.signOut();
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
