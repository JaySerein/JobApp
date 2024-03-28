import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: JHelperFunctions.screenWidth() * 0.8,
              height: JHelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: JColors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: JSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: JColors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
