import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/home/data/models/category_model.dart';

import '../../../../core/error/failure.dart';

abstract class CategoriesRepo{
    Future<Either<Failures, List<CategoryDataModel>>> getCategories();
}