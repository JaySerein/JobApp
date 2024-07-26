class Item {
  String id;
  String name;
  Item({this.id = "", this.name = ""});
  factory Item.formJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['Name'],
    );
  }
}
