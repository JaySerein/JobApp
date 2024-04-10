import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/controllers/welcome_controller.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';

class WelcomeNextBtn extends StatelessWidget {
  const WelcomeNextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: JSizes.defaultSpace,
        bottom: JDevice.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            onPressed: () => WelcomeController.instance.nextPage(),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor: JColors.primary),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
