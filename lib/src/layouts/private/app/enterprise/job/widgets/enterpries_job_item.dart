import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/shadow_style.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JJobCompany extends StatelessWidget {
  const JJobCompany({
    super.key,
    this.onPressed,
    required this.job,
  });

  final VoidCallback? onPressed;
  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final isActive = job.isOpen;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.defaultSpace, vertical: JSizes.defaultSpace / 3),
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: JSizes.sm),
          decoration: BoxDecoration(
              boxShadow: [JShadowStyle.horizontalCard],
              borderRadius: BorderRadius.circular(JSizes.productImageRadius),
              color: dark ? JColors.darkerGrey : JColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                              icon: Iconsax.user_square,
                              title: 'Lượt ứng tuyển: ${job.applyCount}'),
                          const SizedBox(height: JSizes.spaceBtwItems / 2),
                          JCardDetailsText(
                              icon: isActive ? Iconsax.eye : Iconsax.eye_slash,
                              title: isActive ? "Đang mở" : "Đang đóng"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // status
              Column(
                children: [
                  Switch(
                    activeColor: JColors.primary,
                    value: isActive,
                    onChanged: ((value) {}),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
