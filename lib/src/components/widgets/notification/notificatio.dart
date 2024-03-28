import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';

class JNotification extends StatelessWidget {
  const JNotification({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.notification,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: JColors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "0",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: JColors.white, fontSizeFactor: 1),
              ),
            ),
          ),
        )
      ],
    );
  }
}
