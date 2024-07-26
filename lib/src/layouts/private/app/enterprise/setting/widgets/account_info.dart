import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/models/user_model.dart';

class EAccountInfo extends StatelessWidget {
  const EAccountInfo({
    super.key,
    required this.user,
  });
  final User user;

  @override
  Widget build(BuildContext context) {
    bool isRole = true;
    if (user.role == 'personal') {
      isRole = true;
    } else {
      isRole = false;
    }
    return Column(
      children: [
        const SizedBox(height: JSizes.spaceBtwItems / 2),
        const Divider(),
        const SizedBox(height: JSizes.spaceBtwItems),
        const JSectionHeading(title: "Thông tin tài khoản"),
        const SizedBox(height: JSizes.spaceBtwItems),
        JInfoItems(name: 'Họ & Tên:', value: user.fullname),
        JInfoItems(name: 'Email:', value: user.email),
        const SizedBox(height: JSizes.spaceBtwItems / 2),
        const Divider(),
        const SizedBox(height: JSizes.spaceBtwItems),
        const JSectionHeading(title: "Thông tin cá nhân"),
        JInfoItems(name: 'Số điện thoại:', value: user.phone),
        JInfoItems(name: 'Giới tính:', value: user.gender),
        JInfoItems(name: 'Ngày sinh:', value: user.birthday),
        JInfoItems(
          name: 'Địa chỉ:',
          value: "${user.province.name}/ ${user.district.name}",
        ),
        JInfoItems(
          name: 'Vai trò:',
          value: isRole ? "Cá nhân" : " Doanh nghiệp",
        ),
      ],
    );
  }
}
