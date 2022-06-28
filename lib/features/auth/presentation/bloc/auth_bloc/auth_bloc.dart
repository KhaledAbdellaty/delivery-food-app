import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/user_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/create_user.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/get_user_data.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/sign_in_user.dart';

import '../../../../../core/error/failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CreateUserUsesCase createUserUsesCase;
  final SignInUSerUsesCase signInUSerUsesCase;
  final GetUserDataUsesCase getUserDataUsesCase;
  final UserLocalDataSourceImpl userLocalDataSourceImpl;
  AuthBloc(
      {required this.createUserUsesCase,
      required this.signInUSerUsesCase,
      required this.getUserDataUsesCase,
      required this.userLocalDataSourceImpl})
      : super(AuthInit()) {
    on<AuthEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(AuthLoading());
        final newUser =
            await createUserUsesCase(event.email, event.password, event.name);
        emit(_emitFailureOrSucces(newUser));
      } else if (event is SignInUserEvent) {
        emit(AuthLoading());
        final user = await signInUSerUsesCase(event.email, event.password);
        emit(_emitFailureOrSucces(user));
      } else if (event is GetUserDataEvent) {
        emit(AuthLoading());
        final user = await getUserDataUsesCase(event.userId);
        emit(_emitFailureOrSucces(user));
      }
    });
  }

  AuthState _emitFailureOrSucces(Either<Failures, UserData> user) {
    return user.fold(
        (failure) => ErrorCreateOrSignInUserState(
              failure.message,
            ),
        (user) => SuccessCreateOrSignInUserState());
  }
}
