import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_rating_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_resturant_name_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_subtitle_resturant_info_widget.dart';

class MostPopularCardWidget extends StatelessWidget {
  const MostPopularCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          height: 135,
          width: 228,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                  image: AssetImage('assets/images/onBoarding-1.png'))),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomResturantNameWidget(resturantName: 'Café De Bambaa'),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            CustomSubTitleResturantInfoWidget(
                info: 'Café', category: 'Western Food'),
            const SizedBox(
              width: 15,
            ),
            CustomRatingWidget(
              showTextRating: false,
            ),
          ],
        ),
      ],
    );
  }
}
