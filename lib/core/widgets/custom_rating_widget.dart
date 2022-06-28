import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: mainColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '4.9',
          style: TextStyle(color: mainColor, fontSize: 15),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          '(124 Ratings)',
          style: TextStyle(
            color: placeholderColor,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
