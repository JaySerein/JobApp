import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/custom_shape/search_bar.dart';
import 'package:job_app/src/components/widgets/staff/staff_card.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/user/user_home/widgets/home_appbar.dart';
import 'package:job_app/src/layouts/private/user/user_home/widgets/home_category.dart';

class CompanyHomeScreen extends StatelessWidget {
  const CompanyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const JHeaderContainer(
            child: Column(
              children: [
                ///appbar home
                JHomeAppBar(),
                SizedBox(height: JSizes.spaceBtwSections),
                // search bar
                JSearchContainer(text: 'Từ khoá công việc...'),
                SizedBox(height: JSizes.spaceBtwSections),
                // categories
                Padding(
                  padding: EdgeInsets.only(left: JSizes.defaultSpace),
                  child: Column(
                    children: [
                      JSectionHeading(
                          title: 'Lĩnh vực phổ biến', textColor: Colors.white),
                      SizedBox(height: JSizes.spaceBtwItems),
                      JHomeCategory()
                    ],
                  ),
                ),
                SizedBox(height: JSizes.spaceBtwSections * 1.5),
              ],
            ),
          ),
          //body
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
            child: JSectionHeading(title: "Ứng viên nổi trội"),
          ),
          ListView.builder(
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
        ]),
      ),
    );
  }
}
