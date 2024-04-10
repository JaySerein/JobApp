import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/controllers/role_controller.dart';
import 'package:job_app/src/layouts/private/role/widgets/role.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoleController());
    return Scaffold(
      appBar: JAppBar(
        title: Text("",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(JSizes.defaultSpace),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => JRole(
                        title: 'Người Dùng',
                        imageUrl: JImages.userRole,
                        onPressed: () => {
                          controller.company.value = false,
                          controller.user.value = true
                        },
                        isChoose: controller.user.value ? true : false,
                      ),
                    ),
                    Obx(
                      () => JRole(
                        title: 'Doanh Nghiệp',
                        imageUrl: JImages.companyRole,
                        onPressed: () => {
                          controller.company.value = true,
                          controller.user.value = false
                        },
                        isChoose: controller.company.value ? true : false,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          width: double.infinity,
          child:
              ElevatedButton(onPressed: () {}, child: const Text('Xác nhận'))),
    );
  }
}
