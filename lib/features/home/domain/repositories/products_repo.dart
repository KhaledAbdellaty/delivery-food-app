import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';

import '../../../home/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductData>>> getPopularProducts();

  Future<Either<Failures, List<ProductData>>> productSearch(String search);

  Future<Either<Failures, List<ProductData>>> getCategoryProducts(String name);
}
