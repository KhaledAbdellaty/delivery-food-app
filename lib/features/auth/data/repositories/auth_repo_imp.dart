import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_remote_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/model/user_model.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final AuthLocalDataSourceImpl userLocalDataSourceImpl;
  AuthRepoImp({required this.userLocalDataSourceImpl});

  @override
  Future<Either<Failures, Unit>> createNewUser(
      String email, String password, String name) async {
    try {
      final createUser = await AuthRemoteDataSourcesImp.instance
          .createUser(email, password, name);
      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<Failures, UserDataModel>> signIn(
      String email, String password) async {
    try {
      final signIn =
          await AuthRemoteDataSourcesImp.instance.signIn(email, password);
      //await userLocalDataSourceImpl.casheUserId(signIn.user!.uid);
      final UserDataModel user = UserDataModel(
        id: signIn.user!.uid,
        name: signIn.user!.displayName!,
        email: signIn.user!.email!,
        password: password,
        memberSince: signIn.user!.metadata.creationTime.toString(),
      );
      await userLocalDataSourceImpl.casheUserId(user.id);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure.fromCode(e.code));
    }
  }
}
