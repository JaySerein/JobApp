import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/text_form_field/text_field_no_action.dart';
import 'package:job_app/src/controllers/personal/personal_account_update_controller.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class PersonalAccountUpdate extends StatelessWidget {
  const PersonalAccountUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalAccountUpdateController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      controller: controller.fullname,
                      validator: (value) => JValidator.validateText(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: JTexts.fullname,
                          prefixIcon: Icon(Iconsax.user_tick)),
                    ),
                    // email
                    const SizedBox(
                      height: JSizes.spaceBtwInputFields,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectDate(context);
                      },
                      child: Stack(
                        children: [
                          Obx(() {
                            return TextFormField(
                              readOnly: true,
                              canRequestFocus: false,
                              controller: controller.birthday.value,
                              decoration: const InputDecoration(
                                  labelText: 'Ngày sinh',
                                  prefixIcon: Icon(Iconsax.calendar)),
                            );
                          }),
                          const JDisableTextField()
                        ],
                      ),
                    ),
                    // email
                    const SizedBox(
                      height: JSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.phone,
                      keyboardType: TextInputType.number,
                      validator: (value) => JValidator.validateText(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          labelText: JTexts.phoneNo,
                          prefixIcon: Icon(Iconsax.call)),
                    ),
                    const SizedBox(
                      height: JSizes.spaceBtwInputFields,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.selectGender(context);
                      },
                      child: Stack(
                        children: [
                          Obx(() {
                            return TextFormField(
                              readOnly: true,
                              canRequestFocus: false,
                              controller: controller.gender.value,
                              decoration: const InputDecoration(
                                  labelText: 'Giới tính',
                                  prefixIcon: Icon(Iconsax.profile_2user),
                                  suffixIcon: Icon(Iconsax.arrow_circle_down)),
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
                        controller.selectProvince(context);
                      },
                      child: Stack(
                        children: [
                          Obx(() {
                            return TextFormField(
                              readOnly: true,
                              canRequestFocus: false,
                              controller: controller.province.value,
                              decoration: const InputDecoration(
                                  labelText: 'Tỉnh/ Thành phố',
                                  prefixIcon: Icon(Iconsax.map_1),
                                  suffixIcon: Icon(Iconsax.arrow_circle_down)),
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
                        controller.selectDistrict(context);
                      },
                      child: Stack(
                        children: [
                          Obx(() {
                            return TextFormField(
                              readOnly: true,
                              canRequestFocus: false,
                              controller: controller.district.value,
                              decoration: const InputDecoration(
                                  labelText: 'Quận/ Huyện',
                                  prefixIcon: Icon(Iconsax.location),
                                  suffixIcon: Icon(Iconsax.arrow_circle_down)),
                            );
                          }),
                          const JDisableTextField()
                        ],
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
                  onPressed: () => controller.updateAccountInfo(),
                  child: const Text("Lưu thông tin"))),
        ),
      ),
    );
  }
}
