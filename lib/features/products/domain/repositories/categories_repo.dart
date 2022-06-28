import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/category_entity.dart';

abstract class CategoriesRepo{
    Future<Either<Failures, List<CategoryData>>> getCategories();
}