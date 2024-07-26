class Province {
  String id;
  String name;
  Province({this.id = '', this.name = ''});
  factory Province.formJson(Map<String, dynamic> json) {
    return Province(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
    );
  }
}

class District {
  String id;
  String name;
  String provinceID;
  District({this.id = '', this.name = '', this.provinceID = ''});
  factory District.formJson(Map<String, dynamic> json) {
    return District(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      provinceID: json['provinceId'] ?? "",
    );
  }
}
