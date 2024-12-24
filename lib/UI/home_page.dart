import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/screen.dart';
import 'package:flutter_calculator/components/toggle.dart';
import "../components/buttons.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Toggle(),
            Spacer(),
            Screen(),
            Buttons(),
          ],
        ),
      ),
    );
  }
}
