import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/user_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/repositories/auth_repo_imp.dart';
import 'package:shoping_e_commerce/features/auth/domain/repositories/auth_repo.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/create_user.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/get_user_data.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/sign_in_user.dart';

import '../features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'network_checker_info/network_checker_info.dart';

final inj = GetIt.instance;

Future<void> init() async {
  /// Bloc
  // Auth Bloc
  inj.registerFactory(
    () => AuthBloc(
      createUserUsesCase: inj(),
      signInUSerUsesCase: inj(),
      getUserDataUsesCase: inj(),
      userLocalDataSourceImpl: inj(),
    ),
  );


///UsesCases
//user Uses Case
  inj.registerLazySingleton(() => CreateUserUsesCase(authRepo: inj()));
  inj.registerLazySingleton(() => SignInUSerUsesCase(authRepo: inj()));
  inj.registerLazySingleton(() => GetUserDataUsesCase(authRepo: inj()));


  // Repositories
  inj.registerFactory(() => AuthRepoImp(userLocalDataSourceImpl: inj()));
  inj.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(userLocalDataSourceImpl: inj()));

  // DataSources
  inj.registerFactory(() => UserLocalDataSourceImpl(sharedPreferences: inj()));
  inj.registerLazySingleton<UserLocalDataSource>(
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
