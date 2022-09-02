import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/home/data/repositories/resturant_repo.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/resturant_entity.dart';

class GetAllResturantsUseCase {
  final ResturantRepoImpl resturantRepoImpl;

  GetAllResturantsUseCase({required this.resturantRepoImpl});

  Future<Either<Failures, List<ResturantData>>> call() async {
    return await resturantRepoImpl.getAllResturant();
  }
}
