import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/user.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/account.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/personal_profile.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/widgets/personal_menu_title.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/widgets/personal_title.dart';
import 'package:job_app/src/layouts/public/sign_in/sign_in.dart';

class PersonalSettingScreen extends StatelessWidget {
  const PersonalSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.put(JUser());
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
                GestureDetector(
                  onTap: () => Get.to(() => PersonalAccount()),
                  child: JProfileTitle(
                    userName: user.currentUser.fullname,
                    email: user.currentUser.email,
                    imageUrl: user.currentUser.userImage,
                  ),
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
                      icon: Iconsax.note_2,
                      title: 'Hồ sơ ứng tuyển',
                      subtitle: 'Thông tin ứng tuyển công việc',
                      onTap: () => Get.to(() => const PersonalProfile())),
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
                  const SizedBox(height: JSizes.spaceBtwSections),
                  TextButton(
                      onPressed: () {
                        GetStorage().write("isSignin", false);
                        Get.off(() => const SignInScreen());
                      },
                      child: Text("Đăng xuất",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.red)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
