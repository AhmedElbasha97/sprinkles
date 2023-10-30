// To parse this JSON data, do
//
//     final mainCategoryTapModel = mainCategoryTapModelFromJson(jsonString);

import 'dart:convert';

List<MainCategoryTapModel> mainCategoryTapModelFromJson(String str) => List<MainCategoryTapModel>.from(json.decode(str).map((x) => MainCategoryTapModel.fromJson(x)));

String mainCategoryTapModelToJson(List<MainCategoryTapModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainCategoryTapModel {
  int? id;
  String? name;
  String? nameEn;
  String? img;
  String? img2;

  MainCategoryTapModel({
    this.id,
    this.name,
    this.nameEn,
    this.img,
    this.img2,

  });

  factory MainCategoryTapModel.fromJson(Map<String, dynamic> json) => MainCategoryTapModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    img: json["img"],
    img2: json["img2"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "img": img,
    "img2": img2,

  };
}
