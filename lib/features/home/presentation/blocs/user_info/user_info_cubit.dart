import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoping_e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:shoping_e_commerce/features/home/domain/uses_cases/get_user_data.dart';
import 'package:shoping_e_commerce/features/home/domain/uses_cases/update_user_image.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  GetUserDataUsesCase getUserDataUsesCase;
  UpdateUserImageUseCase updateUserImageUseCase;
  UserInfoCubit(
      {required this.getUserDataUsesCase, required this.updateUserImageUseCase})
      : super(const UserInfoState());

  Future<void> getUserData() async {
    final userData = await getUserDataUsesCase.call();
    userData.fold((l)async => emit(state.copyWith(userstatus: UserStatus.userError)),
        (r)async{
      emit(state.copyWith(userData: r));
      emit(state.copyWith(userstatus: UserStatus.userLoaded));
    });
  }

  Future<void> updateUserImage(String imageUrl) async {
    final userImage = await updateUserImageUseCase(imageUrl: imageUrl);
    userImage
        .fold((l)async=> emit(state.copyWith(userstatus: UserStatus.userError)),
            (r) async {
      await getUserData();
    });
  }
}
