import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/app/enterprise/enterprise_nav.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseJobCreateController extends GetxController {
  final jobCreateFormKey = GlobalKey<FormState>();

  RxList<Item> skills = <Item>[].obs;
  RxList<Item> category = <Item>[].obs;

  RxList<Item> selectedSkills = <Item>[].obs;
  var itemCount = 0.obs;

  final selectedCategory = Item().obs;

  final isLoading = false.obs;

  final job = TextEditingController();
  final startSalary = TextEditingController();
  final upSalary = TextEditingController();
  final workPlace = TextEditingController();
  final jobDescription = TextEditingController();
  final benefit = TextEditingController();
  final requirement = TextEditingController();
  final cat = TextEditingController().obs;

  @override
  void onInit() async {
    await getSkills();
    await getCategory();
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

  Future<dynamic> selectCategory(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn công việc"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách công việc");
                      }
                      return JListCard(
                          itemCount: category.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () {
                                  try {
                                    isLoading.value = true;
                                    selectedCategory.value = category[index];
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  cat.value.text = selectedCategory.value.name;
                                  Get.back();
                                },
                                isChose: selectedCategory.value.id ==
                                        category[index].id
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

  Future<void> createJob() async {
    try {
      /// Loading
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      if (!jobCreateFormKey.currentState!.validate()) {
        JFullLoader.closeLoading();
        return;
      }

      if (selectedCategory.value.id == "") {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Vui lòng chọn lĩnh vực ngành nghề",
            message: 'Bạn hãy chọn ngành nghề cho công việc này');
        return;
      }

      if (selectedSkills.isEmpty) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Vui lòng chọn kĩ năng",
            message: 'Bạn hãy chọn kĩ năng cần thiết cho công việc này');
        return;
      }

      final eJob = job.text;
      final eCategoryID = selectedCategory.value.id;
      List<String> eSkillsID = [];
      List<String> eSkillsName = [];
      for (var element in selectedSkills) {
        eSkillsID.add(element.id);
        eSkillsName.add(element.name);
      }
      final eStartSalary = startSalary.text;
      final eUpSalary = upSalary.text;
      final eWorkPlace = workPlace.text;
      final eJobDescription = jobDescription.text;
      final eBenefit = benefit.text;
      final eRequirement = requirement.text;

      await ApiServices()
          .createJobEnterprise(
        eJob,
        eCategoryID,
        eSkillsID,
        eSkillsName,
        eStartSalary,
        eUpSalary,
        eWorkPlace,
        eJobDescription,
        eBenefit,
        eRequirement,
      )
          .then((value) async {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Thêm tuyển dụng thành công", message: "");
        Get.offAll(() => const EnterpriseNav(
              page: 2,
            ));
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Thêm tuyển dụng thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
