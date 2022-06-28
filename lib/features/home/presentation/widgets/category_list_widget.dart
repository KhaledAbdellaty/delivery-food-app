import 'package:flutter/material.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return _buildListItem();
        },
      ),
    );
  }

  Column _buildListItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 13),
          width: 80,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: const DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Title',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primaryFontColor,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
