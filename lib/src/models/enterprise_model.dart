import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';

class EnterpriseModel {
  String id;
  User user = User(province: Province(), district: District());
  String enterpriseName;
  String taxCode;
  String activity;
  EnterpriseModel(
      {this.id = '',
      required this.user,
      this.enterpriseName = '',
      this.taxCode = '',
      this.activity = ''});
  factory EnterpriseModel.formJson(Map<String, dynamic> json) {
    return EnterpriseModel(
        id: json['_id'],
        user: User.fromJson(json['userID']),
        enterpriseName: json['enterpriseName'],
        taxCode: json['taxCode'],
        activity: json['activity']);
  }
}
