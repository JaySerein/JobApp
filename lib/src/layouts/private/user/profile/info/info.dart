import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/images/rounded_image.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Thông tin cá nhân',
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
              SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const JRoundedImage(
                          imageUrl: JImages.companyAvatar,
                          width: 80,
                          height: 80,
                          borderRadius: 80),
                      TextButton(
                          onPressed: () {}, child: const Text('Đổi hình nền'))
                    ],
                  )),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Hồ sơ cá nhân"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                  name: 'Họ & Tên',
                  value: 'Nguyễn Quang Tuấn',
                  onPressed: () {}),
              JInfoItems(
                  name: 'Tên tài khoản',
                  value: 'jayserein27',
                  onPressed: () {}),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Thông tin cá nhân"),
              JInfoItems(
                  name: 'Email',
                  value: 'seanobita08@gmail.com',
                  onPressed: () {}),
              JInfoItems(
                  name: 'Số điện thoại', value: '0915975198', onPressed: () {}),
              JInfoItems(name: 'Giới tính', value: 'Nam', onPressed: () {}),
              JInfoItems(
                  name: 'Ngày sinh', value: '09/04/2002', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class JInfoItems extends StatelessWidget {
  const JInfoItems({
    super.key,
    required this.name,
    required this.value,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
  });

  final String name, value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: JSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(name,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              child: Icon(
                icon,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
