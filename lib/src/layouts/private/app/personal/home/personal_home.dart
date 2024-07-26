import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/custom_shape/search_bar.dart';
import 'package:job_app/src/components/widgets/job_card/job_card.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/personal/personal_home_controller.dart';
import 'package:job_app/src/layouts/private/app/personal/job_details/job_details.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_appbar.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_category.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_slider.dart';

class PersonalHomeScreen extends StatelessWidget {
  const PersonalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalHomeController());
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
                // SizedBox(height: JSizes.spaceBtwSections),
                // // categories
                // Padding(
                //   padding: EdgeInsets.only(left: JSizes.defaultSpace),
                //   child: Column(
                //     children: [
                //       JSectionHeading(
                //           title: 'Ngành nghề phổ biến',
                //           textColor: Colors.white),
                //       SizedBox(height: JSizes.spaceBtwItems),
                //       JHomeCategory()
                //     ],
                //   ),
                // ),
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
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: JSizes.defaultSpace,
                vertical: JSizes.spaceBtwItems / 2),
            child: JSectionHeading(
              title: "Nổi bật",
              showActionButton: true,
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) return Container();
            if (controller.listJob.isEmpty) {
              return Text(
                'Chưa có tuyển dụng',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            }
            return JListCard(
                itemCount: controller.jobCount.value,
                itemBuilder: (_, index) => JJobCard(
                      job: controller.listJob[index],
                      onPressed: () => Get.to(
                          () => JJobDetails(job: controller.listJob[index])),
                    ));
          }),
        ]),
      ),
    );
  }
}

class JListCard extends StatelessWidget {
  const JListCard({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: itemBuilder);
  }
}
