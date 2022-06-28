import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/widgets/custom_searchbar_field.dart';
import 'package:shoping_e_commerce/features/home/presentation/widgets/popular_resturant_widget.dart';

import 'category_list_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
            child: CustomSearchBarField(),
          ),
          SizedBox(
            height: 10,
          ),
          CategoryListWidget(),
          SizedBox(
            height: 40,
          ),
          PopularResturantsWidget(),
        ],
      ),
    );
  }
}
