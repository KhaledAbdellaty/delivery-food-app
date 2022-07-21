import 'package:dartz/dartz.dart';
import 'package:shoping_e_commerce/core/error/failure.dart';
import 'package:shoping_e_commerce/features/pick_photo/data/repositories/pick_photo_repo_imp.dart';

class UploadImageToFireStorgeUseCase {
  final PickPhotoRepoImpl pickPhotoRepoImpl;

  UploadImageToFireStorgeUseCase({required this.pickPhotoRepoImpl});
  Future<Either<Failures, String>> call(
      { required String imageName}) async {
    return await pickPhotoRepoImpl.uploadImageToFireStore(
         imageName: imageName);
  }
}
