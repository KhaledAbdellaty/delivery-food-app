import 'package:flutter/services.dart';
import 'package:shoping_e_commerce/features/home/data/data_sources/remote_products_data_sources.dart';

import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/home/data/models/category_model.dart';

import '../../domain/repositories/categories_repo.dart';

class CategoryRepoImpl extends CategoriesRepo {
  CategoryRepoImpl();

  @override
  Future<Either<Failures, List<CategoryDataModel>>> getCategories() async {
    try {
      final List<CategoryDataModel> categories = [];
      final data = await ProductsRemoteDataSourcesImpl.instance.getCategories();
      for (var category in data) {
        categories.add(CategoryDataModel.fromJson(category.data()));
      }
      return Right(categories);
    } on PlatformException catch (e) {
      return left(Failures(message: e.code));
    }
  }
}
