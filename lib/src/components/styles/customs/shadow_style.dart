import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';

class JShadowStyle {
  static final verticalCard = BoxShadow(
      color: JColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalCard = BoxShadow(
      color: JColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
