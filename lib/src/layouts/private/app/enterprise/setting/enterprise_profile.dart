import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/enterprise_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/setting/widgets/enterprise_profile_form.dart';

class EnterpriseProfile extends StatelessWidget {
  const EnterpriseProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(EnterpriseProfileController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Doanh nghiệp',
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
                const JSectionHeading(title: "Thông tin doanh nghiệp"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Tên doanh nghiệp',
                  value: controller.enterpriseProfile.enterpriseName,
                ),
                JInfoItems(
                  name: 'Mã số thuế',
                  value: controller.enterpriseProfile.taxCode,
                ),
                JInfoItems(
                  name: 'Lĩnh vực hoạt động',
                  value: controller.enterpriseProfile.activity,
                ),
                JInfoItems(
                  name: 'Địa chỉ',
                  value:
                      "${controller.enterpriseProfile.user.province.name} / ${controller.enterpriseProfile.user.district.name}",
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Thông tin liên hệ"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Email',
                  value: controller.enterpriseProfile.user.email,
                ),
                JInfoItems(
                  name: 'Số điện thoại',
                  value: controller.enterpriseProfile.user.phone,
                ),
                const JInfoItems(
                  name: 'Website',
                  value: 'abc.vn',
                ),
                const JInfoItems(
                  name: 'Fanpage',
                  value: 'ABC group',
                ),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const EnterpriseProfileUpdate()),
                      child: const Text('Cập nhập thông tin')),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
