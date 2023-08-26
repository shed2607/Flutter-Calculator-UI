// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator_ui/data/items.dart';
import 'package:calculator_ui/services/theme_changing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalcBtn extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final Function()? onTap;

  const CalcBtn({
    super.key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconCalcBtn extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final IconData button;
  final Function()? onTap;

  const IconCalcBtn({
    super.key,
    this.color,
    this.textColor,
    required this.button,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Icon(
                button,
                size: 30,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DarkOrLightBtn extends StatefulWidget {
  const DarkOrLightBtn({super.key});

  @override
  State<DarkOrLightBtn> createState() => _DarkOrLightBtnState();
}

class _DarkOrLightBtnState extends State<DarkOrLightBtn> {
  bool isDarkOrLight = false;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode);
      }
      return const Icon(Icons.light_mode);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.white38,
      value: context.watch<ThemeNotifier>().isDark,
      thumbIcon: thumbIcon,
      onChanged: (bool value) {
        context.read<ThemeNotifier>().toggleTheme(); // Toggle the theme
      },
    );
  }
}
