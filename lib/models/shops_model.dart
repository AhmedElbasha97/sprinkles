// To parse this JSON data, do
//
//     final shopsModel = shopsModelFromJson(jsonString);

import 'dart:convert';

List<ShopsModel> shopsModelFromJson(String str) => List<ShopsModel>.from(json.decode(str).map((x) => ShopsModel.fromJson(x)));

String shopsModelToJson(List<ShopsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopsModel {
  int? id;
  String? name;
  String? nameEn;
  String? image;
  List<Ctg>? ctgs;

  ShopsModel({
    this.id,
    this.name,
    this.nameEn,
    this.image,
    this.ctgs,
  });

  factory ShopsModel.fromJson(Map<String, dynamic> json) => ShopsModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    image: json["image"],
    ctgs: json["ctgs"] == null ? [] : List<Ctg>.from(json["ctgs"]!.map((x) => Ctg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "image": image,
    "ctgs": ctgs == null ? [] : List<dynamic>.from(ctgs!.map((x) => x.toJson())),
  };
}

class Ctg {
  int? id;
  String? name;
  String? nameEn;

  Ctg({
    this.id,
    this.name,
    this.nameEn,
  });

  factory Ctg.fromJson(Map<String, dynamic> json) => Ctg(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
  };
}