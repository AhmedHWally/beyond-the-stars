import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/firebase_auth_failure.dart';
import 'package:beyond_the_stars/features/login/data/models/login_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  final FirebaseAuth firebaseAuthInstance;

  LoginRepo({required this.firebaseAuthInstance});

  Future<Either<Failure, UserCredential>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
      return Right(response);
    } catch (error) {
      if (error is FirebaseAuthException) {
        return Left(FirebaseAuthFailure.fromFirebaseAuthException(error));
      } else {
        return Left(FirebaseAuthFailure(error.toString()));
      }
    }
  }
}
