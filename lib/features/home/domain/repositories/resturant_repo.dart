import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/resturant_entity.dart';

abstract class ResturantRepo {
  Future<Either<Failures, List<ResturantData>>> getAllResturant();
}
