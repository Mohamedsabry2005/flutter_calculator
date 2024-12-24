import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Calculatorcubit extends Cubit<Map<String, String>> {
  Calculatorcubit() : super({"current": "", "previous": ""});

  void onButtonPressed(dynamic button) {
    if (button == "C") {
      emit({"current": "", "previous": ""});
    } else if (button == "=") {
      _calculate(state["current"]);
    } else if (button is Icon) {
      if (state["current"]!.isNotEmpty) {
        emit({
          "current":
              state["current"]!.substring(0, state["current"]!.length - 1),
          "previous": state["previous"] ?? ""
        });
      }
    } else if (button is AssetImage) {
      if (state["current"]!.startsWith("-")) {
        emit({
          "current": state["current"]!.substring(1),
          "previous": state["previous"] ?? ""
        });
      } else {
        emit({
          "current": "-${state["current"]}",
          "previous": state["previous"] ?? ""
        });
      }
    } else {
      emit({
        "current": state["current"]! + button,
        "previous": state["previous"] ?? ""
      });
    }
  }

  void _calculate(equation) {
    try {
      final expression = equation
          .replaceAll("×", "*")
          .replaceAll("÷", "/")
          .replaceAll("%", "/100");
      emit({"current": eval(expression).toString(), "previous": equation});
    } catch (e) {
      emit({"current": 'Error', "previous": equation});
    }
  }
}
