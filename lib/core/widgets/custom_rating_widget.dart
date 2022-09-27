import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingWidget extends StatelessWidget {
  final bool showTextRating;
  const CustomRatingWidget({Key? key, required this.showTextRating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: mainColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          '4.9',
          style: TextStyle(color: mainColor, fontSize: 15.sp),
        ),
        SizedBox(
          width: 16.w,
        ),
        showTextRating
            ? Text(
                '(124 Ratings)',
                style: TextStyle(
                  color: placeholderColor,
                  fontSize: 16.sp,
                ),
              )
            : Container()
      ],
    );
  }
}
