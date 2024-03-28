import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/company/job/widgets/job_list.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class CompanyJob extends StatelessWidget {
  const CompanyJob({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: JAppBar(
        title: Text('Công việc',
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
          const SizedBox(height: JSizes.spaceBtwSections / 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
            child: JSectionHeading(title: "Danh sách công việc cần tuyển dụng"),
          ),
          const SizedBox(height: JSizes.spaceBtwItems),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => JJobCompany(
                    jobName: 'Lập Trình Viên',
                    numberApply: '3',
                    isActive: false,
                    onPressed: () {}),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.defaultSpace, vertical: JSizes.sm),
        child: ElevatedButton(
            onPressed: () {}, child: const Text("Thêm tuyển dụng mới")),
      ),
    );
  }
}
