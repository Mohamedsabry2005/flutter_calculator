import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_cubit.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return BlocBuilder<Calculatorcubit, Map<String, String>>(
      builder: (context, state) => Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              state["previous"]!.isEmpty ? "" : state["previous"]!,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w300,
                color: Colors.grey[500],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              state["current"]!.isEmpty ? "0" : state["current"]!,
              style:  TextStyle(
                fontSize: screenWidth * 0.143,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
