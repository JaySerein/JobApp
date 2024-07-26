import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';

class JDialog {
  static showDialog({required title, required subtitle, required onPressed}) {
    Get.dialog(Dialog(
      child: Container(
        width: 500,
        height: 250,
        decoration: BoxDecoration(
          color: JColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PopScope(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: JSizes.spaceBtwSections),
              Text(
                title,
                style: Theme.of(Get.context!).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: JSizes.spaceBtwItems,
              ),
              Text(
                subtitle,
                style: Theme.of(Get.context!).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: JSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: JSizes.defaultSpace, vertical: JSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Huỷ')),
                    ),
                    const SizedBox(
                      width: JSizes.spaceBtwItems,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: onPressed,
                            child: const Text("Chấp nhận")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
    // Get.defaultDialog(
    //   title: title,
    //   content: Text(message),
    //   backgroundColor: JColors.white,
    //   radius: 10,
    //   actions: [
    //     SizedBox(
    //         width: 100,
    //         child: OutlinedButton(onPressed: () {}, child: const Text("Huỷ"))),
    //     SizedBox(
    //         width: 100,
    //         child: ElevatedButton(
    //             onPressed: () {}, child: const Text("Xác nhận"))),
    //   ],
    // );
  }
}
