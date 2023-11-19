// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

import 'package:sprinkles/models/branch_model.dart';

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
  String? rating;
  Shop? shop;
  String? link;
  int? favorite;

  ProductsModel({
    this.id,
    this.name,
    this.nameEn,
    this.desc,
    this.descEn,
    this.price,
    this.persons,
    this.images,
    this.rating,
    this.shop,
    this.link,
    this.favorite,
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
    rating: json["rating"],
    shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
    link: json["link"],
    favorite: json["favorite"],
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
    "rating": rating,
    "shop": shop?.toJson(),
    "link": link,
    "favorite": favorite,
  };
}

class Shop {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? whatsapp;
  List<Branch>? branch;

  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.whatsapp,
    this.branch,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name":name,
    "name_en": nameEn,
    "phone": phone,
    "whatsapp": whatsapp,
    "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
  };
}



