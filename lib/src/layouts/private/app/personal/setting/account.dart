import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/controllers/avatar_controller.dart';
import 'package:job_app/src/controllers/user.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/widgets/account_form.dart';
import 'package:job_app/src/layouts/private/app/personal/setting/widgets/account_info.dart';
import 'package:job_app/src/utils/helpers/device_func.dart';

// ignore: must_be_immutable
class PersonalAccount extends StatelessWidget {
  PersonalAccount({super.key});

  XFile? images;

  final isChange = false.obs;
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final user = Get.put(JUser());
    final controller = Get.put(AvatarController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Thông tin tài khoản',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (isLoading.value == false) {
                  return SizedBox(
                      width: double.infinity,
                      child: isChange.value == true && images != null
                          ? Column(
                              children: [
                                JImageFile(
                                    imageUrl: images!,
                                    width: 80,
                                    height: 80,
                                    borderRadius: 80),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          try {
                                            isLoading.value = true;
                                            images = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            if (images != null) {
                                              isChange.value = true;
                                            } else {
                                              isChange.value = false;
                                            }
                                          } catch (e) {
                                            isLoading.value = false;
                                            JLoader.warningSnackBar(
                                                title: "Oh! bug",
                                                message: e.toString());
                                          } finally {
                                            isLoading.value = false;
                                          }
                                        },
                                        child: const Text('Đổi ảnh đại diện')),
                                    TextButton(
                                        onPressed: () {
                                          controller.saveAvatar(images!);
                                        },
                                        child: const Text('Lưu ảnh đại diện'))
                                  ],
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                JRoundedImage(
                                    imageUrl: user.currentUser.userImage,
                                    isNetworkImage: true,
                                    width: 80,
                                    height: 80,
                                    borderRadius: 80),
                                TextButton(
                                    onPressed: () async {
                                      try {
                                        images = await ImagePicker().pickImage(
                                            source: ImageSource.gallery);
                                        if (images != null) {
                                          isChange.value = true;
                                        } else {
                                          isChange.value = false;
                                        }
                                      } catch (e) {
                                        JLoader.warningSnackBar(
                                            title: "Oh! bug",
                                            message: e.toString());
                                      }
                                    },
                                    child: const Text('Đổi ảnh đại diện'))
                              ],
                            ));
                }
                return SizedBox(
                    width: double.infinity,
                    child: isChange.value == true && images != null
                        ? Column(
                            children: [
                              JImageFile(
                                  imageUrl: images!,
                                  width: 80,
                                  height: 80,
                                  borderRadius: 80),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        try {
                                          isLoading.value = true;
                                          images = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          isChange.value = true;
                                        } catch (e) {
                                          isLoading.value = false;
                                          JLoader.warningSnackBar(
                                              title: "Oh! bug",
                                              message: e.toString());
                                        } finally {
                                          isLoading.value = false;
                                        }
                                      },
                                      child: const Text('Đổi ảnh đại diện')),
                                  TextButton(
                                      onPressed: () =>
                                          controller.saveAvatar(images!),
                                      child: const Text('Lưu ảnh đại diện'))
                                ],
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              JRoundedImage(
                                  imageUrl: user.currentUser.userImage,
                                  isNetworkImage: true,
                                  width: 80,
                                  height: 80,
                                  borderRadius: 80),
                              TextButton(
                                  onPressed: () async {
                                    try {
                                      images = await ImagePicker().pickImage(
                                          source: ImageSource.gallery);
                                      isChange.value = true;
                                    } catch (e) {
                                      JLoader.warningSnackBar(
                                          title: "Oh! bug",
                                          message: e.toString());
                                    }
                                  },
                                  child: const Text('Đổi ảnh đại diện'))
                            ],
                          ));
              }),
              AccountInfo(user: user.currentUser),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
              width:
                  JDevice.getScreenWidth(context) / 2 - JSizes.spaceBtwSections,
              child: OutlinedButton(
                  onPressed: () {}, child: const Text('Đổi mật khẩu'))),
          SizedBox(
              width:
                  JDevice.getScreenWidth(context) / 2 - JSizes.spaceBtwSections,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PersonalAccountUpdate());
                  },
                  child: const Text("Cập nhật thông tin"))),
        ]),
      ),
    );
  }
}
