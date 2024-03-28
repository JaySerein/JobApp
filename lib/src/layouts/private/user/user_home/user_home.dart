import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/custom_shape/search_bar.dart';
import 'package:job_app/src/components/widgets/job_card/job_card.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/user/job_detail/job_detail.dart';
import 'package:job_app/src/layouts/private/user/user_home/widgets/home_appbar.dart';
import 'package:job_app/src/layouts/private/user/user_home/widgets/home_category.dart';
import 'package:job_app/src/layouts/private/user/user_home/widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                          title: 'Ngành phổ biến', textColor: Colors.white),
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
              padding: EdgeInsets.only(
                  top: JSizes.defaultSpace,
                  left: JSizes.defaultSpace,
                  right: JSizes.defaultSpace),
              child: JSlider(banners: [
                JImages.banner1,
                JImages.banner1,
                JImages.banner1
              ])),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => JJobCard(
              jobName: 'Lập Trình Viên',
              companyName: 'Apple Store Viet Nam',
              companyAddress: '567 Lê Duẩn, BMT, Đắk lắk',
              salary: '10.000.000 - 15.000.000',
              imageUrl: JImages.companyAvatar,
              onPressed: () => Get.to(() => const JobDetailScreen()),
            ),
          ),
        ]),
      ),
    );
  }
}
