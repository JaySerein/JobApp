import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/images_text/vertical_image_text.dart';

class JHomeCategory extends StatelessWidget {
  const JHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return JVerticalImageText(
            image: JImages.categoryIT,
            title: 'Công Nghệ Thông Tin',
            onTap: () {},
          );
        },
      ),
    );
  }
}
