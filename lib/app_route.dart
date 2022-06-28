import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/features/auth/data/data_resources/user_local_data_sources.dart';
import 'package:shoping_e_commerce/features/auth/domain/uses_case/get_user_data.dart';
import 'package:shoping_e_commerce/features/home/presentation/screens/home_screen.dart';
import 'core/constants/strings/routes.dart';
import 'features/auth/domain/uses_case/create_user.dart';
import 'features/auth/domain/uses_case/sign_in_user.dart';
import 'features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentation/screens/login_screen/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen/signup_screen.dart';
import 'features/auth/presentation/screens/welcome_screen/welcome_screen.dart';
import 'core/injection_container.dart' as inj;

class AppRoute {
  late CreateUserUsesCase createUserUsesCase;
  late SignInUSerUsesCase signInUSerUsesCase;
  late GetUserDataUsesCase getUserDataUsesCase;
  late UserLocalDataSourceImpl userLocalDataSourceImpl;

  AppRoute() {
    userLocalDataSourceImpl =
        UserLocalDataSourceImpl(sharedPreferences: inj.inj());
    createUserUsesCase = CreateUserUsesCase(authRepo: inj.inj());
    signInUSerUsesCase = SignInUSerUsesCase(authRepo: inj.inj());
    getUserDataUsesCase = GetUserDataUsesCase(authRepo: inj.inj());
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case splashScreen:
      //   return MaterialPageRoute(builder: (context) => const SplashScreen());
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthBloc(
                      createUserUsesCase: inj.inj(),
                      signInUSerUsesCase: inj.inj(),
                      getUserDataUsesCase: inj.inj(),
                      userLocalDataSourceImpl: inj.inj()),
                  child: const SignUpScreen(),
                ));
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(
                createUserUsesCase: inj.inj(),
                signInUSerUsesCase: inj.inj(),
                getUserDataUsesCase: inj.inj(),
                userLocalDataSourceImpl: inj.inj()),
            child: const LoginScreen(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: ((context) => HomeScreen()),
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
