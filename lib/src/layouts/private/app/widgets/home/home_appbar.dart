import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';

class JHomeAppBar extends StatelessWidget {
  const JHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return JAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            JTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: JColors.grey),
          ),
          Text(
            JTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white),
          )
        ],
      ),
      action: [
        JNotification(
          onPressed: () {},
          iconColor: JColors.white,
        ),
      ],
    );
  }
}
