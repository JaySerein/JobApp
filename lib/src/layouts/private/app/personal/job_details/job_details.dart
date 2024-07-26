import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/button/custom_btn.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/profile/profile_apply_description.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/personal/job_apply_controller.dart';
import 'package:job_app/src/layouts/private/app/personal/job_details/widgets/job_header.dart';
import 'package:job_app/src/models/job_model.dart';

class JJobDetails extends StatelessWidget {
  const JJobDetails({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Chi tiết tuyển dụng',
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
              JJobDetailHeader(job: job),
              const SizedBox(height: JSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Thông tin doanh nghiệp"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                name: 'Tên doanh nghiệp',
                value: job.enterprise.enterpriseName,
              ),
              JInfoItems(
                name: 'Mã số thuế',
                value: job.enterprise.taxCode,
              ),
              JInfoItems(
                name: 'Lĩnh vực hoạt động',
                value: job.enterprise.activity,
              ),
              JInfoItems(
                name: 'Địa chỉ',
                value:
                    "${job.enterprise.user.province.name} / ${job.enterprise.user.district.name}",
              ),
              const SizedBox(height: JSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Thông tin liên hệ"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                name: 'Email',
                value: job.enterprise.user.email,
              ),
              JInfoItems(
                name: 'Số điện thoại',
                value: job.enterprise.user.phone,
              ),
              // JInfoItems(
              //   name: 'Lĩnh vực hoạt động',
              //   value: ,
              // ),
              const SizedBox(height: JSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Thông tin tuyển dụng"),
              const SizedBox(height: JSizes.spaceBtwItems),
              JInfoItems(
                name: 'Ngành nghề',
                value: job.category.name,
              ),
              JInfoItems(
                name: 'Công việc',
                value: job.job,
              ),
              JInfoItems(
                name: 'Mức lương khởi điểm',
                value: job.startSalary,
              ),
              JInfoItems(
                name: 'Mức lương tối đa',
                value: job.upSalary,
              ),
              JInfoItems(
                name: 'Nơi làm việc',
                value: job.workPlace,
              ),
              const SizedBox(height: JSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              const JSectionHeading(title: "Yêu cầu kĩ năng"),
              const SizedBox(height: JSizes.spaceBtwItems),
              Wrap(
                children: job.skills
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(
                              right: JSizes.sm, bottom: JSizes.sm),
                          child: Chip(
                            label: Text(e.name),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: JSizes.spaceBtwItems),
              JProfileApplyDescription(
                  title: "Mô tả công việc", description: job.jobDescription),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              JProfileApplyDescription(
                  title: "Phúc lợi & thưởng", description: job.benefit),
              const SizedBox(height: JSizes.spaceBtwItems / 2),
              JProfileApplyDescription(
                  title: "Yêu cầu", description: job.requirement),
            ],
          ),
        ),
      ),
      floatingActionButton: JCustomFloatingButton(
          title: 'Ứng Tuyển',
          onPressed: () => JobApplyController().applyJob(
                job,
              )),
    );
  }
}
