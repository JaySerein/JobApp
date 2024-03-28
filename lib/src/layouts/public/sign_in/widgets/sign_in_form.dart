import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/utils/validators/form_validation.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: JSizes.spaceBtwSections),
      child: Column(
        children: [
          //Email
          TextFormField(
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
          TextFormField(
            obscureText: !_isShow,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: JTexts.password,
              suffixIcon: GestureDetector(
                  onTap: showPassword,
                  child: _isShow
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash)),
            ),
            validator: (value) => JValidator.validatePassword(value),
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  Checkbox(value: true, onChanged: (value) {}),
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
                  onPressed: () => Get.toNamed('user-page'),
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

  void showPassword() {
    setState(() {
      _isShow = !_isShow;
    });
  }
}
