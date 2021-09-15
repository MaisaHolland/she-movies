import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/views/favorites/favorites_view.dart';
import 'package:movies/views/home/home_view.dart';

import 'bottom_navigator_cubit.dart';

class BottomNavWidget extends StatefulWidget {
  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {

  final _pageNavigation = [
    HomeView(),
    FavoriteMovies(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      elevation: 10,
      iconSize: 40,
      selectedFontSize: 0,
      backgroundColor: Colors.grey.shade700,
      selectedItemColor: Colors.white,
      currentIndex: context.read<BottomNavigatorCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.local_movies_outlined,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
            ),
            label: "Favorites"),
      ],
    );
  }

  /////////// VIEW DATA //////////////

  void _getChangeBottomNav(int index) {
    context.read<BottomNavigatorCubit>().updateIndex(index);
  }
}
