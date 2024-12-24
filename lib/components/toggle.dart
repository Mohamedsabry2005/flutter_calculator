import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/bloc/theme_cubit.dart';

class Toggle extends StatelessWidget {
  const Toggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select((ThemeCubit cubit) => cubit.state.brightness == Brightness.dark);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: Container(
            height: 32,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.tertiary,
              
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.light_mode_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                    Icon(
                      Icons.dark_mode_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ],
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: isDarkMode ? 40 : 7,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff4e505f),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
