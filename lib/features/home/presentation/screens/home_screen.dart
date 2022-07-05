import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/features/auth/domain/entities/user_entity.dart';

import '../widgets/bottom_appbar_widget.dart';
import '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To set the floating action button in bottom when keyboard open
      resizeToAvoidBottomInset: false,
      /////////////////////////////////////////////////////////////////
      extendBody: true,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Good morning ...',
          style: TextStyle(color: primaryFontColor),
        ),
        actions: [
          Image.asset('assets/icons/shopping-cart.png'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        focusNode: FocusScopeNode(canRequestFocus: true),
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const HomeBody(),
      bottomNavigationBar: const TabBarMaterialWidget(),
    );
  }
}
