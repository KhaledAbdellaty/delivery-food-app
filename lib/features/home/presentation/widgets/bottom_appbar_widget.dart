import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_e_commerce/core/constants/colors.dart';
import 'package:shoping_e_commerce/features/home/presentation/blocs/bottom_bar_navigator/bottom_bar_navigator_cubit.dart';

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
      child: BlocBuilder<BottomBarNavigatorCubit, BottomBarNabigatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabItem(
                toolTip: 'Menu',
                icon: Icon(
                  Icons.menu,
                  color: state.index == 0 ? mainColor : Colors.black,
                ),
                index: 0,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(0),
              ),
              _buildTabItem(
                toolTip: 'Offers',
                icon: Icon(Icons.local_offer,
                    color: state.index == 1 ? mainColor : Colors.black),
                index: 1,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(1),
              ),
              placeholder,
              _buildTabItem(
                toolTip: 'Profile',
                icon: Icon(Icons.person_off_outlined,
                    color: state.index == 3 ? mainColor : Colors.black),
                index: 3,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(3),
              ),
              _buildTabItem(
                toolTip: 'Settings',
                icon: Icon(
                  Icons.more,
                  color: state.index == 4 ? mainColor : Colors.black,
                ),
                index: 4,
                onPressed: () =>
                    BlocProvider.of<BottomBarNavigatorCubit>(context)
                        .navigateToScreen(4),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabItem(
      {required Icon icon,
      required int index,
      required String toolTip,
      required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: toolTip,
    );
  }
}
