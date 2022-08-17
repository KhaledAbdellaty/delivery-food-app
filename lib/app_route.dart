import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/features/home/presentation/blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';
import 'package:shoping_e_commerce/features/home/presentation/blocs/user_info/user_info_cubit.dart';
import 'package:shoping_e_commerce/features/home/presentation/screens/details_item_screen.dart';
import 'package:shoping_e_commerce/features/home/presentation/screens/home_screen.dart';
import 'core/constants/strings/routes.dart';
import 'core/injection_container.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen/signup_screen.dart';
import 'features/auth/presentation/screens/welcome_screen/welcome_screen.dart';
import 'features/splash_screen/peresntation/splash_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<AuthBloc>(
                  create: (context) => inj<AuthBloc>(),
                  child: const SignUpScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<AuthBloc>(
            create: (context) => inj<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => MultiBlocProvider(providers: [
                BlocProvider(create: (_) => BottomBarNavigatorCubit()),
                BlocProvider<UserInfoCubit>(
                    create: (_) => inj<UserInfoCubit>()..getUserData())
              ], child: HomeScreen())),
        );
      case detailsItemScreen:
        return MaterialPageRoute(
          builder: ((context) => MultiBlocProvider(providers: [
                BlocProvider.value(
                    value: settings.arguments as BottomBarNavigatorCubit),
              ], child: DetailsItemScreen())),
        );

      // case usersScreen:
      //   final user = settings.arguments as Users;
      //   return MaterialPageRoute(
      //       builder: (context) => BlocProvider(
      //             create: (context) => AuthBloc(authRepoImpl: authRepo),
      //             child: UserScreen(user: user),
      //           ));

      // case onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: ((context) => OnBoardingScreen()),
      //   );

      // case homeScreen:
      //   return MaterialPageRoute(
      //     builder: ((context) => HomeScreen()),
      //   );

    }
  }
}
