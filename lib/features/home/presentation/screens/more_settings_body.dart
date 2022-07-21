import 'package:flutter/material.dart';

class MoreSettingsBody extends StatelessWidget {
  const MoreSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoreSettings'),
      ),
      body: Center(
        child: Text('MoreSettings Screen'),
      ),
    );
  }
}
