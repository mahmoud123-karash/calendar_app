class MessageModel {
  String? name;
  String? message;
  String? email;
  String? uid;

  MessageModel({
    this.email,
    this.name,
    this.message,
    this.uid,
  });

  MessageModel.fromjson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    message = json['message'];
    uid = json['uid'];
  }
  Map<String, dynamic> tomap() {
    return ({
      'name': name,
      'email': email,
      'message': message,
      'uid': uid,
    });
  }
}
