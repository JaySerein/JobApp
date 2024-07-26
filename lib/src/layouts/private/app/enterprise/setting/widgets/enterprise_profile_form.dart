import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/controllers/enterprise/enterprise_profile_update_controller.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class EnterpriseProfileUpdate extends StatelessWidget {
  const EnterpriseProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnterpriseProfileUpdateController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Cập nhật thông tin doanh nghiệp',
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
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.eName,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const InputDecoration(labelText: "Tên doanh nghiệp"),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.eTaxCode,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: 'Mã số thuế'),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.eActivity,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Lĩnh vực hoạt động',
                      alignLabelWithHint: true,
                    ),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => controller.updateEnterpriseProfile(),
            child: const Text("Lưu thông tin")),
      ),
    );
  }
}
