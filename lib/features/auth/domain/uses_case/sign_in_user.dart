import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/auth/data/repositories/auth_repo_imp.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

class SignInUseCase {
  final AuthRepoImp authRepo;
  SignInUseCase({required this.authRepo});

  Future<Either<Failures, UserData>> call(String email, String password) async {
    return await authRepo.signIn(email, password);
  }
}
