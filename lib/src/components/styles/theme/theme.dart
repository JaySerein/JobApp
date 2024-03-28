import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/theme/appbar_theme.dart';
import 'package:job_app/src/components/styles/theme/bottom_sheet_theme.dart';
import 'package:job_app/src/components/styles/theme/check_box_theme.dart';
import 'package:job_app/src/components/styles/theme/chip_theme.dart';
import 'package:job_app/src/components/styles/theme/elevated_btn_theme.dart';
import 'package:job_app/src/components/styles/theme/outline_btn_theme.dart';
import 'package:job_app/src/components/styles/theme/text_field_theme.dart';
import 'package:job_app/src/components/styles/theme/text_theme.dart';

class JAppTheme {
  JAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aleo',
    disabledColor: JColors.grey,
    brightness: Brightness.light,
    primaryColor: JColors.primary,
    textTheme: JTextTheme.lightTextTheme,
    chipTheme: JChipTheme.lightChipTheme,
    scaffoldBackgroundColor: JColors.white,
    appBarTheme: JAppBarTheme.lightAppBarTheme,
    checkboxTheme: JCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: JBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Aleo',
    disabledColor: JColors.grey,
    brightness: Brightness.dark,
    primaryColor: JColors.primary,
    textTheme: JTextTheme.darkTextTheme,
    chipTheme: JChipTheme.darkChipTheme,
    scaffoldBackgroundColor: JColors.black,
    appBarTheme: JAppBarTheme.darkAppBarTheme,
    checkboxTheme: JCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: JBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.darkInputDecorationTheme,
  );
}
