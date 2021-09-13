import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/favorites/favorites_view.dart';
import 'package:movies/home/home_view.dart';

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
      selectedFontSize: 0,
      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.yellow,
      currentIndex: context.read<BottomNavigatorCubit>().state,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.local_movies_rounded,
              size: 40,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
              size: 40,
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
