import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';
import 'package:job_app/src/models/job_model.dart';

class JJobCardSelect extends StatelessWidget {
  const JJobCardSelect(
      {super.key,
      required this.job,
      required this.onTap,
      required this.isChose});

  final JobModel job;
  final VoidCallback onTap;
  final bool isChose;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white.withOpacity(0),
      splashColor: Colors.white.withOpacity(0),
      onTap: onTap,
      child: JRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(JSizes.md),
        width: double.infinity,
        backgroundColor: Colors.transparent,
        borderColor: JColors.darkGrey,
        margin: const EdgeInsets.only(bottom: JSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 5,
                child: Icon(
                  isChose ? Iconsax.tick_circle : null,
                  color: JColors.primary,
                  size: 20,
                )),
            Column(
              children: [
                Text(
                  job.job,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
