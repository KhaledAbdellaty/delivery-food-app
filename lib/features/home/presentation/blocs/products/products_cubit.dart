import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:shoping_e_commerce/features/home/domain/uses_cases/get_all_categories.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  ProductsCubit(this.getAllCategoriesUseCase) : super(ProductsState());

  getAllCategories() async {
    final ga = await getAllCategoriesUseCase();
    ga.fold(
        (failure) => emit(state.copyWith(productStatus: ProductStatus.error)),
        (r) {
      emit(state.copyWith(categoryList: r));
      emit(state.copyWith(productStatus: ProductStatus.loaded));
    });
  }
}
