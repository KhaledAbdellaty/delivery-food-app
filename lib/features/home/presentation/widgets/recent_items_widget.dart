import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_headline_text_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_rating_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_resturant_name_widget.dart';

import '../../../../core/widgets/custom_subtitle_resturant_info_widget.dart';

class RecentItemsWidget extends StatelessWidget {
  const RecentItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CustomHeadLineText(title: 'Recent Items', onPressed: () {}),
          const SizedBox(
            height: 26,
          ),
          _buildRecentItemsContainerWidget(),
          const SizedBox(
            height: 15,
          ),
          _buildRecentItemsContainerWidget(),
          const SizedBox(
            height: 15,
          ),
          _buildRecentItemsContainerWidget(),
        ],
      ),
    );
  }

  Widget _buildRecentItemsContainerWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/onBoarding-1.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomResturantNameWidget(resturantName: 'Mulberry Pizza by Josh'),
            SizedBox(
              height: 3,
            ),
            CustomSubTitleResturantInfoWidget(
                info: 'Café', category: 'Western Food'),
            SizedBox(
              height: 3,
            ),
            CustomRatingWidget(showTextRating: true),
          ],
        )
      ],
    );
  }
}
