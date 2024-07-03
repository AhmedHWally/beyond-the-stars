import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/features/home/data/repos/launch_pad_repo.dart';
import 'package:beyond_the_stars/features/home/data/repos/rocket_repo.dart';
import 'package:beyond_the_stars/features/home/logic/launch_pad_bloc/launch_pad_bloc.dart';
import 'package:beyond_the_stars/features/home/logic/rockets_bloc/rockets_bloc.dart';
import 'package:beyond_the_stars/features/login/data/repo/login_repo.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:beyond_the_stars/features/register/data/repos/register_repo.dart';
import 'package:beyond_the_stars/features/register/logic/add_user_to_firestore_bloc.dart/add_user_to_fire_store_bloc.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:beyond_the_stars/features/ships/data/repos/ships_repo.dart';
import 'package:beyond_the_stars/features/ships/logic/ships_bloc/ships_bloc.dart';
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

  // networking
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  // rockets
  getIt.registerLazySingleton<RocketRepo>(
      () => RocketRepo(dioHelper: getIt.get<DioHelper>()));
  getIt
      .registerFactory<RocketsBloc>(() => RocketsBloc(getIt.get<RocketRepo>()));

  // launch pads
  getIt.registerLazySingleton<LaunchPadRepo>(
      () => LaunchPadRepo(dioHelper: getIt.get<DioHelper>()));
  getIt.registerFactory<LaunchPadBloc>(
      () => LaunchPadBloc(getIt.get<LaunchPadRepo>()));

  // ships
  getIt.registerLazySingleton<ShipsRepo>(
    () => ShipsRepo(dioHelper: getIt.get<DioHelper>()),
  );
  getIt.registerFactory<ShipsBloc>(() => ShipsBloc(getIt.get<ShipsRepo>()));
}
