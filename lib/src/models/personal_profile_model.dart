import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';

class PersonalProfileModel {
  String id;
  User userID = User(province: Province(), district: District());
  Item category = Item();
  List<Item> skills = [];
  String language;
  String informatic;
  String job;
  String career;
  String salary;
  String experience;
  String strength;
  String requirement;
  bool active;
  PersonalProfileModel({
    this.id = '',
    required this.category,
    required this.skills,
    this.language = "",
    this.informatic = '',
    this.job = '',
    this.career = '',
    this.salary = '',
    this.experience = '',
    this.strength = '',
    this.requirement = '',
    this.active = true,
    required this.userID,
  });
  factory PersonalProfileModel.formJson(Map<String, dynamic> json) {
    List<Item> skills = [];
    Item category = Item();
    final data = json['skills'];
    for (var i in data) {
      Item item = Item.formJson(i);
      skills.add(item);
    }
    if (json['category'] != null) {
      category = Item.formJson(json['category']);
    }
    return PersonalProfileModel(
      id: json["_id"],
      userID: User.fromJson(json['userID']),
      category: category,
      skills: skills,
      language: json['language'] ?? "Không có",
      informatic: json['informatic'] ?? "Không có",
      job: json['job'],
      career: json['career'],
      salary: json['salary'],
      experience: json['experience'],
      strength: json['strength'],
      requirement: json['requirement'],
      active: json['active'],
    );
  }
}
