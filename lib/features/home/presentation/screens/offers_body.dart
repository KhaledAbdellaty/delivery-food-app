import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/core/constants/theme.dart';
import 'package:shoping_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:shoping_e_commerce/core/widgets/custom_buttons.dart';
import 'package:shoping_e_commerce/core/widgets/custom_rating_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_resturant_name_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_subtitle_resturant_info_widget.dart';

import 'menu/widgets/custom_shape.dart';

class OffersBody extends StatelessWidget {
  const OffersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: 'Latest Offers'),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find discounts, Offers special meals and more!',
                  style: TextStyle(color: secondaryFontColor),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                    width: 127,
                    height: 25,
                    child: FilledButton(
                      onPressed: () {},
                      text: 'Check Offers',
                      textSize: 12,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          buildOfferslistView()
        ],
      ),
    );
  }

  Expanded buildOfferslistView() {
    return Expanded(
        child: ListView.builder(
            itemCount: 5,
            padding:const EdgeInsets.only(top: 0, bottom: 70),
            itemBuilder: (context, index) {
              return buildlistViewItemWidget(context);
            }));
  }

  Container buildlistViewItemWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 26),
      height: 243,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/2.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 7, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomResturantNameWidget(resturantName: 'Café de Noires'),
                  Row(
                    children: [
                      CustomRatingWidget(showTextRating: true),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomSubTitleResturantInfoWidget(
                        info: 'Café ',
                        category: 'Western Food',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
