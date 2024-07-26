import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/components/widgets/profile/profile_card.dart';
import 'package:job_app/src/controllers/enterprise/list_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/enterprise/profile_details/profile_detail.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class EnterpriseSuggestScreen extends StatelessWidget {
  const EnterpriseSuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    var controller = Get.put(ListProfileController());
    return DefaultTabController(
      length: controller.category.length,
      child: Scaffold(
        appBar: JAppBar(
          title: Text('Tìm hồ sơ',
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
                    Obx(() {
                      if (controller.isloading.value) {
                        return Container();
                      }
                      return JListCard(
                          itemCount: controller.listProfile.length,
                          itemBuilder: (_, index) {
                            if (controller.listProfile[index].category.id ==
                                element.id) {
                              return JPersonalProfileCard(
                                profile: controller.listProfile[index],
                                onPressed: () => Get.to(() => JProfileDetails(
                                      profileID:
                                          controller.listProfile[index].id,
                                    )),
                              );
                            } else {
                              return Container();
                            }
                          });
                    }),
                  ],
                ),
              );
            }).toList())),
      ),
    );
  }
}

class JTabBar extends StatelessWidget implements PreferredSizeWidget {
  const JTabBar({
    super.key,
    required this.tab,
  });
  final List<Widget> tab;
  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? JColors.black : JColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: JColors.primary,
        labelColor: dark ? JColors.white : JColors.primary,
        tabs: tab,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(JDevice.getAppBarHeight());
}
