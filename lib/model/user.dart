class UserCustomer {
  int? id;
  String? correlation;
  String? name;
  String? age;
  String? birthday;
  String? contact;
  String? description;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['correlation'] = correlation!;
    mapping['name'] = name!;
    mapping['age'] = age!;
    mapping['birthday'] = birthday!;
    mapping['contact'] = contact!;
    mapping['description'] = description!;
    return mapping;
  }
}
