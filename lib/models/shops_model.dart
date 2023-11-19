// To parse this JSON data, do
//
//     final shopsModel = shopsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final shopsModel = shopsModelFromJson(jsonString);

import 'dart:convert';

import 'package:sprinkles/models/branch_model.dart';

List<ShopsModel> shopsModelFromJson(String str) => List<ShopsModel>.from(json.decode(str).map((x) => ShopsModel.fromJson(x)));

String shopsModelToJson(List<ShopsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopsModel {
  int? id;
  String? name;
  String? nameEn;
  String? desc;
  String? descEn;
  String? phone;
  String? whatsapp;
  String? rating;
  String? image;
  int? favorite;
  List<Branch>? branch;

  ShopsModel({
    this.id,
    this.name,
    this.nameEn,
    this.desc,
    this.descEn,
    this.phone,
    this.whatsapp,
    this.rating,
    this.image,
    this.favorite,
    this.branch,
  });

  factory ShopsModel.fromJson(Map<String, dynamic> json) => ShopsModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    rating: json["rating"],
    image: json["image"],
    favorite: json["favorite"],
    branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "desc": desc,
    "desc_en": descEn,
    "phone": phone,
    "whatsapp": whatsapp,
    "rating": rating,
    "image": image,
    "favorite": favorite,
    "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
  };
}


