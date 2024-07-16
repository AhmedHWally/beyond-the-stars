import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/features/company_info/data/repos/company_info_repo.dart';
import 'package:beyond_the_stars/features/company_info/logic/company_info_bloc/company_info_bloc.dart';
import 'package:beyond_the_stars/features/crew/data/repos/crew_repo.dart';
import 'package:beyond_the_stars/features/crew/logic/crew_bloc/crew_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:beyond_the_stars/features/edit_profile/data/repos/user_image_repo.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/home/data/repos/launch_pad_repo.dart';
import 'package:beyond_the_stars/features/home/data/repos/rocket_repo.dart';
import 'package:beyond_the_stars/features/home/logic/launch_pad_bloc/launch_pad_bloc.dart';
import 'package:beyond_the_stars/features/home/logic/rockets_bloc/rockets_bloc.dart';
import 'package:beyond_the_stars/features/login/data/repo/login_repo.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:beyond_the_stars/features/profile/data/repos/profile_repo.dart';
import 'package:beyond_the_stars/features/profile/logic/logout_bloc/logout_bloc.dart';
import 'package:beyond_the_stars/features/profile/logic/profile_bloc/profile_bloc.dart';
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

  // crew

  getIt.registerLazySingleton<CrewRepo>(
    () => CrewRepo(dioHelper: getIt.get<DioHelper>()),
  );
  getIt.registerFactory<CrewBloc>(() => CrewBloc(getIt.get<CrewRepo>()));

  // companyInfo
  getIt.registerLazySingleton<CompanyInfoRepo>(
    () => CompanyInfoRepo(dio: getIt.get<DioHelper>()),
  );
  getIt.registerFactory<CompanyInfoBloc>(
      () => CompanyInfoBloc(getIt.get<CompanyInfoRepo>()));

  // profile
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(
        firebaseAuthInstance: getIt.get<FirebaseAuth>(),
        firebaseFirestoreInstance: getIt.get<FirebaseFirestore>()),
  );

  getIt.registerFactory<ProfileBloc>(
      () => ProfileBloc(getIt.get<ProfileRepo>()));
  getIt.registerFactory<LogoutBloc>(() => LogoutBloc(getIt.get<ProfileRepo>()));

  // edit_profile_image
  getIt.registerLazySingleton<UserImageRepo>(
    () => UserImageRepo(
      firebaseStorage: getIt.get<FirebaseStorage>(),
    ),
  );
  getIt.registerLazySingleton<EditProfileRepo>(
    () => EditProfileRepo(
        firebaseStorage: getIt.get<FirebaseStorage>(),
        firebaseFirestore: getIt.get<FirebaseFirestore>()),
  );
  getIt.registerFactory<UploadProfileImageBloc>(
      () => UploadProfileImageBloc(getIt.get<UserImageRepo>()));
  getIt.registerFactory<EditProfileBloc>(
      () => EditProfileBloc(getIt.get<EditProfileRepo>()));
}
