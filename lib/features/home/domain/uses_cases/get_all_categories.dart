import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/home/data/repositories/categories_repo.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/category_entity.dart';

class GetAllCategoriesUseCase {
  final CategoryRepoImpl categoryRepoImpl;

  GetAllCategoriesUseCase({required this.categoryRepoImpl});
  Future<Either<Failures, List<CategoryData>>> call() async {
    return await categoryRepoImpl.getCategories();
  }
}
