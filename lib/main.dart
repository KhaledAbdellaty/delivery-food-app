import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoping_e_commerce/app_route.dart';
import 'package:shoping_e_commerce/core/bloc_observer.dart';
import 'package:shoping_e_commerce/core/constants/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  BlocOverrides.runZoned(
      () => runApp(MyApp(
            appRoute: AppRoute(),
          )),
      blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({
    Key? key,
    required this.appRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(332.98, 789.17),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: appRoute.generateRoute,
      ),
    );
  }
}
