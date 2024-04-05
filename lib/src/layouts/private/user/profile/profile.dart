import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/user/profile/cv/user_cv.dart';
import 'package:job_app/src/layouts/private/user/profile/info/info.dart';
import 'package:job_app/src/layouts/private/user/profile/widgets/profile_menu_title.dart';
import 'package:job_app/src/layouts/private/user/profile/widgets/profile_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            JHeaderContainer(
                child: Column(
              children: [
                JAppBar(
                  title: Text(
                    'Tài khoản',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: JColors.white),
                  ),
                ),
                //profile card
                const JProfileTitle(
                  userName: 'NguyenQuangTuan',
                  email: 'younext08@gmail.com',
                  imageUrl: JImages.companyAvatar,
                ),
                const SizedBox(height: JSizes.spaceBtwSections),
              ],
            )),
            //body
            Padding(
              padding: const EdgeInsets.all(JSizes.defaultSpace),
              child: Column(
                children: [
                  const JSectionHeading(title: "Thông tin tài khoản"),
                  const SizedBox(height: JSizes.spaceBtwItems),
                  JProfileMenuTitle(
                      icon: Iconsax.user_tag,
                      title: 'Thông tin cá nhân',
                      subtitle: 'Thông tin tài khoản & cá nhân',
                      onTap: () => Get.to(() => const UserInfoScreen())),
                  JProfileMenuTitle(
                      icon: Iconsax.note_2,
                      title: 'Hồ sơ ứng tuyển',
                      subtitle: 'Thông tin ứng tuyển công việc',
                      onTap: () => Get.to(() => const UserCVScreen())),
                  JProfileMenuTitle(
                      icon: Iconsax.clock,
                      title: 'Lịch sự ứng tuyển',
                      subtitle: 'Danh sách công việc đã ứng tuyển',
                      onTap: () {}),
                  JProfileMenuTitle(
                      icon: Iconsax.note_remove,
                      title: 'Công việc từ chối',
                      subtitle: 'Danh sách công việc đã từ chối',
                      onTap: () {}),

                  //App setting
                  const SizedBox(height: JSizes.spaceBtwSections),
                  const JSectionHeading(title: "Cài đặt ứng dụng"),
                  const SizedBox(height: JSizes.spaceBtwItems),
                  JProfileMenuTitle(
                    icon: Iconsax.notification_bing,
                    title: 'Thông báo',
                    subtitle: 'Nhận thông báo thông tin quan trọng',
                    trailing: Switch(
                        activeColor: JColors.primary,
                        value: true,
                        onChanged: (value) {}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
