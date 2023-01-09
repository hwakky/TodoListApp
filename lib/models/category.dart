class Category {
  int id;
  String name;
  String desciption;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;
    mapping['description'] = desciption;
    return mapping;
  }
}
