import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:shoping_e_commerce/core/widgets/custom_searchbar_field.dart';
import 'package:shoping_e_commerce/features/home/presentation/screens/menu/widgets/menu_item.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const CustomAppBar(title: 'Menu'),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: CustomSearchBarField(),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 485,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  leftSideWidget(),
                  const Positioned(
                      left: 20,
                      top: 30,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.circle)),
                  const Positioned(
                      left: 20,
                      top: 147,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.rectangle)),
                  const Positioned(
                      left: 20,
                      top: 264,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.circle)),
                  const Positioned(
                      left: 20,
                      top: 381,
                      right: 10,
                      child: MenuBodyItem(cardShape: CardShape.rectangle)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container leftSideWidget() {
    return Container(
      height: 485,
      width: 97,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}
