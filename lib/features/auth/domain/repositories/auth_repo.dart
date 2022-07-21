import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, Unit>> createNewUser(
      String email, String password, String name);
  Future<Either<Failures, UserData>> signIn(String email, String password);
}
