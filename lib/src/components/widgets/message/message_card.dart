import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/shadow_style.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JMessagesCard extends StatelessWidget {
  const JMessagesCard({
    super.key,
    required this.companyName,
    required this.message,
    required this.imageUrl,
  });

  final String companyName, message, imageUrl;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: JSizes.spaceBtwItems / 3),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [JShadowStyle.horizontalCard],
            borderRadius: BorderRadius.circular(JSizes.productImageRadius),
            color: dark ? JColors.darkerGrey : JColors.white),
        child: Row(
          children: [
            //thumbnail
            JRoundedContainer(
              height: 70,
              // padding: const EdgeInsets.all(JSizes.sm / 2),
              backgroundColor: dark ? JColors.dark : JColors.light,
              child: SizedBox(
                width: 70,
                height: 70,
                child:
                    JRoundedImage(imageUrl: imageUrl, applyImageRadius: true),
              ),
            ),
            //detail
            SizedBox(
              width: 220,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: JSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JCardTitleText(title: companyName),
                        const SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(icon: Iconsax.message, title: message),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
