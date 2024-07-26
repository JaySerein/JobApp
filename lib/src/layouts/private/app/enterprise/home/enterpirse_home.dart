import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/header_container.dart';
import 'package:job_app/src/components/widgets/custom_shape/search_bar.dart';
import 'package:job_app/src/components/widgets/profile/profile_card.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/list_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/profile_details/profile_detail.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_appbar.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_category.dart';
import 'package:job_app/src/layouts/private/app/widgets/home/home_slider.dart';

class EnterpirseHomeScreen extends StatelessWidget {
  const EnterpirseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListProfileController());
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
                          title: 'Ngành nghề phổ biến',
                          textColor: Colors.white),
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
            if (controller.isloading.value) return Container();
            if (controller.listProfile.isEmpty) {
              return Text(
                'Chưa có hồ sơ',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            }
            return JListCard(
                itemCount: controller.listProfile.length,
                itemBuilder: (_, index) => JPersonalProfileCard(
                      profile: controller.listProfile[index],
                      onPressed: () => Get.to(() => JProfileDetails(
                            profileID: controller.listProfile[index].id,
                          )),
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
