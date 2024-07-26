import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/user.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/personal/personal_nav.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/services/services.dart';

class PersonalAccountUpdateController extends GetxController {
  final user = Get.put(JUser());

  final isLoading = false.obs;
  final fullname = TextEditingController();
  final birthday = TextEditingController().obs;
  final phone = TextEditingController();
  final province = TextEditingController().obs;
  final district = TextEditingController().obs;
  String provinceID = '';
  String districtID = '';
  final gender = TextEditingController().obs;

  RxList<Province> listProvince = <Province>[].obs;
  RxList<District> listDistrict = <District>[].obs;
  final List<String> genderItems = [
    'Nam',
    'Nữ',
  ];

  @override
  void onInit() async {
    super.onInit();
    await getProvince();
    fullname.text = user.currentUser.fullname;
    birthday.value.text = user.currentUser.birthday;
    phone.text = user.currentUser.phone;
    province.value.text = user.currentUser.province.name;
    provinceID = user.currentUser.province.id;
    district.value.text = user.currentUser.district.name;
    districtID = user.currentUser.district.id;
    gender.value.text = user.currentUser.gender;
    if (provinceID != '') {
      await getDistrict();
    }
  }

  Future<void> getProvince() async {
    var response = await ApiServices().getProvince();
    var data = response.data['listProvince'];
    for (var item in data) {
      var province = Province.formJson(item);
      listProvince.add(province);
    }
  }

  Future<void> getDistrict() async {
    var response = await ApiServices().getDistrict(provinceID);
    listDistrict.clear();
    var data = response.data['listDistrict'];
    for (var item in data) {
      var district = District.formJson(item);
      listDistrict.add(district);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: JColors.primary),
            ),
            child: child!);
      },
    );
    if (date != null) {
      final formatDate = DateFormat('dd/MM/yyyy').format(date);
      birthday.value.text = formatDate.toString().split(" ")[0];
    }
  }

  Future<dynamic> selectGender(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn giới tính"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách giới tính");
                      }
                      return JListCard(
                          itemCount: genderItems.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () {
                                  try {
                                    isLoading.value = true;
                                    gender.value.text = genderItems[index];
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  Get.back();
                                },
                                isChose: gender.value.text == genderItems[index]
                                    ? true
                                    : false,
                                title: genderItems[index],
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

  Future<dynamic> selectProvince(BuildContext context) {
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
                          itemCount: listProvince.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () async {
                                  try {
                                    isLoading.value = true;
                                    province.value.text =
                                        listProvince[index].name;
                                    provinceID = listProvince[index].id;
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  await getDistrict();
                                  district.value.text = listDistrict.first.name;
                                  districtID = listDistrict.first.id;
                                  Get.back();
                                },
                                isChose: province.value.text ==
                                        listProvince[index].name
                                    ? true
                                    : false,
                                title: listProvince[index].name,
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

  Future<dynamic> selectDistrict(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn quận/ huyện"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách quận/ huyện");
                      }
                      if (listDistrict.isEmpty) {
                        return const Text(
                            "Chưa danh sách quận/ huyện! Vui lòng chọn tỉnh thành phố để lây danh sách");
                      }
                      return JListCard(
                          itemCount: listDistrict.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () {
                                  try {
                                    isLoading.value = true;
                                    district.value.text =
                                        listDistrict[index].name;
                                    districtID = listDistrict[index].id;
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  Get.back();
                                },
                                isChose: district.value.text ==
                                        listDistrict[index].name
                                    ? true
                                    : false,
                                title: listDistrict[index].name,
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

  void updateAccountInfo() async {
    try {
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      if (gender.value.text == '') {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(title: "Vui lòng chọn giới tính");
        return;
      }
      if (provinceID == '' || districtID == '') {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(title: "Vui lòng chọn địa chỉ");
        return;
      }

      final userFullname = fullname.text;
      final userBirthday = birthday.value.text;
      final userPhone = phone.text;
      final userGender = gender.value.text;
      await ApiServices()
          .updateAccountInfo(userFullname, userBirthday, userPhone, userGender,
              provinceID, districtID)
          .then((value) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(title: "Cập nhật thông tin thành công");
        final userData = value.data['user'];
        GetStorage().write("user", userData);
        Get.offAll(() => const PersonalNav(page: 4));
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Cập nhật thông tin thất bại", message: error.toString());
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
