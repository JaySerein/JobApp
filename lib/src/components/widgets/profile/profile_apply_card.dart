import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/shadow_style.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/job_apply_mode.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JProfileApplyCard extends StatelessWidget {
  const JProfileApplyCard({super.key, this.onPressed, required this.item});

  final JobApplyModel item;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final boxWidth =
        JDevice.getScreenWidth(context) - 140 - JSizes.defaultSpace * 2;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.defaultSpace, vertical: JSizes.defaultSpace / 3),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
          decoration: BoxDecoration(
              boxShadow: [JShadowStyle.horizontalCard],
              borderRadius: BorderRadius.circular(JSizes.productImageRadius),
              color: dark ? JColors.darkerGrey : JColors.white),
          child: Row(
            children: [
              //thumbnail
              JRoundedContainer(
                height: 120,
                // padding: const EdgeInsets.all(JSizes.sm),
                backgroundColor: dark ? JColors.dark : JColors.light,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: JRoundedImage(
                    imageUrl: item.fUserImage,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),
              ),
              //detail
              SizedBox(
                width: boxWidth,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: JSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          JCardTitleText(title: item.jobName),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.user_square, title: item.fUserName),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.calendar, title: item.date),
                          // const SizedBox(height: JSizes.spaceBtwItems / 2),
                          // JCardDetailsText(
                          //     icon: Iconsax.briefcase, title: "ok"),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.clock, title: item.status),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
