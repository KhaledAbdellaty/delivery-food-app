import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/features/home/presentation/screens/home_body.dart';

import '../../../../../core/injection_container.dart';
import '../../../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../../../../pick_photo/bloc/pickphoto_bloc.dart';
import '../../screens/profile/profile_body.dart';
import '../../screens/menu/menu_body.dart';
import '../../screens/more_settings_body.dart';
import '../../screens/offers_body.dart';

part 'bottom_bar_navigator_state.dart';

class BottomBarNavigatorCubit extends Cubit<BottomBarNabigatorState> {
  BottomBarNavigatorCubit() : super(BottomBarNabigatorState());

  void navigateToScreen(int index) {
    emit(state.copyWith(index));
  }
}
