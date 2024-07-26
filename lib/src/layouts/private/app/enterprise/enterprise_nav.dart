import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/enterprise/interview/enterprise_interview.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/enterprise_job.dart';
import 'package:job_app/src/layouts/private/app/enterprise/profile_suggest/profile_suggest.dart';
import 'package:job_app/src/layouts/private/app/enterprise/setting/enterprise.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class EnterpriseNav extends StatelessWidget {
  const EnterpriseNav({super.key, this.page = 0});

  final int page;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnterpriseNavController());
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
                  icon: Icon(Iconsax.search_normal), label: "Tìm hồ sơ"),
              NavigationDestination(
                  icon: Icon(Iconsax.sms_tracking), label: "Tuyển dụng"),
              NavigationDestination(
                  icon: Icon(Iconsax.briefcase), label: "Phỏng vấn"),
              NavigationDestination(
                  icon: Icon(Iconsax.personalcard), label: "Cá nhân"),
            ]),
      ),
      body: Obx(() {
        return controller.screens[controller.selectedIndex.value];
      }),
    );
  }
}

class EnterpriseNavController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const EnterpirseHomeScreen(),
    const EnterpriseSuggestScreen(),
    const EnterpriseJobScreen(),
    const EnterpriseInterviewScreen(),
    const EnterpriseSettingScreen(),
  ];
}
