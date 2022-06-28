import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/auth/data/repositories/auth_repo_imp.dart';
import 'package:shoping_e_commerce/features/auth/domain/entities/user_entity.dart';

class CreateUserUsesCase {
  CreateUserUsesCase({required this.authRepo});
  AuthRepoImp authRepo;

  Future<Either<Failures, UserData>> call(
      String email, String password, String name) async {
    return await authRepo.createNewUser(email, password, name);
  }
}
