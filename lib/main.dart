import 'package:flutter/material.dart';
import 'package:flutter_calculator/UI/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_cubit.dart';
import 'package:flutter_calculator/bloc/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Calculatorcubit()),
        BlocProvider(create: (context) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          title: "Calculator",
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: state,
          home: const HomePage(),
        ),
      ),
    );
  }
}
