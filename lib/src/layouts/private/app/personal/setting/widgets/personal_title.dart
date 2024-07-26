import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';

class JProfileTitle extends StatelessWidget {
  const JProfileTitle({
    super.key,
    required this.userName,
    required this.email,
    this.onPressed,
    required this.imageUrl,
  });

  final String userName, email, imageUrl;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: JRoundedImage(
          imageUrl: imageUrl,
          isNetworkImage: true,
          borderRadius: 50,
          width: 50,
          height: 50,
          padding: EdgeInsets.zero),
      title: Text(userName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: JColors.white)),
      subtitle: Text(email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: JColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: JColors.white,
          )),
    );
  }
}
