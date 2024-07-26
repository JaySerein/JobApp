import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/personal/personal_profile_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/personal/personal_nav.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/personal_profile.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/services/services.dart';

class PersonalProfileUpdateController extends GetxController {
  final isLoading = false.obs;
  RxList<Item> skills = <Item>[].obs;
  RxList<Item> category = <Item>[].obs;

  RxList<Item> selectedSkills = <Item>[].obs;
  var itemCount = 0.obs;

  String catID = "";
  final selectedCategory = TextEditingController().obs;
  final job = TextEditingController();
  final experience = TextEditingController();
  final salary = TextEditingController();
  final language = TextEditingController();
  final infomatics = TextEditingController();
  final requirement = TextEditingController();
  final strength = TextEditingController();
  final profile = Get.put(PersonalProfileController()).profile;

  @override
  void onInit() async {
    await getSkills();
    await getCategory();
    job.text = profile.job;
    experience.text = profile.experience;
    salary.text = profile.salary;
    strength.text = profile.strength;
    requirement.text = profile.requirement;
    for (var item in profile.skills) {
      selectedSkills.add(item);
    }
    language.text = profile.language;
    infomatics.text = profile.informatic;
    itemCount.value = profile.skills.length;
    selectedCategory.value.text = profile.category.name;
    catID = profile.category.id;
    super.onInit();
  }

  Future<void> getSkills() async {
    await ApiServices().getSkill().then((value) {
      var data = value.data['listSkills'];
      for (var item in data) {
        var skill = Item.formJson(item);
        skills.add(skill);
      }
    });
  }

  Future<void> getCategory() async {
    await ApiServices().getCategory().then((value) {
      var data = value.data['listCategory'];
      for (var item in data) {
        var skill = Item.formJson(item);
        category.add(skill);
      }
    });
  }

  Future<dynamic> selectCateogory(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn tỉnh/ thành phố"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách tỉnh/ thành phố");
                      }
                      return JListCard(
                          itemCount: category.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () async {
                                  try {
                                    isLoading.value = true;
                                    selectedCategory.value.text =
                                        category[index].name;
                                    catID = category[index].id;
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  Get.back();
                                },
                                isChose: selectedCategory.value.text ==
                                        category[index].name
                                    ? true
                                    : false,
                                title: category[index].name,
                              ));
                    }),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<dynamic> selectSkill(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(JSizes.lg),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: JSizes.spaceBtwSections,
                        ),
                        const JSectionHeading(title: "Chọn kĩ năng"),
                        const SizedBox(
                          height: JSizes.spaceBtwItems,
                        ),
                        Obx(() {
                          if (isLoading.value == true) {
                            return const Text("Đang lấy danh sách kĩ năng");
                          }
                          return JListCard(
                              itemCount: skills.length,
                              itemBuilder: (_, index) => JSingleSelectItem(
                                    onTap: () {
                                      try {
                                        isLoading.value = true;
                                        if (selectedSkills
                                                .contains(skills[index]) ==
                                            true) {
                                          selectedSkills.remove(skills[index]);
                                        } else {
                                          selectedSkills.add(skills[index]);
                                        }
                                      } finally {
                                        isLoading.value = false;
                                      }
                                    },
                                    isChose: selectedSkills
                                                .contains(skills[index]) ==
                                            true
                                        ? true
                                        : false,
                                    title: skills[index].name,
                                  ));
                        }),
                        const SizedBox(
                          height: JSizes.spaceBtwItems,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    color: JColors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: JSizes.defaultSpace),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Xác nhận')))
              ],
            ));
  }

  void updateProfile() async {
    try {
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      if (catID == '') {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(title: "Vui lòng chọn ngành nghề");
        return;
      }

      if (selectedSkills.isEmpty) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Vui lòng chọn kĩ năng",
            message: 'Bạn hãy chọn kĩ năng cần thiết cho công việc này');
        return;
      }
      List<String> eSkillsID = [];
      List<String> eSkillsName = [];
      for (var element in selectedSkills) {
        eSkillsID.add(element.id);
        eSkillsName.add(element.name);
      }

      final userCareer = selectedCategory.value.text;
      final userJob = job.text;
      final userLanguage = language.text;
      final userInformatic = infomatics.text;
      final userExperience = experience.text;
      final userSalary = salary.text;
      final userRequirement = requirement.text;
      final userStrength = strength.text;

      await ApiServices()
          .updatePersonalProfile(
              catID,
              eSkillsID,
              userLanguage,
              userInformatic,
              userCareer,
              userJob,
              userExperience,
              userSalary,
              userRequirement,
              userStrength)
          .then((value) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(title: "Cập nhật thông tin profile thành công");
        Get.offAll(() => const PersonalNav(page: 4));
        Get.to(() => const PersonalProfile());
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Cập nhật hồ sơ thất bại", message: error.toString());
        return;
      });

      /// Validation
    } catch (exception) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
