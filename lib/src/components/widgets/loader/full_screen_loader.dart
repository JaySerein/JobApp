import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/widgets/loader/animation_loader.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JFullLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: JHelperFunctions.isDarkMode(Get.context!)
                  ? JColors.dark
                  : JColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  JAnimationLoader(text: text, animation: animation)
                ],
              ),
            )));
  }

  static closeLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
