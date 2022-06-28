import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final ValueSetter<String> onSaved;
  final TextInputType inputType;
  final TextEditingController controller ;
  final String hint;
  final bool secure;
   const CustomTextField(
      {Key? key,
      required this.controller,
      required this.secure,
      required this.onSaved,
      required this.inputType,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      obscureText: secure,
      cursorColor: mainColor,
      style: const TextStyle(
          fontFamily: 'Metropolis-Medium',
          fontSize: 19,
          color: primaryFontColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: secondaryFontColor,
          fontFamily: 'Metropolis-Medium',
          fontSize: 19,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: placeholderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: placeholderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: placeholderColor),
        ),
        focusColor: mainColor,
        fillColor: Colors.transparent,
      ),
    );
  }
}
