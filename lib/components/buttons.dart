import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_cubit.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});
  static const List<dynamic> _buttons = [
    "C",
    AssetImage("assets/icons/minus.png"),
    "%",
    "÷",
    "7",
    "8",
    "9",
    "×",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    ".",
    "0",
    Icon(Icons.backspace_outlined),
    "="
  ];
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: screenWidth>320 && screenHeight<700 ? screenHeight * 0.68 : screenHeight * 0.55,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          crossAxisSpacing: screenWidth * 0.04,
          mainAxisSpacing: screenWidth * 0.04,
          children: [
            for (final button in _buttons)
              ElevatedButton(
                onPressed:()=> context.read<Calculatorcubit>().onButtonPressed(button),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _buttonColor(context,button),
                  fixedSize: Size(screenWidth * 0.01, screenHeight * 0.01),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: _buttonContent(button,theme),
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buttonContent(dynamic button, theme) {
  if (button is String) {
    return Text(
      button,
      style:  _textColor(button,theme),
    );
  } else if (button is AssetImage) {
    
    return Image(
      image: theme.brightness == Brightness.light
          ? button
          : const AssetImage("assets/icons/minuslight.png"),
      width: 32,
      height: 32,
      fit: BoxFit.cover,
    );
  } else if (button is Icon) {
    return button;
  } else {
    return Container();
  }
}

Color _buttonColor(BuildContext context, dynamic button) {
  if (button == "C" || button is AssetImage || button == "%") {
    return Theme.of(context).colorScheme.secondary;
  } else if (button == "×" ||
      button == "-" ||
      button == "+" ||
      button == "=" ||
      button == "÷") {
    return Theme.of(context).colorScheme.primary;
  
  } else {
    return Theme.of(context).colorScheme.tertiary;
  }
}

TextStyle _textColor(dynamic button, theme) {
  if (button == "×" ||
      button == "-" ||
      button == "+" ||
      button == "=" ||
      button == "÷") {
    return const TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.w400,
    );
  } else {
    return theme.textTheme.bodySmall;
  }
}
