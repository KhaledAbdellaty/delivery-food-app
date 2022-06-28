import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/user_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/user_remote_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/data/model/user_model.dart';
import '../../domain/repositories/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final UserLocalDataSourceImpl userLocalDataSourceImpl;
  AuthRepoImp({required this.userLocalDataSourceImpl});

  @override
  Future<Either<Failures, UserDataModel>> createNewUser(
      String email, String password, String name) async {
    try {
      final createUser = await UserRemoteDataSourcesImp.instance
          .createUser(email, password, name);
      return Right(createUser);
    } on FirebaseAuthException catch (e) {
      return Left(RegisterFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<Failures, UserDataModel>> signIn(
      String email, String password) async {
    try {
      final signIn =
          await UserRemoteDataSourcesImp.instance.signIn(email, password);
      await userLocalDataSourceImpl.casheUserId(signIn.user!.uid);
      final UserDataModel user = UserDataModel(
        id: signIn.user!.uid,
        name: signIn.user!.displayName!,
        email: signIn.user!.email!,
        password: password,
        memberSince: signIn.user!.metadata.creationTime.toString(),
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(LoginFailure.fromCode(e.code));
    }
  }

  @override
  Future<Either<Failures, UserDataModel>> getUserData(String userId) async {
    final data = await UserRemoteDataSourcesImp.instance.getUserData(userId);
    final UserDataModel user =
        UserDataModel.fromJson(data.data() as Map<String, dynamic>);
    try {
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(LoginFailure.fromCode(e.message!));
    }
  }
}
