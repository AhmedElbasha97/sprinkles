// To parse this JSON data, do
//
//     final productDetailedModel = productDetailedModelFromJson(jsonString);

import 'dart:convert';

ProductDetailedModel productDetailedModelFromJson(String str) => ProductDetailedModel.fromJson(json.decode(str));

String productDetailedModelToJson(ProductDetailedModel data) => json.encode(data.toJson());

class ProductDetailedModel {
  int? id;
  String? name;
  String? nameEn;
  String? desc;
  String? descEn;
  String? price;
  List<String>? images;
  Ctg? ctg;
  Ctg? shop;

  ProductDetailedModel({
    this.id,
    this.name,
    this.nameEn,
    this.desc,
    this.descEn,
    this.price,
    this.images,
    this.ctg,
    this.shop,
  });

  factory ProductDetailedModel.fromJson(Map<String, dynamic> json) => ProductDetailedModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
    price: json["price"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    ctg: json["ctg"] == null ? null : Ctg.fromJson(json["ctg"]),
    shop: json["shop"] == null ? null : Ctg.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "desc": desc,
    "desc_en": descEn,
    "price": price,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "ctg": ctg?.toJson(),
    "shop": shop?.toJson(),
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
