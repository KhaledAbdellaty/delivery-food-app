import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_resturant_name_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_subtitle_resturant_info_widget.dart';
import '../../../../core/constants/size_config.dart';
import '../../../../core/widgets/custom_rating_widget.dart';

class PopularItemContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String resturantName;
  const PopularItemContainerWidget(
      {Key? key, required this.imageUrl, required this.resturantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomResturantNameWidget(resturantName: resturantName),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  CustomRatingWidget(showTextRating: true,),
                  SizedBox(
                    width: 10,
                  ),
                  CustomSubTitleResturantInfoWidget(
                      info: 'Cafe', category: 'West food'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
