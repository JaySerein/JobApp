import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/search_bar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/components/widgets/staff/staff_card.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class StaffFind extends StatelessWidget {
  const StaffFind({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: JAppBar(
          title: Text('Tìm nhân viên',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: JColors.white)),
          action: [JNotification(onPressed: () {}, iconColor: JColors.light)],
          showBackground: true,
        ),
        backgroundColor: dark ? JColors.dark : JColors.white,
        body: Column(
          children: [
            const SizedBox(height: JSizes.spaceBtwItems / 2),
            const JSearchContainer(
                text: "Từ khoá công việc...",
                showBackground: false,
                showBorder: true),
            const SizedBox(height: JSizes.spaceBtwItems),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
              child: JSectionHeadingWithIcon(
                title: "Gợi ý nhân viên",
                showActionButton: true,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: JSizes.spaceBtwItems / 2),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => JStaffCard(
                    jobName: 'Lập Trình Viên',
                    staffName: 'Nguyễn Quang Tuấn',
                    companyAddress: 'Công Nghệ Thông Tin',
                    experience: '3 năm',
                    salary: '10.000.000 - 15.000.000',
                    imageUrl: JImages.companyAvatar,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
