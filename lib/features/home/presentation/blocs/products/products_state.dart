part of 'products_cubit.dart';

enum ProductStatus {
  loading,
  loaded,
  error,
}

class ProductsState extends Equatable {
  final ProductStatus productStatus;
  final List<CategoryData> categoryList;
  const ProductsState({this.productStatus = ProductStatus.loading, this.categoryList =const [],});

  ProductsState copyWith({ProductStatus? productStatus,List<CategoryData>? categoryList}) {
    return ProductsState(productStatus: productStatus ?? this.productStatus,categoryList: categoryList ?? this.categoryList);
  }

  @override
  List<Object> get props => [productStatus,categoryList];
}
