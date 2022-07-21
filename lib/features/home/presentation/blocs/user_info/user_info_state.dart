part of 'user_info_cubit.dart';

enum UserStatus {
  userLoading,
  userLoaded,
  userError,
}

enum FavoriteStatus {
  addedToFavoritesSuccess,
  addedToFavoritesError,
  removedFromFavoritesSuccess,
  removedFromFavoritesError,
}

enum CartStatus {
  addedToCartSuccess,
  addedToCartError,
  removedFromCartSuccess,
  removedFromCartError,
}

class UserInfoState extends Equatable {
  final UserStatus userstatus;
  final UserData userData;
  final CartStatus? cartStatus;
  final FavoriteStatus? favoriteStatus;
    const UserInfoState({
    this.userstatus = UserStatus.userLoading,
    this.userData =  const UserData(
      id: '',
      name: '',
      email: '',
      password: '',
      phone: '',
      city: '',
      cartProducts: [],
      favorites: [],
      street: '',
      governorate: '',
      imageUrl: '',
      memberSince: '',
      postalCode: '',
    ),
    this.cartStatus,
    this.favoriteStatus,
  });

  @override
  List<Object> get props => [
        userstatus,
      ];

  UserInfoState copyWith({
    UserStatus? userstatus,
    UserData? userData,
    CartStatus? cartStatus,
    FavoriteStatus? favoriteStatus,
  }) {
    return UserInfoState(
        userData: userData ?? this.userData,
        userstatus: userstatus ?? this.userstatus,
        cartStatus: cartStatus ?? this.cartStatus,
        favoriteStatus: favoriteStatus ?? this.favoriteStatus);
  }
}
