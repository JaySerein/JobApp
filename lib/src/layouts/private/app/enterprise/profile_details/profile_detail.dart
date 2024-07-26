import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/button/custom_btn.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/profile/profile_apply_description.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/job_invite_controller.dart';
import 'package:job_app/src/controllers/enterprise/single_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/profile_details/widgets/profile_header.dart';

class JProfileDetails extends StatelessWidget {
  const JProfileDetails({super.key, required this.profileID});

  final String profileID;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingleProfileController(profileID: profileID));
    final invite = Get.put(JobInviteController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Chi tiết hồ sơ',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Obx(() {
            if (controller.isloading.value == true) return Container();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JProfileDetailHeader(profile: controller.profile),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Thông tin hồ sơ"),
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
                    name: 'Giới tính', value: controller.profile.userID.gender),
                JInfoItems(
                  name: 'Ngày sinh',
                  value: controller.profile.userID.birthday,
                ),
                JInfoItems(
                  name: 'Địa chỉ',
                  value:
                      "${controller.profile.userID.province.name} / ${controller.profile.userID.district.name}",
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Thông tin ứng tuyển"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Chuyên ngành đào tạo',
                  value: controller.profile.career,
                ),
                JInfoItems(
                  name: 'Công việc mong muốn',
                  value: controller.profile.job,
                ),
                JInfoItems(
                  name: 'Mức lương',
                  value: controller.profile.salary,
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Kĩ năng"),
                const SizedBox(height: JSizes.spaceBtwItems),
                Wrap(
                  children: controller.profile.skills
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(
                                right: JSizes.sm, bottom: JSizes.sm),
                            child: Chip(
                              label: Text(e.name),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JProfileApplyDescription(
                    title: "Kinh nghiệm",
                    description: controller.profile.experience),
                JProfileApplyDescription(
                    title: "Sở trường",
                    description: controller.profile.strength),
                JProfileApplyDescription(
                    title: "Yêu cầu",
                    description: controller.profile.requirement)
              ],
            );
          }),
        ),
      ),
      floatingActionButton: JCustomFloatingButton(
        width: 200,
        icon: Iconsax.sms_tracking,
        title: 'Mời Ứng Tuyển',
        onPressed: () {
          invite.profileID.value = profileID;
          if (invite.listJob.isEmpty) {
            JLoader.warningSnackBar(
                title: "Chưa có tuyển dụng",
                message: "Vui lòng thêm tuyển dụng để mời ứng viên!");
          } else {
            invite.selectJobInvite(context);
          }
        },
      ),
    );
  }
}
