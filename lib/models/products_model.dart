/// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  int? id;
  String? name;
  String? nameEn;
  String? desc;
  String? descEn;
  String? price;
  int? persons;
  List<String>? images;
  Ctg? ctg;
  Shop? shop;

  ProductsModel({
    this.id,
    this.name,
    this.nameEn,
    this.desc,
    this.descEn,
    this.price,
    this.persons,
    this.images,
    this.ctg,
    this.shop,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
    price: json["price"],
    persons: json["persons"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    ctg: json["ctg"] == null ? null : Ctg.fromJson(json["ctg"]),
    shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "desc": desc,
    "desc_en": descEn,
    "price": price,
    "persons": persons,
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

class Shop {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? whatsapp;

  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.whatsapp,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "phone": phone,
    "whatsapp": whatsapp,
  };
}
