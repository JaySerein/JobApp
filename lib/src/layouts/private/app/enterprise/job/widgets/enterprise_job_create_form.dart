import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/text_form_field/text_field_no_action.dart';
import 'package:job_app/src/controllers/enterprise/job_controller/enterprise_job_create_controller.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class EnterpriseJobCreate extends StatelessWidget {
  const EnterpriseJobCreate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EnterpriseJobCreateController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Tuyển dụng mới',
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
              key: controller.jobCreateFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.job,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "Công việc"),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectCategory(context);
                    },
                    child: Stack(
                      children: [
                        Obx(() {
                          return TextFormField(
                            canRequestFocus: false,
                            controller: controller.cat.value,
                            decoration: const InputDecoration(
                              labelText: "Lĩnh vực ngành nghề",
                              suffixIcon: Icon(Iconsax.arrow_circle_down),
                            ),
                          );
                        }),
                        const JDisableTextField()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectSkill(context);
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: "Kĩ năng",
                        suffixIcon: Icon(Iconsax.add_circle),
                      ),
                    ),
                  ),

                  Obx(() {
                    if (controller.selectedSkills.isEmpty) {
                      return const SizedBox(
                        height: JSizes.spaceBtwInputFields,
                      );
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: JSizes.sm * 1.5,
                          ),
                          ListView.builder(
                            itemCount: controller.selectedSkills.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => JTextGrid(
                                onTap: () => controller.selectedSkills
                                    .remove(controller.selectedSkills[index]),
                                title: controller.selectedSkills[index].name),
                          ),
                          const SizedBox(
                            height: JSizes.sm * 1.5,
                          ),
                        ],
                      );
                    }
                  }),
                  TextFormField(
                    controller: controller.startSalary,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const InputDecoration(labelText: 'Lương khởi điểm'),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.upSalary,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const InputDecoration(labelText: 'Lương tối đa'),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.workPlace,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Nơi làm việc",
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.jobDescription,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả công việc',
                      alignLabelWithHint: true,
                    ),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.benefit,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Phúc lời & thưởng',
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.requirement,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Yêu cầu khác',
                      alignLabelWithHint: true,
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => controller.createJob(),
            child: const Text("Hoàn tất")),
      ),
    );
  }
}
