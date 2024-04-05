import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/select/multi_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';

class UserCVScreen extends StatefulWidget {
  const UserCVScreen({super.key});

  @override
  State<UserCVScreen> createState() => _UserCVScreenState();
}

class _UserCVScreenState extends State<UserCVScreen> {
  List<String> selectedItems = [];
  void selected() async {
    List<String> options = [
      'Ngoại ngữ',
      'Tin học',
      'Thiết kế',
      'Thuyết trình',
      'Làm việc nhóm'
    ];
    final List<String>? result = await showDialog(
        context: context,
        builder: (context) {
          return MultiSelect(
            options: options,
            selectedItems: selectedItems,
          );
        });
    if (result != null) {
      setState(() {
        selectedItems = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Hồ sơ ứng tuyển',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const JSectionHeading(title: "Thông tin cá nhân"),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JInfoItems(
                name: 'Họ & Tên',
                value: 'Nguyễn Quang Tuấn',
                showIcon: false,
              ),
              const JInfoItems(
                name: 'Email',
                value: 'seanobita08@gmail.com',
                showIcon: false,
              ),
              const JInfoItems(
                name: 'Số điện thoại',
                value: '0915975198',
                showIcon: false,
              ),
              const JInfoItems(
                name: 'Giới tính',
                value: 'Nam',
                showIcon: false,
              ),
              const JInfoItems(
                name: 'Ngày sinh',
                value: '09/04/2002',
                showIcon: false,
              ),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Hồ sơ ứng tuyển"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                name: 'Chuyên ngành',
                value: 'Công nghệ thông tin',
                onPressed: () {},
              ),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              GestureDetector(
                onTap: selected,
                child: const JSectionHeadingWithIcon(
                  showActionButton: true,
                  icon: Iconsax.add_circle,
                  title: "Kỹ năng",
                  textColor: JColors.black,
                ),
              ),
              Wrap(
                children: selectedItems
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: JSizes.sm),
                          child: Chip(label: Text(e)),
                        ))
                    .toList(),
              ),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Nhu cầu tìm việc"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                name: 'Công việc',
                value: 'Lập trình viên',
                onPressed: () {},
              ),
              JInfoItems(
                name: 'Nơi làm việc',
                value: '123',
                onPressed: () {},
              ),
              JInfoItems(
                name: 'Chuyên ngành',
                value: 'Thu nhập',
                onPressed: () {},
              ),
              JInfoItems(
                name: 'Yêu cầu khác',
                value: 'Công nghệ thông tin',
                onPressed: () {},
              ),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Sở trường"),
              const SizedBox(height: JSizes.spaceBtwItems),
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
    this.onPressed,
    this.icon = Iconsax.arrow_right_34,
    this.showIcon = true,
  });

  final String name, value;
  final VoidCallback? onPressed;
  final IconData icon;
  final bool showIcon;

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
            showIcon
                ? Expanded(
                    child: Icon(
                      icon,
                      size: 18,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
