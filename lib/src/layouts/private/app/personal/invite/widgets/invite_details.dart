import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/button/custom_btn.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/loader/pop_up_dialog.dart';
import 'package:job_app/src/components/widgets/profile/profile_apply_description.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/job_service.dart';
import 'package:job_app/src/controllers/personal/job_apply_controller.dart';
import 'package:job_app/src/controllers/personal/single_job_controller.dart';
import 'package:job_app/src/layouts/private/app/personal/job_details/widgets/job_header.dart';
import 'package:job_app/src/models/job_invite_model.dart';
import 'package:job_app/src/models/job_model.dart';

class JInviteDetails extends StatelessWidget {
  const JInviteDetails({super.key, required this.invite});

  final JobInviteModel invite;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SingleJobController(jobID: invite.jobID));
    final jobService = Get.put(JobService());
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
          child: Obx(() {
            if (controller.isloading.value == true) {
              return Container();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                JJobDetailHeader(job: controller.job),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Thông tin doanh nghiệp"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Tên doanh nghiệp',
                  value: controller.job.enterprise.enterpriseName,
                ),
                JInfoItems(
                  name: 'Mã số thuế',
                  value: controller.job.enterprise.taxCode,
                ),
                JInfoItems(
                  name: 'Lĩnh vực hoạt động',
                  value: controller.job.enterprise.activity,
                ),
                JInfoItems(
                  name: 'Địa chỉ',
                  value:
                      "${controller.job.enterprise.user.province.name} / ${controller.job.enterprise.user.district.name}",
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Thông tin liên hệ"),
                const SizedBox(height: JSizes.spaceBtwItems),
                JInfoItems(
                  name: 'Email',
                  value: controller.job.enterprise.user.email,
                ),
                JInfoItems(
                  name: 'Số điện thoại',
                  value: controller.job.enterprise.user.phone,
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
                  value: controller.job.category.name,
                ),
                JInfoItems(
                  name: 'Công việc',
                  value: controller.job.job,
                ),
                JInfoItems(
                  name: 'Mức lương khởi điểm',
                  value: controller.job.startSalary,
                ),
                JInfoItems(
                  name: 'Mức lương tối đa',
                  value: controller.job.upSalary,
                ),
                JInfoItems(
                  name: 'Nơi làm việc',
                  value: controller.job.workPlace,
                ),
                const SizedBox(height: JSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: JSizes.spaceBtwItems),
                const JSectionHeading(title: "Yêu cầu kĩ năng"),
                const SizedBox(height: JSizes.spaceBtwItems),
                Wrap(
                  children: controller.job.skills
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
                    title: "Mô tả công việc",
                    description: controller.job.jobDescription),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JProfileApplyDescription(
                    title: "Phúc lợi & thưởng",
                    description: controller.job.benefit),
                const SizedBox(height: JSizes.spaceBtwItems / 2),
                JProfileApplyDescription(
                    title: "Yêu cầu", description: controller.job.requirement),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () => JDialog.showDialog(
                          title: "Từ chối ứng tuyển",
                          subtitle:
                              "Bạn chắc chắn muốn từ chối đơn ứng tuyển này?",
                          onPressed: () => jobService.denyInvite(invite.id),
                        ),
                    child: const Text('Từ chối')),
              ),
              const SizedBox(
                width: JSizes.spaceBtwItems / 2,
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () => JDialog.showDialog(
                        title: "Chấp nhận tuyển dụng",
                        subtitle:
                            "Bạn có chắc chắn muốn chấp nhận đơn ứng tuyển này?",
                        onPressed: () => jobService.acceptInvite(invite.id)),
                    child: const Text('Chấp nhận')),
              ),
            ],
          )),
    );
  }
}
