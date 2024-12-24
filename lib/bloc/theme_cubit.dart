import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffF1f2f3),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff4b5efc),
      secondary: Color(0xffd2d3da),
      tertiary: Color(0xffffffff),
      
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color(0xff000000),
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff000000),
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff17171c),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff4b5efc),
      secondary: Color(0xff4e505f),
      tertiary: Color(0xff2e2f38),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: Color(0xffffffff),
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffffffff),
    ),
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
