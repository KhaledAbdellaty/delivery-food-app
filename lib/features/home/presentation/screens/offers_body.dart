import 'package:flutter/material.dart';

class OffersBody extends StatelessWidget {
  const OffersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: Center(
        child: Text('Offers Screen'),
      ),
    );
  }
}
