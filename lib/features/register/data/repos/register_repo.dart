import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/errors/cloud_firestore_failure.dart';
import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/firebase_auth_failure.dart';
import 'package:beyond_the_stars/features/register/data/models/register_new_account_model.dart';
import 'package:beyond_the_stars/features/register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo {
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseFirestoreInstance;

  RegisterRepo(
      {required this.firebaseAuthInstance,
      required this.firebaseFirestoreInstance});

  Future<Either<Failure, UserModel>> register(
      RegisterNewAccountModel registerNewAccountModel) async {
    try {
      final response =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: registerNewAccountModel.email,
        password: registerNewAccountModel.password,
      );
      UserModel userModel = UserModel(
        name: registerNewAccountModel.name,
        image: AppImages.profileImage,
        id: response.user?.uid ?? '',
      );
      return Right(userModel);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }

  Future<Either<Failure, Unit>> addUserToFireStore(UserModel userModel) async {
    try {
      await firebaseFirestoreInstance
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toJson());
      return const Right(unit);
    } catch (error) {
      if (error is FirebaseException) {
        return Left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return Left(CloudFirestoreFailure(error.toString()));
      }
    }
  }
}
