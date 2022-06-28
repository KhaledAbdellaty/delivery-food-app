import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';


class FilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const FilledButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.screenWidth! - 34,
        height: 56,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Metropolis-Medium'),
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const BorderButton({Key? key, required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.screenWidth! - 34,
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: mainColor, fontSize: 16, fontFamily: 'Metropolis-Medium'),
        )),
      ),
    );
  }
}

class CusttomIconButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback? onPressed;
  final Color color;
  const CusttomIconButton({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: SizeConfig.screenWidth! - 34,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Metropolis-Medium'),
              ),
            ],
          )),
    );
  }
}
