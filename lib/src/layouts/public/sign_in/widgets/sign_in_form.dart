import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/controllers/signin_controller.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
    return Form(
        key: controller.signinFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: JSizes.spaceBtwSections),
          child: Column(
            children: [
              //Email
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: JTexts.email,
                ),
                validator: (value) => JValidator.validateEmail(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: JSizes.spaceBtwInputFields,
              ),
              //Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePass.value,
                  validator: (value) => JValidator.validateText(value),
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
                height: JSizes.spaceBtwInputFields / 2,
              ),

              // remember me & forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //remember me
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.remember.value,
                          onChanged: (value) => controller.remember.value =
                              !controller.remember.value)),
                      const Text(JTexts.rememberMe),
                    ],
                  ),
                  //forget password
                  TextButton(
                      onPressed: () => Get.toNamed('forget-password'),
                      child: const Text(JTexts.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              //signIn button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.signin(),
                      child: const Text(JTexts.signIn))),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              //create new account
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.toNamed('signup'),
                      child: const Text(JTexts.createAccount))),
            ],
          ),
        ));
  }
}
