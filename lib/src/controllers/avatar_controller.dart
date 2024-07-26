import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/layouts/private/app/enterprise/enterprise_nav.dart';
import 'package:job_app/src/layouts/private/app/personal/personal_nav.dart';
import 'package:job_app/src/services/services.dart';
import 'package:image/image.dart' as img;

class AvatarController extends GetxController {
  Future<void> saveAvatar(XFile image) async {
    try {
      JLoading.openLoadingDialog('', JImages.isloading);
      final img.Image originalImage =
          img.decodeImage(File(image.path).readAsBytesSync())!;
      final img.Image resizedImage =
          img.copyResize(originalImage, width: 320, height: 320);

      final File resizedFile =
          File(image.path.replaceAll('.jpg', 'resized.jpg'))
            ..writeAsBytesSync(img.encodeJpg(resizedImage));
      await ApiServices().changeAvatar(resizedFile).then((value) {
        final userData = value.data['user'];
        final role = userData['role'];
        GetStorage().write("user", userData);
        Get.deleteAll();
        JLoading.closeLoading();
        if (role == 'personal') {
          Get.to(() => const PersonalNav(
                page: 4,
              ));
        } else if (role == 'enterprise') {
          Get.to(() => const EnterpriseNav(
                page: 4,
              ));
        }
        JLoader.successSnackBar(
          title: "Đổi ảnh đại diện thành công",
        );
      }).onError((error, stackTrace) {
        JLoading.closeLoading();
      });
    } catch (e) {
      JLoading.closeLoading();
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }
}
