import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';

class JCustomFloatingButton extends StatelessWidget {
  const JCustomFloatingButton({
    super.key,
    this.onPressed,
    this.width = 180,
    required this.title,
    this.icon = Icons.touch_app_outlined,
  });
  final double width;
  final String title;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: JColors.primary,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: JColors.white,
            ),
            const SizedBox(width: JSizes.spaceBtwItems),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: JColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
