import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/styles/customs/shadow_style.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';
import 'package:job_app/src/models/success_connect_model.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JPersonalInterviewCard extends StatelessWidget {
  const JPersonalInterviewCard(
      {super.key,
      required this.item,
      this.onPressedInterview,
      this.onPressedMessage});

  final SuccessConnectModel item;
  final VoidCallback? onPressedInterview;
  final VoidCallback? onPressedMessage;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final boxWidth =
        JDevice.getScreenWidth(context) - 110 - JSizes.defaultSpace * 2;
    return Padding(
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
              height: 100,
              width: 100,
              // padding: const EdgeInsets.all(JSizes.sm),
              backgroundColor: dark ? JColors.dark : JColors.light,
              child: SizedBox(
                width: 100,
                height: 100,
                child: JRoundedImage(
                  imageUrl: item.pUserImage,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: JCardTitleText(
                              title: '${item.jobName} - ${item.pUserName}'),
                        ),
                        const SizedBox(height: JSizes.spaceBtwItems),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ElevatedButton(
                                  onPressed: onPressedInterview,
                                  child: const Text("Lịch phỏng vấn")),
                            ),
                            const SizedBox(
                              width: JSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                  onPressed: onPressedMessage,
                                  child: const Icon(Iconsax.message_2)),
                            ),
                          ],
                        ),
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
