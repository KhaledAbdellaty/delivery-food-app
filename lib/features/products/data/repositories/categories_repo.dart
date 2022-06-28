import 'package:shoping_e_commerce/features/products/data/data_services/products_remote_data_sources.dart';
import 'package:shoping_e_commerce/features/products/domain/entities/product_entity.dart';
import 'package:shoping_e_commerce/features/products/domain/entities/category_entity.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/products/domain/repositories/categories_repo.dart';

class CategoryRepoImpl extends CategoriesRepo {
  final ProductsRemoteDataSources productsRemoteDataSources;

  CategoryRepoImpl(this.productsRemoteDataSources);

  @override
  Future<Either<Failures, List<CategoryData>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
