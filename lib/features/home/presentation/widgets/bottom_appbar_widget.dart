import 'package:flutter/material.dart';

class TabBarMaterialWidget extends StatelessWidget {
  const TabBarMaterialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem(
            icon: Icon(Icons.menu),
            index: 0,
          ),
          _buildTabItem(
            icon: Icon(Icons.local_offer),
            index: 1,
          ),
          placeholder,
          _buildTabItem(
            icon: Icon(Icons.person_off_outlined),
            index: 2,
          ),
          _buildTabItem(
            icon: Icon(Icons.more),
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({required Icon icon, required int index}) {
    return IconButton(onPressed: () {}, icon: icon);
  }
}
