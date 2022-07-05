import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_headline_text_widget.dart';

import 'most_popular_card_widget.dart';

class MostPopularResturantsWidget extends StatelessWidget {
  const MostPopularResturantsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: CustomHeadLineText(title: 'Most Popular', onPressed: () {}),
        ),
        const SizedBox(
          height: 30,
        ),
        _mostPopularListViewWidget()
      ],
    );
  }

  Widget _mostPopularListViewWidget() {
    return SizedBox(
      height: 202,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return MostPopularCardWidget();
          },
        ),
      ),
    );
  }
}
