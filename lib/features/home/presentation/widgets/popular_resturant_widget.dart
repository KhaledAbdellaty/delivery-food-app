import 'package:flutter/cupertino.dart';
import 'package:shoping_e_commerce/core/widgets/custom_headline_text_widget.dart';
import 'package:shoping_e_commerce/features/home/presentation/widgets/popular_item_container_widget.dart';

class PopularResturantsWidget extends StatelessWidget {
  const PopularResturantsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomHeadLineText(
            title: 'Popular Resturants',
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const PopularItemContainerWidget(
          resturantName: 'Minute by tuk tuk',
          imageUrl: 'assets/images/onBoarding-1.png',
        ),
        const PopularItemContainerWidget(
          resturantName: 'Minute by tuk tuk',
          imageUrl: 'assets/images/onBoarding-1.png',
        ),
        const PopularItemContainerWidget(
          resturantName: 'Minute by tuk tuk',
          imageUrl: 'assets/images/onBoarding-1.png',
        ),
      ],
    );
  }
}
