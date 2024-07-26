import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/rounded_container.dart';

class JSingleSelectItem extends StatelessWidget {
  const JSingleSelectItem(
      {super.key,
      required this.onTap,
      required this.isChose,
      required this.title});

  final String title;
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
                  title,
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

class JTextGrid extends StatelessWidget {
  const JTextGrid({
    super.key,
    required this.title,
    required this.onTap,
    this.icon = Iconsax.minus_cirlce,
    this.iconColor = JColors.error,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return JRoundedContainer(
        radius: 10,
        showBorder: true,
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.md, vertical: JSizes.sm),
        width: double.infinity,
        backgroundColor: Colors.transparent,
        borderColor: JColors.grey,
        margin: const EdgeInsets.symmetric(vertical: JSizes.sm / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(fontSizeDelta: 4)),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            )
          ],
        ));
  }
}
