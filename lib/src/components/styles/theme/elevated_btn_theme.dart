import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';

class JElevatedButtonTheme {
  JElevatedButtonTheme._();

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColors.light,
      backgroundColor: JColors.primary,
      disabledForegroundColor: JColors.darkGrey,
      disabledBackgroundColor: JColors.buttonDisabled,
      side: const BorderSide(color: JColors.primary),
      padding: const EdgeInsets.symmetric(vertical: JSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: JColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(JSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColors.light,
      backgroundColor: JColors.primary,
      disabledForegroundColor: JColors.darkGrey,
      disabledBackgroundColor: JColors.darkerGrey,
      side: const BorderSide(color: JColors.primary),
      padding: const EdgeInsets.symmetric(vertical: JSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: JColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(JSizes.buttonRadius)),
    ),
  );
}
