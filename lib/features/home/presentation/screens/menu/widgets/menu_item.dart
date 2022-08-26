import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/core/constants/strings/routes.dart';
import 'package:shoping_e_commerce/core/widgets/custom_buttons.dart';

import '../../../blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';

enum CardShape {
  rectangle,
  circle,
  rotated,
}

class MenuBodyItem extends StatelessWidget {
  final CardShape cardShape;
  const MenuBodyItem({Key? key, required this.cardShape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 87,
      width: 333,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            right: 30,
            child: itemInfo(),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: itemImage(cardShape),
          ),
          Positioned(
            right: 12,
            top: 0,
            bottom: 0,
            child: CustomRoundedIconButton(
                icon: const RotatedBox(
                  quarterTurns: 2,
                  child: const Icon(
                    Icons.arrow_back,
                    color: mainColor,
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, detailsItemScreen,
                    arguments:
                        BlocProvider.of<BottomBarNavigatorCubit>(context))),
          )
        ],
      ),
    );
  }

  Container itemInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(2, 3),
              blurRadius: 7),
        ],
      ),
      child: SizedBox(
        width: 280,
        height: 87,
        child: Row(
          children: [
            SizedBox(
              width: 90,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Food'),
                const SizedBox(
                  height: 10,
                ),
                Text('120 items'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemImage(CardShape cardShape) {
    if (cardShape == CardShape.circle) {
      return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0.5,
                  offset: Offset(2.5, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5),
              BoxShadow(
                  color: mainColor,
                  spreadRadius: 5,
                  offset: Offset(-30, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 15),
            ],
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    } else if (cardShape == CardShape.rectangle) {
      return Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 0.5,
                  offset: Offset(2.5, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5),
              BoxShadow(
                  color: mainColor,
                  spreadRadius: 5,
                  offset: Offset(-30, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 15),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    } else if (cardShape == CardShape.rotated) {
      return Transform.rotate(
        angle: 2.2,
        child: Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    spreadRadius: 0.5,
                    offset: Offset(-2, -1),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 5),
              ],
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
        ),
      );
    }
    return const Text('some thing went wrong ');
  }
}
