import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/shadow_style.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/job_invite_model.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JJobCard extends StatelessWidget {
  const JJobCard({super.key, this.onPressed, required this.job});

  final JobModel job;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
        child: Container(
          margin: const EdgeInsets.only(bottom: JSizes.md),
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
                height: 120,
                // padding: const EdgeInsets.all(JSizes.sm),
                backgroundColor: dark ? JColors.dark : JColors.light,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: JRoundedImage(
                    imageUrl: job.enterprise.user.userImage,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
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
                          JCardTitleText(title: job.job),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.building,
                              title: job.enterprise.enterpriseName),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.location,
                              title:
                                  "${job.enterprise.user.province.name} / ${job.enterprise.user.district.name}"),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.dollar_circle,
                              title: "${job.startSalary} - ${job.upSalary}"),
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

class JJobCardInvite extends StatelessWidget {
  const JJobCardInvite({super.key, this.onPressed, required this.invite});

  final JobInviteModel invite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
        child: Container(
          margin: const EdgeInsets.only(bottom: JSizes.md),
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
                height: 120,
                // padding: const EdgeInsets.all(JSizes.sm),
                backgroundColor: dark ? JColors.dark : JColors.light,
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: JRoundedImage(
                    imageUrl: invite.fUserImage,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
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
                          JCardTitleText(title: invite.jobName),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.building, title: invite.fUserName),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.calendar, title: invite.date),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: Iconsax.clock, title: invite.status),
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
