import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class JOutlinedButtonTheme {
  JOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColors.dark,
      side: const BorderSide(color: JColors.borderPrimary),
      textStyle: const TextStyle(
          fontFamily: 'Overpass',
          fontSize: 16,
          color: JColors.black,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: JSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(JSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: JColors.light,
      side: const BorderSide(color: JColors.borderPrimary),
      textStyle: const TextStyle().copyWith(
          fontFamily: 'Overpass',
          fontSize: 16,
          color: JColors.textWhite,
          fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(
          vertical: JSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(JSizes.buttonRadius)),
    ),
  );
}
