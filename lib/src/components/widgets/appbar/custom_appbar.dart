import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';

class JAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed,
    this.showBackground = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: showBackground ? JColors.primary : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: JSizes.md),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              leading: showBackArrow
                  ? IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Iconsax.arrow_left,
                        color: JColors.white,
                      ))
                  : leadingIcon != null
                      ? IconButton(
                          onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                      : null,
              title: title,
              actions: action,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JDevice.getAppBarHeight());
}
