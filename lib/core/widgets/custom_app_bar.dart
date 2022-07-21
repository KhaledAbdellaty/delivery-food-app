import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool back;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.back = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 15,
      ),
      child: Row(
        children: [
          back ? const Icon(Icons.arrow_back) : Container(),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: const TextStyle(
                color: primaryFontColor,
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset('assets/icons/shopping-cart.png'),
          ),
        ],
      ),
    );
  }
}
