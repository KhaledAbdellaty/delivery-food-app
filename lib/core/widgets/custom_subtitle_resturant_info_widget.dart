import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

class CustomSubTitleResturantInfoWidget extends StatelessWidget {
  final String info, category;
  const CustomSubTitleResturantInfoWidget(
      {Key? key, required this.info, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          info,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: placeholderColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        const Text(
          '.',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 0,
            color: mainColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          category,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: placeholderColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}