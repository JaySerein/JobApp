import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';

class JRole extends StatelessWidget {
  const JRole({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
    required this.isChoose,
  });

  final String title, imageUrl;
  final VoidCallback onPressed;
  final bool isChoose;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          JRoundedImage(
            imageUrl: imageUrl,
            width: 150,
            height: 150,
            border: Border.all(
                color: isChoose ? JColors.primary : Colors.transparent),
          ),
          const SizedBox(
            height: JSizes.spaceBtwItems,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
