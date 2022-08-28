
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  @override
  Future<Either<Failures, List<ProductData>>> getCategoryProducts(String name) {
    // TODO: implement getCategoryProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductData>>> getPopularProducts() {
    // TODO: implement getPopularProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<ProductData>>> productSearch(String search) {
    // TODO: implement productSearch
    throw UnimplementedError();
  }
}
