import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/features/home/data/repositories/user_repo_impl.dart';

class AddToCartUseCase {
  final UserRepoImpl userRepoImpl;

  AddToCartUseCase({required this.userRepoImpl});
  Future<Unit> call({required Map<String, dynamic> productMap}) async {
    return await userRepoImpl.addToCart(productMap: productMap);
  }
}
