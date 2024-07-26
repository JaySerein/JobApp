import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/text_form_field/text_field_no_action.dart';
import 'package:job_app/src/controllers/personal/personal_profile_update_controller.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class PersonalProfileUpdate extends StatelessWidget {
  const PersonalProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalProfileUpdateController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Cập nhập hồ sơ',
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
                  GestureDetector(
                    onTap: () {
                      controller.selectCateogory(context);
                    },
                    child: Stack(
                      children: [
                        Obx(() {
                          return TextFormField(
                            readOnly: true,
                            canRequestFocus: false,
                            controller: controller.selectedCategory.value,
                            decoration: const InputDecoration(
                                labelText: 'Lĩnh vực ngành nghề',
                                suffixIcon: Icon(Iconsax.arrow_circle_down)),
                          );
                        }),
                        const JDisableTextField()
                      ],
                    ),
                  ), // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.job,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: 'Công việc'),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.experience,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Kinh nghiệm',
                      alignLabelWithHint: true,
                    ),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.salary,
                    keyboardType: TextInputType.number,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration:
                        const InputDecoration(labelText: "Mức lương mong muốn"),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.language,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "Ngoại ngữ"),
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.infomatics,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(labelText: "Tin học"),
                    maxLines: 3,
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
                    controller: controller.strength,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Sở trường",
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.requirement,
                    maxLines: 5,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Yêu cầu khác",
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
            onPressed: () => controller.updateProfile(),
            child: const Text("Lưu thông tin")),
      ),
    );
  }
}
