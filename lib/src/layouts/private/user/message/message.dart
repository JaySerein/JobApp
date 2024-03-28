import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/message/message_card.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Tin nhắn',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        action: [JNotification(onPressed: () {}, iconColor: JColors.light)],
        showBackground: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const JSectionHeading(title: "Tin nhắn gần đây"),
              const SizedBox(height: JSizes.spaceBtwItems),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => const JMessagesCard(
                      companyName: "Công ty GHTK",
                      message:
                          "Công ty gửi bạn lịch phỏng vấn vào lúc 9:30 ngày 31/03/2024 tại trụ sở chính công ty.",
                      imageUrl: JImages.companyAvatar)),
            ],
          ),
        ),
      ),
    );
  }
}
