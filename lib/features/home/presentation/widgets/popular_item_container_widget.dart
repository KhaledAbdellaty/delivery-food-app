import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_resturant_name_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_subtitle_resturant_info_widget.dart';
import '../../../../core/constants/size_config.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_rating_widget.dart';

class PopularItemContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String resturantName;
  final String resturantType;
  final String slug;
  const PopularItemContainerWidget({
    Key? key,
    required this.imageUrl,
    required this.resturantName,
    required this.resturantType,
    required this.slug,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth,
          height: 200,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LoadingWidget(),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 5, right: 15, left: 15),
          height: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomResturantNameWidget(resturantName: resturantName),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const CustomRatingWidget(
                    showTextRating: true,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomSubTitleResturantInfoWidget(
                      info: resturantType, category: slug),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
