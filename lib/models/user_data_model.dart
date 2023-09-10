// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) => List<UserDataModel>.from(json.decode(str).map((x) => UserDataModel.fromJson(x)));

String userDataModelToJson(List<UserDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;

  UserDataModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
  };
}
