import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';



class HeadLineText extends StatelessWidget {
  final String title;
  final String subTitle;
  const HeadLineText({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Metropolis-SemiBold',
              fontSize: 30,
              color: primaryFontColor,
            ),
          ),
          const SizedBox(
            height: 10.5,
          ),
          SizedBox(
            width: SizeConfig.screenWidth! - 66,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.5,
                fontFamily: 'Metropolis-Medium',
                fontSize: 14,
                color: secondaryFontColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
