import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/auth_repo_imp.dart';
import '../entities/user_entity.dart';

class GetUserDataUsesCase {
  AuthRepoImp authRepo;
  GetUserDataUsesCase({required this.authRepo});

  Future<Either<Failures, UserData>> call(String userId) async {
    return await authRepo.getUserData(userId);
  }
}
