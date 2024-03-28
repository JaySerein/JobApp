import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/layouts/private/company/home/home_company.dart';
import 'package:job_app/src/layouts/private/company/job/job.dart';
import 'package:job_app/src/layouts/private/company/staff_find/staff_find.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class NavigationMenuCompany extends StatelessWidget {
  const NavigationMenuCompany({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationCompanyController());
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
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: "Trang chủ"),
              NavigationDestination(
                  icon: Icon(Iconsax.search_normal), label: "Tìm nhân viên"),
              NavigationDestination(
                  icon: Icon(Iconsax.briefcase), label: "Công việc"),
              NavigationDestination(
                  icon: Icon(Iconsax.messages), label: "Tin nhắn"),
              NavigationDestination(
                  icon: Icon(Iconsax.personalcard), label: "Hồ Sơ"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationCompanyController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const CompanyHomeScreen(),
    const StaffFind(),
    const CompanyJob(),
    Container(),
    Container(),
  ];
}
