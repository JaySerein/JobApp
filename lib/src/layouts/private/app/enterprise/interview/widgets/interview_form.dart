import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/controllers/enterprise/interview_controller.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class InterviewCreate extends StatelessWidget {
  const InterviewCreate({super.key, required this.jobSuccessID});

  final String jobSuccessID;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterviewController(jobSuccessID: jobSuccessID));
    return Scaffold(
      appBar: JAppBar(
        title: Text('Cập nhập thông tin',
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
                children: [
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.date,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        labelText: 'Ngày phỏng vấn',
                        prefixIcon: Icon(Iconsax.calendar)),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  DropdownButtonFormField(
                      validator: (value) => JValidator.validateText(value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.clock),
                        labelText: "Giờ phỏng vấn",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      icon: const Icon(Iconsax.arrow_circle_down),
                      items: controller.listTime.map((item) {
                        return DropdownMenuItem(
                          alignment: Alignment.center,
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (item) {
                        controller.time = item!;
                      }),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.place,
                    keyboardType: TextInputType.text,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: 'Nơi phỏng vấn',
                        prefixIcon: Icon(Iconsax.location)),
                  ),
                  // email
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.room,
                    keyboardType: TextInputType.text,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Phòng", prefixIcon: Icon(Iconsax.timer)),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.interviewer,
                    keyboardType: TextInputType.text,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Người phụ trách phỏng vấn",
                        prefixIcon: Icon(Iconsax.people)),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.skin,
                    maxLines: 3,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Yêu cầu trang phục (nếu có )',
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.doc,
                    maxLines: 3,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Yêu cầu giấy tờ (nếu có )',
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(
                    height: JSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.requirement,
                    maxLines: 3,
                    validator: (value) => JValidator.validateText(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: 'Yêu cầu khác (nếu có )',
                      alignLabelWithHint: true,
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: SizedBox(
            width:
                JDevice.getScreenWidth(context) / 2 - JSizes.spaceBtwSections,
            child: ElevatedButton(
                onPressed: () => controller.createInterview(),
                child: const Text("Hẹn lịch phỏng vấn"))),
      ),
    );
  }
}
