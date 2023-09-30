class UserModel {
  String? name;
  String? phone;
  String? email;
  String? uid;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.uid,
  });

  UserModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
  }
  Map<String, dynamic> tomap() {
    return ({
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
    });
  }
}
