import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JVerticalImageText extends StatelessWidget {
  const JVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = JColors.white,
    this.backgroundColor = JColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: JSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(JSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? JColors.black : JColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(JSizes.sm / 2),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    // color: dark ? JColors.light : JColors.dark,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: JSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: JColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
