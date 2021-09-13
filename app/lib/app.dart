import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/navigator/bottom_navigator_cubit.dart';
import 'package:movies/navigator/bottom_navigator_widget.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigatorCubit(),
      child: MaterialApp(
        title: 'She Movies',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home: BottomNavWidget(),
      ),
    );
  }
}
