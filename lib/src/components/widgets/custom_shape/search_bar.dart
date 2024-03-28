import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class JSearchContainer extends StatelessWidget {
  const JSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: JDevice.getScreenWidth(context),
          padding: const EdgeInsets.all(JSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? JColors.dark
                    : JColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(JSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: JColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: JColors.darkGrey,
              ),
              const SizedBox(
                width: JSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
