import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/home/data/repositories/user_repo_impl.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entities/user_entity.dart';

class GetUserDataUsesCase {
  UserRepoImpl userRepo;
  GetUserDataUsesCase({required this.userRepo});

  Future<Either<Failures, UserData>> call() async {
    return await userRepo.getUserData();
  }
}
