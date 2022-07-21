import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/repositories/auth_repo_imp.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/create_user.dart';
import 'package:shoping_e_commerce/features/home/data/repositories/user_repo_impl.dart';
import 'package:shoping_e_commerce/features/home/domain/uses_cases/get_user_data.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/sign_in_user.dart';
import 'package:shoping_e_commerce/features/home/domain/uses_cases/update_user_image.dart';
import 'package:shoping_e_commerce/features/home/presentation/blocs/user_info/user_info_cubit.dart';
import 'package:shoping_e_commerce/features/pick_photo/bloc/pickphoto_bloc.dart';
import 'package:shoping_e_commerce/features/pick_photo/data/repositories/pick_photo_repo_imp.dart';
import 'package:shoping_e_commerce/features/pick_photo/domain/uses_case/pick_image_from_camera.dart';
import 'package:shoping_e_commerce/features/pick_photo/domain/uses_case/upload_image_to_firestore.dart';

import '../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../features/pick_photo/domain/uses_case/pick_image_from_gallery.dart';
import 'network_checker_info/network_checker_info.dart';

final inj = GetIt.instance;

Future<void> init() async {
  /// Bloc
  // Auth Bloc
  inj.registerFactory(
    () => AuthBloc(
      createUserUsesCase: inj(),
      signInUSerUsesCase: inj(),
      userLocalDataSourceImpl: inj(),
    ),
  );
  inj.registerFactory(() =>
      UserInfoCubit(getUserDataUsesCase: inj(), updateUserImageUseCase: inj()));
  inj.registerFactory(() => PickPhotoBloc(
      cameraUseCase: inj(),
      galleryUseCase: inj(),
      uploadImageToFireStorgeUseCase: inj()));

  ///UsesCases
//user Uses Case
  inj.registerLazySingleton(() => CreateUserUsesCase(authRepo: inj()));
  inj.registerLazySingleton(() => SignInUSerUsesCase(authRepo: inj()));
  inj.registerLazySingleton(() => GetUserDataUsesCase(userRepo: inj()));
  inj.registerLazySingleton(() => PickImageFromCameraUseCase(inj()));
  inj.registerLazySingleton(() => PickImageFromGalleryUseCase(inj()));
  inj.registerLazySingleton(
      () => UploadImageToFireStorgeUseCase(pickPhotoRepoImpl: inj()));
  inj.registerLazySingleton(() => UpdateUserImageUseCase(userRepoImpl: inj()));

  // Repositories
  //inj.registerFactory(() => AuthRepoImp(userLocalDataSourceImpl: inj()));
  inj.registerLazySingleton<AuthRepoImp>(
      () => AuthRepoImp(userLocalDataSourceImpl: inj()));
  inj.registerLazySingleton<UserRepoImpl>(
      () => UserRepoImpl(userLocalData: inj()));
  inj.registerLazySingleton<PickPhotoRepoImpl>(() => PickPhotoRepoImpl());

  // DataSources
  // inj.registerFactory(() => UserLocalDataSourceImpl(sharedPreferences: inj()));
  inj.registerLazySingleton<UserLocalDataSourceImpl>(
      () => UserLocalDataSourceImpl(sharedPreferences: inj()));

  // inj.registerLazySingleton<PostRemoteDataSource>(
  //     () => PostRemoteDataSourceImp(dio: inj()));

  // Core

  inj.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(connectionChecker: inj()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  inj.registerLazySingleton(() => sharedPreferences);
  //inj.registerLazySingleton(() => Dio());
  inj.registerLazySingleton(() => InternetConnectionChecker());
}
