import 'package:beyond_the_stars/features/login/data/repo/login_repo.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:beyond_the_stars/features/register/data/repos/register_repo.dart';
import 'package:beyond_the_stars/features/register/logic/add_user_to_firestore_bloc.dart/add_user_to_fire_store_bloc.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // firebase
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // register
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(
      firebaseAuthInstance: getIt.get<FirebaseAuth>(),
      firebaseFirestoreInstance: getIt.get<FirebaseFirestore>(),
    ),
  );
  getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(getIt.get<RegisterRepo>()));

  getIt.registerFactory<AddUserToFireStoreBloc>(
    () => AddUserToFireStoreBloc(
      getIt.get<RegisterRepo>(),
    ),
  );

  // login
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      firebaseAuthInstance: getIt.get<FirebaseAuth>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(() => LoginBloc(getIt.get<LoginRepo>()));
}
