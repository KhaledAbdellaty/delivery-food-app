import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shoping_e_commerce/core/injection_container.dart';
import 'package:shoping_e_commerce/core/widgets/custom_headline_text_widget.dart';
import 'package:shoping_e_commerce/core/widgets/custom_loading_widget.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/resturant_entity.dart';
import 'package:shoping_e_commerce/features/home/presentation/widgets/popular_item_container_widget.dart';

import '../../../../core/constants/strings/routes.dart';
import '../blocs/products/products_cubit.dart';

class PopularResturantsWidget extends StatelessWidget {
   PopularResturantsWidget({Key? key}) : super(key: key);
   List<ResturantData> resturants = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomHeadLineText(
            title: 'Popular Resturants',
            onPressed: () => Navigator.pushNamed(context, allPopularResturantsScreen, arguments: resturants),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // const PopularItemContainerWidget(
        //   resturantName: 'Minute by tuk tuk',
        //   imageUrl: 'assets/images/onBoarding-1.png',
        // ),
        // const PopularItemContainerWidget(
        //   resturantName: 'Minute by tuk tuk',
        //   imageUrl: 'assets/images/onBoarding-1.png',
        // ),
        // const PopularItemContainerWidget(
        //   resturantName: 'Minute by tuk tuk',
        //   imageUrl: 'assets/images/onBoarding-1.png',
        // ),
        SizedBox(
            height: 858,
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                
                if (state.resturantStatus == ResturantStatus.loading) {
                  return const LoadingWidget();
                } else if (state.resturantStatus == ResturantStatus.loaded) {
                  resturants = state.resturantData;
                  // return ListView.builder(
                  //     shrinkWrap: true,
                  //     padding: EdgeInsets.all(0),
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: 3,
                  //     itemBuilder: (context, index) {
                  //       return PopularItemContainerWidget(
                  //         resturantName: state.resturantData[index].businessname
                  //             .capitalizeFirst!, // capitalizeFirst() from get package
                  //         imageUrl: state.resturantData[index].image,
                  //         slug: state.resturantData[index].slug,
                  //         resturantType: state.resturantData[index]
                  //             .restaurantType.capitalizeFirst!,
                  //       );
                  //     });

                  return AnimationLimiter(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(0),
                        itemCount: 3,
                        itemBuilder: (context, index) =>
                            AnimationConfiguration.staggeredList(
                                position: index,
                                delay: const Duration(milliseconds: 100),
                                child: SlideAnimation(
                                  duration: const Duration(microseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  verticalOffset: -250,
                                  child: ScaleAnimation(
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: PopularItemContainerWidget(
                                      resturantName:resturants[index]
                                          .businessname
                                          .capitalizeFirst!, // capitalizeFirst() from get package
                                      imageUrl:
                                          resturants[index].image,
                                      slug:resturants[index].slug,
                                      resturantType: resturants[index]
                                          .restaurantType.capitalizeFirst!,
                                    ),
                                  ),
                                ))),
                  );
                } else {
                  return Text('You are out loading and loaded state');
                }
              },
            )),
      ],
    );
  }
}
