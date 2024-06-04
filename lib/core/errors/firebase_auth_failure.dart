import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.message);

  factory FirebaseAuthFailure.fromFirebaseAuthException(
      FirebaseException firebaseException) {
    switch (firebaseException.code) {
      case 'invalid-email':
        return FirebaseAuthFailure('Invalid email address');
      case 'user-not-found':
        return FirebaseAuthFailure('User not found');
      case 'wrong-password':
        return FirebaseAuthFailure('Wrong password');
      case 'user-disabled':
        return FirebaseAuthFailure('User account is disabled');
      case 'weak-password':
        return FirebaseAuthFailure('Password should be at least 6 characters');
      case 'email-already-in-use':
        return FirebaseAuthFailure('Email is already in use');
      case 'operation-not-allowed':
        return FirebaseAuthFailure('Operation not allowed');
      case 'too-many-requests':
        return FirebaseAuthFailure(
            'Too many login attempts. Please try again later.');
      case 'network-request-failed':
        return FirebaseAuthFailure('Please check your internet');
      default:
        return FirebaseAuthFailure('login was canceled');
    }
  }
}
