import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(JTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: JSizes.spaceBtwItems,
            ),
            Text(
              JTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections * 2,
            ),
            //text field
            TextFormField(
              decoration: const InputDecoration(
                labelText: JTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(
              height: JSizes.spaceBtwSections,
            ),
            //button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAndToNamed('reset-password'),
                    child: const Text(JTexts.submit)))
          ],
        ),
      ),
    );
  }
}
