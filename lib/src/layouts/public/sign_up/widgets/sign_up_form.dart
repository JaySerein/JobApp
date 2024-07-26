import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/widgets/text_form_field/text_field_no_action.dart';
import 'package:job_app/src/controllers/signup_controller.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: signupFormKey,
        child: Column(
          children: [
            // username
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
            TextFormField(
              controller: controller.email,
              validator: (value) => JValidator.validateEmail(value),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  labelText: JTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: JSizes.spaceBtwInputFields,
            ),
            GestureDetector(
              onTap: () => controller.selectRole(context),
              child: Stack(
                children: [
                  Obx(() {
                    return TextFormField(
                      readOnly: true,
                      canRequestFocus: false,
                      controller: controller.role.value,
                      decoration: const InputDecoration(
                          labelText: 'Vai trò', prefixIcon: Icon(Iconsax.star)),
                    );
                  }),
                  const JDisableTextField()
                ],
              ),
            ),
            const SizedBox(
              height: JSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePass.value,
                validator: (value) => JValidator.validatePassword(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: JTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePass.value =
                          !controller.hidePass.value,
                      icon: Icon(controller.hidePass.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: JSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.repassword,
                validator: (value) => JValidator.validatePassword(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: controller.hideRepass.value,
                decoration: InputDecoration(
                  labelText: JTexts.repassword,
                  prefixIcon: const Icon(Iconsax.tick_circle),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hideRepass.value =
                          !controller.hideRepass.value,
                      icon: Icon(controller.hideRepass.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections,
            ),
            // check box terms
            Row(
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(() => Checkbox(
                        value: controller.termOfUse.value,
                        onChanged: (value) => controller.termOfUse.value =
                            !controller.termOfUse.value))),
                const SizedBox(
                  height: JSizes.spaceBtwItems,
                ),
                RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${JTexts.iAgreeTo} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: JTexts.privacyPolicy,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark ? JColors.white : JColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? JColors.white : JColors.primary,
                              )),
                      TextSpan(
                          text: ' ${JTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${JTexts.termsOfUse} ',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: dark ? JColors.white : JColors.primary,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    dark ? JColors.white : JColors.primary,
                              )),
                    ])),
              ],
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections,
            ),
            // signup button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(signupFormKey),
                  child: const Text(JTexts.createAccount)),
            )
          ],
        ));
  }
}
