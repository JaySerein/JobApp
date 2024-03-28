import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JJobDetailHeader extends StatelessWidget {
  const JJobDetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        JRoundedContainer(
            height: 120,
            // padding: const EdgeInsets.all(JSizes.sm),
            backgroundColor: dark ? JColors.dark : JColors.light,
            child: const JRoundedImage(imageUrl: JImages.companyAvatar)),
        const Column(
          children: [
            SizedBox(
              width: 220,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: JSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        JCardTitleText(title: "Lập trình viên"),
                        SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.building, title: "Công ty TNHH CP"),
                        SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.location,
                            title: "567 Lê Duẩn, BMT, Đắk lắk"),
                        SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.dollar_circle,
                            title: "10.000.000 - 20.000.000"),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
