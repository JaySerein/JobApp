import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_detail_text.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JProfileDetailHeader extends StatelessWidget {
  const JProfileDetailHeader({
    super.key,
    required this.profile,
    this.isApply = false,
    this.jobName = "",
  });

  final PersonalProfileModel profile;
  final bool isApply;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        JRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(JSizes.sm),
            backgroundColor: dark ? JColors.dark : JColors.light,
            child: JRoundedImage(
              imageUrl: profile.userID.userImage,
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
                        JCardTitleText(title: isApply ? jobName : profile.job),
                        const SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.user_square,
                            title: profile.userID.fullname),
                        const SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.direct_right, title: profile.career),
                        const SizedBox(height: JSizes.spaceBtwItems / 2),
                        JCardDetailsText(
                            icon: Iconsax.dollar_circle, title: profile.salary),
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
