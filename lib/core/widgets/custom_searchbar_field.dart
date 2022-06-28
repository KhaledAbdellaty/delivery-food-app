import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

class CustomSearchBarField extends StatelessWidget {
  const CustomSearchBarField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/icons/search.png'),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextFormField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Search food',
            hintStyle: TextStyle(
              color: placeholderColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        )),
      ],
    );
  }
}
