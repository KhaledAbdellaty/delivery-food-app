import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/app_route.dart';
import 'package:shoping_e_commerce/core/constants/theme.dart';
import './core/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({Key? key, required this.appRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
