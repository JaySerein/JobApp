import 'package:job_app/src/models/place_model.dart';

class User {
  String id;
  String fullname;
  String email;
  String phone;
  bool verified;
  String role;
  String userImage;
  String gender;
  String birthday;
  Province province = Province();
  District district = District();
  User({
    this.id = "",
    this.fullname = "",
    this.email = "",
    this.phone = "",
    this.verified = false,
    this.role = "",
    this.userImage = "",
    this.gender = "",
    this.birthday = "",
    required this.province,
    required this.district,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    final image = json['userImage'];
    Province userProvince = Province();
    District userDistrict = District();
    if (json['province'] != null) {
      userProvince = Province.formJson(json['province']);
    }
    if (json['district'] != null) {
      userDistrict = District.formJson(json['district']);
    }
    return User(
      id: json['_id'],
      fullname: json['fullname'],
      email: json['email'],
      phone: json['phone'] ?? "trống",
      verified: json['verified'] ?? false,
      role: json['role'],
      userImage: image['imageUrl'] ?? "",
      gender: json['gender'] ?? "trống",
      birthday: json['birthday'] ?? "trống",
      province: userProvince,
      district: userDistrict,
    );
  }
}
