import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/interview_model.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';
import 'package:job_app/src/services/services.dart';

class InterviewController extends GetxController {
  final isLoading = false.obs;

  List<String> listTime = [
    '7:00 AM',
    '7:30 AM',
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
  ];

  String time = '';
  final date = TextEditingController();
  final place = TextEditingController();
  final room = TextEditingController();
  final interviewer = TextEditingController();
  final skin = TextEditingController();
  final doc = TextEditingController();
  final requirement = TextEditingController();

  InterviewModel interviewDetails = InterviewModel();
  PersonalProfileModel profile = PersonalProfileModel(
      category: Item(),
      skills: [],
      userID: User(province: Province(), district: District()));

  String jobSuccessID;
  InterviewController({required this.jobSuccessID});

  @override
  void onInit() async {
    await getInterviewDetails();
    super.onInit();
  }

  Future<void> getInterviewDetails() async {
    try {
      isLoading.value = true;
      await ApiServices().getInterviewDetails(jobSuccessID).then((value) {
        final data = value.data['InterviewDetails'];
        final profileData = value.data['profile'];
        if (data != null) {
          interviewDetails = InterviewModel.formJson(data);
          profile = PersonalProfileModel.formJson(profileData);
        }
      });
    } catch (e) {
      isLoading.value = false;
      JLoader.warningSnackBar(title: "Oh bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createInterview() async {
    try {
      isLoading.value = true;
      final iDate = date.text;
      final iTime = time;
      final iPlace = place.text;
      final iRoom = room.text;
      final iInterviewer = interviewer.text;
      final iSkin = skin.text;
      final iDoc = doc.text;
      final iRequirement = requirement.text;
      await ApiServices()
          .createInterview(
        jobSuccessID,
        iDate,
        iTime,
        iPlace,
        iRoom,
        iInterviewer,
        iSkin,
        iDoc,
        iRequirement,
      )
          .then((value) {
        JLoader.successSnackBar(
          title: "Hẹn lịch phỏng vấn thành công",
        );
      }).onError((error, stackTrace) {
        JLoader.warningSnackBar(
            title: "Hẹn lịch phỏng vấn thất bại", message: error.toString());
      });
    } catch (e) {
      isLoading.value = false;
      JLoader.errorSnackBar(title: "Oh bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
