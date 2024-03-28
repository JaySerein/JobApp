import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/layouts/public/welcome/controllers/welcome_controller.dart';
import 'package:job_app/src/layouts/public/welcome/widgets/welcome_navigation.dart';
import 'package:job_app/src/layouts/public/welcome/widgets/welcome_next_btn.dart';
import 'package:job_app/src/layouts/public/welcome/widgets/welcome_page.dart';
import 'package:job_app/src/layouts/public/welcome/widgets/welcome_skip_btn.dart';

class WelcomeScreens extends StatelessWidget {
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WelcomeController());

    return Scaffold(
      body: Container(
        color: JColors.white,
        child: Stack(
          children: [
            //swiper
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                WelcomePage(
                  image: JImages.onBoardingImage1,
                  title: JTexts.onBoardingTitle1,
                  subTitle: JTexts.onBoardingSubTitle1,
                ),
                WelcomePage(
                  image: JImages.onBoardingImage2,
                  title: JTexts.onBoardingTitle2,
                  subTitle: JTexts.onBoardingSubTitle2,
                ),
                WelcomePage(
                  image: JImages.onBoardingImage3,
                  title: JTexts.onBoardingTitle3,
                  subTitle: JTexts.onBoardingSubTitle3,
                ),
              ],
            ),
            //skip button
            const WelcomeSkip(),
            //smooth page
            const WelcomeNavigation(),
            //next page button
            const WelcomeNextBtn()
          ],
        ),
      ),
    );
  }
}
