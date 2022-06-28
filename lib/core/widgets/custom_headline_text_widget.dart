import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

class CustomHeadLineText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomHeadLineText({Key? key, required this.title,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: primaryFontColor,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: const Text(
            'View all',
            style: TextStyle(
                color: mainColor, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
