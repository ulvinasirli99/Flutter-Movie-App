import 'dart:math';

int randomUID = Random().nextInt(5000);

class AuthModel {
  String ?uid;
  String? userName;
  String? photoUrl;
  String? email;
  String? phone;

  AuthModel({
    this.uid,
    this.userName,
    this.photoUrl,
    this.email,
    this.phone,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    photoUrl = json['photoUrl'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid ?? randomUID.toString();
    data['userName'] = this.userName ?? "null";
    data['photoUrl'] = this.photoUrl ?? "null";
    data['email'] = this.email ?? "null";
    data['phone'] = this.phone ?? "null";
    return data;
  }
}
