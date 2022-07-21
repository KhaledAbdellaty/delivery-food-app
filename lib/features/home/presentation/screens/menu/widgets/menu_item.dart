import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

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
            child: itemButton(),
          )
        ],
      ),
    );
  }

  Container itemInfo() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
              color: placeholderColor,
              spreadRadius: 0.1,
              offset: Offset(1, 3),
              blurRadius: 5),
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
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: placeholderColor,
                  spreadRadius: 0.1,
                  offset: Offset(5, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5),
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
        margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: placeholderColor,
                  spreadRadius: 0.1,
                  offset: Offset(5, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    } else if (cardShape == CardShape.rotated) {
      return Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: placeholderColor,
                  spreadRadius: 0.1,
                  offset: Offset(5, 0.1),
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage('assets/images/1.png'), fit: BoxFit.fill)),
      );
    }
    return const Text('some thing went wrong ');
  }

  Container itemButton() {
    return Container(
      width: 33,
      height: 33,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: placeholderColor,
            spreadRadius: 0.1,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: RotatedBox(
        quarterTurns: 2,
        child: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
