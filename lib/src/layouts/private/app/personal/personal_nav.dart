import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/layouts/private/app/personal/home/personal_home.dart';
import 'package:job_app/src/layouts/private/app/personal/invite/personal_invite.dart';
import 'package:job_app/src/layouts/private/app/personal/job/personal_job.dart';
import 'package:job_app/src/layouts/private/app/personal/interview/personal_interview.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/personal.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class PersonalNav extends StatelessWidget {
  const PersonalNav({super.key, this.page = 0});

  final int page;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalNavController());
    controller.selectedIndex.value = page;
    final dark = JHelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              indicatorColor: dark
                  ? JColors.white.withOpacity(0.1)
                  : JColors.black.withOpacity(0.1),
              backgroundColor: dark ? JColors.black : JColors.white,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) {
                Get.deleteAll();
                controller.selectedIndex.value = index;
              },
              destinations: const [
                NavigationDestination(
                    icon: Icon(Iconsax.home), label: "Trang chủ"),
                NavigationDestination(
                    icon: Icon(Iconsax.search_normal), label: "Tìm việc"),
                NavigationDestination(
                    icon: Icon(Iconsax.sms_tracking), label: "Lời mời"),
                NavigationDestination(
                    icon: Icon(Iconsax.briefcase), label: "Phỏng vấn"),
                NavigationDestination(
                    icon: Icon(Iconsax.personalcard), label: "Cá nhân"),
              ]),
        ),
        body: Obx(() {
          return controller.screens[controller.selectedIndex.value];
        }));
  }
}

class PersonalNavController extends GetxService {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const PersonalHomeScreen(),
    const PersonalJobScreen(),
    const PersonalInviteScreen(),
    const PersonalInterviewScreen(),
    const PersonalSettingScreen(),
  ];
}
