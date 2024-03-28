import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: JTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: JSizes.spaceBtwInputFields,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: JTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            )
          ],
        ),
        // username
        const SizedBox(
          height: JSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: JTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        // email
        const SizedBox(
          height: JSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: JTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        //phone
        const SizedBox(
          height: JSizes.spaceBtwInputFields,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: JTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        //password
        const SizedBox(
          height: JSizes.spaceBtwInputFields,
        ),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: JTexts.password,
            prefixIcon: Icon(Iconsax.password_check),
            suffixIcon: Icon(Iconsax.eye_slash),
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
                child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(
              height: JSizes.spaceBtwItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${JTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: JTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? JColors.white : JColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? JColors.white : JColors.primary,
                      )),
              TextSpan(
                  text: ' ${JTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${JTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? JColors.white : JColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? JColors.white : JColors.primary,
                      )),
            ]))
          ],
        ),
        const SizedBox(
          height: JSizes.spaceBtwSections,
        ),
        // signup button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.toNamed('verify-email'),
              child: const Text(JTexts.createAccount)),
        )
      ],
    ));
  }
}
