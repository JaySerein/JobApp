import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/job_card/job_description.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/personal/personal_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/widgets/personal_profile_form.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalProfileController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Hồ sơ ứng tuyển',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return const Text("Đang lấy thông tin");
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(JSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const JSectionHeading(title: "Thông tin cá nhân"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Họ & Tên',
                  value: controller.profile.userID.fullname,
                ),
                JInfoItems(
                  name: 'Email',
                  value: controller.profile.userID.email,
                ),
                JInfoItems(
                  name: 'Số điện thoại',
                  value: controller.profile.userID.phone,
                ),
                JInfoItems(
                  name: 'Giới tính',
                  value: controller.profile.userID.gender,
                ),
                JInfoItems(
                  name: 'Ngày sinh',
                  value: controller.profile.userID.birthday,
                ),
                JInfoItems(
                  name: 'Địa chỉ',
                  value:
                      "${controller.profile.userID.province.name} / ${controller.profile.userID.district.name}",
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Hồ sơ ứng tuyển"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Ngành nghề',
                  value: controller.profile.category.name,
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JJobSimpleDescription(
                    title: "Ngoại ngữ",
                    description: controller.profile.language),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JJobSimpleDescription(
                    title: "Tin học",
                    description: controller.profile.informatic),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const JSectionHeading(
                  title: "Kỹ năng mềm",
                  textColor: JColors.black,
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                ListView.builder(
                  itemCount: controller.profile.skills.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => JTextGrid(
                      icon: Iconsax.tick_circle,
                      iconColor: JColors.primary,
                      onTap: () {},
                      title: controller.profile.skills[index].name),
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Nhu cầu tìm việc"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Chuyên ngành đào tạo',
                  value: controller.profile.career,
                ),
                JInfoItems(
                  name: 'Công việc',
                  value: controller.profile.job,
                ),
                JInfoItems(
                  name: 'Mức lương',
                  value: controller.profile.salary,
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JJobSimpleDescription(
                    title: "Kinh nghiệm",
                    description: controller.profile.experience),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JJobSimpleDescription(
                    title: "Sở trường",
                    description: controller.profile.strength),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JJobSimpleDescription(
                    title: "Yêu cầu khác",
                    description: controller.profile.requirement),
                const SizedBox(height: JSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const PersonalProfileUpdate()),
                      child: const Text('Cập nhập hồ sơ')),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
