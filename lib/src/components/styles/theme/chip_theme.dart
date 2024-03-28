import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';

class JChipTheme {
  JChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: JColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: JColors.black),
    selectedColor: JColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: JColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: JColors.darkerGrey,
    labelStyle: TextStyle(color: JColors.white),
    selectedColor: JColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: JColors.white,
  );
}
