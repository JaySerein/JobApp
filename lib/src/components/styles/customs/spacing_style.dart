import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';

class JSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: JSizes.appBarHeight,
    left: JSizes.defaultSpace,
    right: JSizes.defaultSpace,
    bottom: JSizes.defaultSpace,
  );
}
