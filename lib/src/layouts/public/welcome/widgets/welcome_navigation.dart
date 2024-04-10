import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/controllers/welcome_controller.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeNavigation extends StatelessWidget {
  const WelcomeNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = WelcomeController.instance;

    return Positioned(
        bottom: JDevice.getBottomNavigationBarHeight() + 25,
        left: JSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: JColors.dark, dotHeight: 6),
        ));
  }
}
