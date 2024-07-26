import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/custom_shape/info_item.dart';
import 'package:job_app/src/components/widgets/profile/profile_apply_description.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/interview_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/interview/widgets/interview_form.dart';

class JInterviewDetails extends StatelessWidget {
  const JInterviewDetails(
      {super.key,
      required this.profileID,
      required this.job,
      required this.jobSuccessID});

  final String profileID;
  final String job;
  final String jobSuccessID;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InterviewController(jobSuccessID: jobSuccessID));
    return Scaffold(
      appBar: JAppBar(
        title: Text('Lịch phỏng vấn',
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
              if (controller.isLoading.value == true) return Container();
              if (controller.interviewDetails.id == '') {
                return Center(
                  child: Column(
                    children: [
                      Text("Chưa có lịch phỏng vấn",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                                color: JColors.error,
                              )),
                      const SizedBox(
                        height: JSizes.defaultSpace,
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                            onPressed: () => Get.to(() => InterviewCreate(
                                  jobSuccessID: jobSuccessID,
                                )),
                            child: const Text('Hẹn lịch phỏng vấn')),
                      )
                    ],
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const JSectionHeading(title: "Thông tin ứng viên"),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    JInfoItems(
                      name: 'Họ & Tên',
                      value: controller.profile.userID.fullname,
                    ),
                    JInfoItems(
                      name: 'Email',
                      value: controller.profile.userID.email,
                    ),
                    JInfoItems(
                      name: 'Số điện thoại',
                      value: controller.profile.userID.phone,
                    ),
                    JInfoItems(
                      name: 'Ngày sinh',
                      value: controller.profile.userID.birthday,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const JSectionHeading(title: "Lịch phỏng vấn"),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    JInfoItems(
                      name: 'Ngày phỏng vấn',
                      value: controller.interviewDetails.date,
                    ),
                    JInfoItems(
                      name: 'Giờ phỏng vấn',
                      value: controller.interviewDetails.time,
                    ),
                    JInfoItems(
                      name: 'Địa điểm',
                      value: controller.interviewDetails.place,
                    ),
                    JInfoItems(
                      name: 'Phòng',
                      value: controller.interviewDetails.room,
                    ),
                    JInfoItems(
                      name: 'Người phụ trách',
                      value: controller.interviewDetails.interviewer,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JProfileApplyDescription(
                      title: "Yêu cầu trang phục",
                      description: controller.interviewDetails.skin,
                      isEnble: true,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JProfileApplyDescription(
                      title: "Yêu cầu giấy tờ",
                      description: controller.interviewDetails.doc,
                      isEnble: true,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: JSizes.spaceBtwItems / 2),
                    JProfileApplyDescription(
                      title: "Lưu ý (nếu có )",
                      description: controller.interviewDetails.requirement,
                      isEnble: true,
                    ),
                    const SizedBox(height: JSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: JSizes.spaceBtwSections),
                    // Center(
                    //   child: OutlinedButton(
                    //       onPressed: () {},
                    //       child: const Text('Thay đổi lịch phỏng vấn')),
                    // )
                  ],
                );
              }
            })),
      ),
    );
  }
}
