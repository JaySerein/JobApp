import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/circular_container.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/layouts/private/user/controllers/home_controller.dart';

class JSlider extends StatelessWidget {
  const JSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((url) => JRoundedImage(
                      imageUrl: url,
                      fit: BoxFit.contain,
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            )),
        const SizedBox(
          height: JSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  JCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.carouselCurrentIndex.value == i
                              ? JColors.primary
                              : JColors.grey),
              ],
            ),
          ),
        )
      ],
    );
  }
}
