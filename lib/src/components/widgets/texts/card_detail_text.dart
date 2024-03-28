import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/texts/card_title_text.dart';

class JCardDetailsText extends StatelessWidget {
  const JCardDetailsText({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: JSizes.md),
        const SizedBox(width: JSizes.spaceBtwItems / 4),
        SizedBox(
          width: 170,
          child: JCardTitleText(
            title: title,
            smallSize: true,
            maxLines: 1,
          ),
        )
      ],
    );
  }
}
