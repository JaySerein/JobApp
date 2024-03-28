import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image:
                AssetImage(dark ? JImages.lightAppLogo : JImages.darkAppLogo)),
        const SizedBox(
          height: JSizes.spaceBtwItems,
        ),
        Text(
          JTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: JSizes.sm,
        ),
        Text(
          JTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
