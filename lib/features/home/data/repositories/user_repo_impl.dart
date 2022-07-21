import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/auth_local_data_sources.dart';
import 'package:shoping_e_commerce/features/home/data/data_sources/remote_user_data_sources.dart';
import 'package:shoping_e_commerce/features/home/domain/repositories/user_repo.dart';

import '../../../auth/data/model/user_model.dart';

class UserRepoImpl extends UserRepo {
  final UserLocalDataSourceImpl userLocalData;

  UserRepoImpl({required this.userLocalData});
  @override
  Future<Either<Failures, UserDataModel>> getUserData() async {
    try {
      final userId = userLocalData.getCasheUserId();
      final data = await UserRemoteDataSourcesImpl.instance.getUserData(userId);
      final UserDataModel user =
          UserDataModel.fromJson(data.data() as Map<String, dynamic>);
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(EmptyCacheFailure(messageError: e.code));
    }
  }

  @override
  Future<Either<Failures, Unit>> updateUserImage(
      {required String imageUrl}) async {
    try {
      final userId = userLocalData.getCasheUserId();
      final data = await UserRemoteDataSourcesImpl.instance
          .updateUserImage(imageUrl: imageUrl, userId: userId);
      return Right(unit);
    } on FirebaseException catch (e) {
      return Left(EmptyCacheFailure(messageError: e.code));
    }
  }
}
