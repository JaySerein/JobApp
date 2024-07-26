import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JJobDetailHeader extends StatelessWidget {
  const JJobDetailHeader({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        JRoundedContainer(
            height: 120,
            width: 120,
            padding: const EdgeInsets.all(JSizes.sm),
            backgroundColor: dark ? JColors.dark : JColors.light,
            child: JRoundedImage(
              imageUrl: job.enterprise.user.userImage,
              isNetworkImage: true,
            )),
        Column(
          children: [
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
                                "${job.enterprise.user.province.name} - ${job.enterprise.user.district.name}"),
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
        )
      ],
    );
  }
}
