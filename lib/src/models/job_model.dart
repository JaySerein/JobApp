import 'package:job_app/src/models/enterprise_model.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';

class JobModel {
  String id;
  EnterpriseModel enterprise =
      EnterpriseModel(user: User(province: Province(), district: District()));
  String job;
  Item category = Item();
  List<Item> skills = [];
  String startSalary;
  String upSalary;
  String workPlace;
  String jobDescription;
  String benefit;
  String requirement;
  bool isOpen;
  int applyCount;
  JobModel(
      {this.id = '',
      required this.enterprise,
      this.job = "",
      required this.category,
      required this.skills,
      this.startSalary = '',
      this.upSalary = '',
      this.workPlace = '',
      this.jobDescription = '',
      this.benefit = '',
      this.requirement = '',
      this.isOpen = true,
      this.applyCount = 0});
  factory JobModel.formJson(Map<String, dynamic> json) {
    List<Item> list = [];
    Item category = Item();
    final data = json['skills'];
    for (var i in data) {
      Item item = Item.formJson(i);
      list.add(item);
    }
    if (json['category'] != null) {
      category = Item.formJson(json['category']);
    }
    return JobModel(
        id: json['_id'],
        enterprise: EnterpriseModel.formJson(json['enterpriseID']),
        job: json['job'],
        category: category,
        skills: list,
        startSalary: json['startSalary'],
        upSalary: json['upSalary'],
        workPlace: json['workPlace'],
        jobDescription: json['jobDescription'],
        benefit: json['benefit'],
        requirement: json['requirement'],
        isOpen: json['isOpen'],
        applyCount: json['applyCount']);
  }
}
