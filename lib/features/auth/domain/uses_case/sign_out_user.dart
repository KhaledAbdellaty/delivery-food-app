import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_remote_data_sources.dart';

class SignOutUseCase {
  final AuthLocalDataSourceImpl authLocalDataSource;
  final AuthRemoteDataSourcesImpl authRemoteDataSource;

  SignOutUseCase(
      {required this.authLocalDataSource, required this.authRemoteDataSource});
  Future<Unit> call() async {
    await authLocalDataSource.deleteUser();
    return authRemoteDataSource.signOut();
  }
}
