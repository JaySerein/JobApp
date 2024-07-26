import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/job_card/job_card.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/controllers/personal/personal_home_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/enterprise/profile_suggest/profile_suggest.dart';
import 'package:job_app/src/layouts/private/app/personal/job_details/job_details.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class PersonalJobScreen extends StatelessWidget {
  const PersonalJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = Get.put(PersonalHomeController());
    return DefaultTabController(
      length: controller.category.length,
      child: Scaffold(
          appBar: JAppBar(
            title: Text('Tìm việc',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: JColors.white)),
            action: [JNotification(onPressed: () {}, iconColor: JColors.light)],
            showBackground: true,
          ),
          backgroundColor: dark ? JColors.dark : JColors.white,
          body: NestedScrollView(
              headerSliverBuilder: (_, indexBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: dark ? JColors.black : JColors.white,
                    bottom: JTabBar(
                      tab: controller.category
                          .map((item) => Tab(
                                child: Text(item.name),
                              ))
                          .toList(),
                    ),
                  )
                ];
              },
              body: TabBarView(
                  children: controller.category.map((element) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: JSizes.defaultSpace),
                  child: Column(
                    children: [
                      JListCard(
                          itemCount: controller.listJob.length,
                          itemBuilder: (_, index) {
                            if (controller.listJob[index].category.id ==
                                element.id) {
                              return JJobCard(
                                job: controller.listJob[index],
                                onPressed: () => Get.to(() => JJobDetails(
                                    job: controller.listJob[index])),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                );
              }).toList()))),
    );
  }
}
