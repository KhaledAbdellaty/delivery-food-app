import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:shoping_e_commerce/features/home/presentation/blocs/products/products_cubit.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categoryList.length,
            itemBuilder: (context, index) {
              return _buildListItem(categoryData: state.categoryList[index]);
            },
          );
        },
      ),
    );
  }

  Column _buildListItem({required CategoryData categoryData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 13),
          width: 80,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                categoryData.image,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          categoryData.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: primaryFontColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
