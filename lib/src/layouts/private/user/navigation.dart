import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/layouts/private/user/message/message.dart';
import 'package:job_app/src/layouts/private/user/profile/profile.dart';
import 'package:job_app/src/layouts/private/user/user_find_job/user_find_job.dart';
import 'package:job_app/src/layouts/private/user/user_home/user_home.dart';
import 'package:job_app/src/layouts/private/user/user_job_invite/user_job_invite.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
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
                  icon: Icon(Iconsax.search_normal), label: "Tìm việc"),
              NavigationDestination(
                  icon: Icon(Iconsax.sms_tracking), label: "Lời mời"),
              NavigationDestination(
                  icon: Icon(Iconsax.messages), label: "Tin nhắn"),
              NavigationDestination(
                  icon: Icon(Iconsax.personalcard), label: "Cá nhân"),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const JobFind(),
    const JobInvite(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];
}
