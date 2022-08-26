import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/core/constants/strings/routes.dart';
import 'package:shoping_e_commerce/core/widgets/custom_buttons.dart';

import '../../widgets/bottom_appbar_widget.dart';

class DetailsItemScreen extends StatefulWidget {
  const DetailsItemScreen({Key? key}) : super(key: key);

  @override
  State<DetailsItemScreen> createState() => _DetailsItemScreenState();
}

class _DetailsItemScreenState extends State<DetailsItemScreen> {
  double count = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppbar(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: placeholderColor,
        onPressed: () => Navigator.pushReplacementNamed(context, homeScreen),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const TabBarMaterialWidget(),
    );
  }

  SliverAppBar _buildSliverAppbar(BuildContext context) {
    return SliverAppBar(
      actions: [
        appBarActionButton(),
      ],
      expandedHeight: MediaQuery.of(context).size.height,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          imageitemWidget(context),
          shadowImageItemWidget(context),
          detailsItemWidget(context),
          favoriteButtonWidget(context),
        ],
      )),
    );
  }

  InkWell appBarActionButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Image.asset('assets/icons/shopping-white_cart.png'),
    );
  }

  SizedBox imageitemWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/images/2.png',
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  Positioned shadowImageItemWidget(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 385,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0),
            ],
            stops: const [0, 0.6],
          ),
        ),
      ),
    );
  }

  Transform detailsItemWidget(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, MediaQuery.of(context).size.height / 2.7),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tandoori Chicken Pizza',
                    style: TextStyle(
                      color: primaryFontColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ratingBar(context),
                  priceWidgetStack(
                    context,
                    Offset(MediaQuery.of(context).size.width / 1.66,
                        MediaQuery.of(context).size.height / -25),
                  ),
                  descriptionField(),
                ],
              ),
            ),
            numbersAndTotalItems(context),
          ],
        ),
      ),
    );
  }

  Widget descriptionField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
              color: primaryFontColor,
              fontSize: 17,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada',
          style: TextStyle(
              height: 1.9,
              color: secondaryFontColor,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Expanded numbersAndTotalItems(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 0),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: counterItemWidget(),
          ),
          const SizedBox(
            height: 27,
          ),
          SizedBox(
            height: 171,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: 171,
                  width: 97,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: mainColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    width: 277,
                    height: 122,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(0, 1.5),
                            blurRadius: 5),
                        const BoxShadow(
                            color: mainColor,
                            offset: Offset(-1, 0),
                            blurRadius: 0),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Total Price',
                          style:
                              TextStyle(color: primaryFontColor, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'EGP 1500',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 21,
                              color: primaryFontColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 157,
                          height: 29,
                          child: CusttomIconButton(
                            color: mainColor,
                            padding: 10,
                            onPressed: () {},
                            text: 'Add to Cart',
                            icon: Image.asset(
                              'assets/icons/add-to-cart.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width / 1.25,
                    MediaQuery.of(context).size.width / 5.9,
                  ),
                  child: CustomRoundedIconButton(
                    width: 40,
                    height: 40,
                    onTap: () {},
                    icon:
                        Image.asset('assets/icons/shopping-maincolor-cart.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  Row counterItemWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Number of Portions',
          style: TextStyle(
              color: primaryFontColor,
              fontSize: 17,
              fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            SizedBox(
              height: 30,
              width: 52,
              child: CusttomIconButton(
                  color: mainColor,
                  onPressed: () {},
                  withText: false,
                  text: '',
                  icon: Image.asset('assets/icons/-.png')),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 52,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: mainColor,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
              ),
              child: Center(
                  child: Text(
                '2',
                style: TextStyle(color: mainColor),
              )),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 30,
              width: 52,
              child: CusttomIconButton(
                  color: mainColor,
                  onPressed: () {},
                  withText: false,
                  text: '',
                  icon: Image.asset('assets/icons/+.png')),
            )
          ],
        ),
      ],
    );
  }

  Transform priceWidgetStack(BuildContext context, Offset offset) {
    return Transform.translate(
      offset: offset,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            'EGP. 750',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 31,
                color: primaryFontColor),
          ),
          Text(
            '/ per Portion',
            style: TextStyle(
                fontSize: 12,
                color: secondaryFontColor,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Transform favoriteButtonWidget(BuildContext context) {
    return Transform.translate(
      offset: Offset(MediaQuery.of(context).size.width / 1.3,
          MediaQuery.of(context).size.height / 3.1),
      child: InkWell(
        splashColor: primaryFontColor,
        onTap: () {},
        // child: Image.asset('assets/icons/Add to favorites button.png'),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    secondaryFontColor, BlendMode.srcATop),
                child: SvgPicture.asset(
                  'assets/icons/Add to favorites button1.svg',
                ),
              ),
            ),
            Positioned(
              top: -3,
              child: SvgPicture.asset(
                'assets/icons/Add to favorites button1.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBar(
            itemPadding: const EdgeInsets.all(3),
            itemSize: 20,
            initialRating: 3,
            maxRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            ratingWidget: RatingWidget(
                empty: Image.asset('assets/icons/star-empty.png'),
                full: Image.asset('assets/icons/star-1.png'),
                half: Container()),
            onRatingUpdate: (rating) {
              count = rating;
              setState(() {});
            }),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            '${count.toStringAsFixed(0)} Star Ratings',
            style: const TextStyle(
              color: mainColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
