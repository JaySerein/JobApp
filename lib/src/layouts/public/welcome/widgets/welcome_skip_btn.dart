import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/layouts/public/welcome/controllers/welcome_controller.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';

class WelcomeSkip extends StatelessWidget {
  const WelcomeSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: JDevice.getAppBarHeight(),
        right: JSizes.defaultSpace,
        child: TextButton(
            onPressed: () => WelcomeController.instance.skipPage(),
            child: const Text(
              'Bỏ qua',
              style: TextStyle(
                  fontSize: JSizes.fontSizeLg, color: JColors.primary),
            )));
  }
}
