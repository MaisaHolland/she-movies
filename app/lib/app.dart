import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/views/navigator/bottom_navigator_cubit.dart';
import 'package:movies/views/navigator/bottom_navigator_widget.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigatorCubit(),
      child: MaterialApp(
        title: 'She Movies',
        theme: ThemeData(
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        home: BottomNavWidget(),
      ),
    );
  }
}
