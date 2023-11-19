// To parse this JSON data, do
//
//     final productDetailedModel = productDetailedModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final productDetailedModel = productDetailedModelFromJson(jsonString);

import 'dart:convert';

import 'package:sprinkles/models/branch_model.dart';

ProductDetailedModel productDetailedModelFromJson(String str) => ProductDetailedModel.fromJson(json.decode(str));

String productDetailedModelToJson(ProductDetailedModel data) => json.encode(data.toJson());

class ProductDetailedModel {
  int? id;
  String? name;
  String? nameEn;
  String? desc;
  String? descEn;
  String? price;
  int? visitors;
  String? link;
  String? rating;
  List<String>? images;
  String? video;
  Ctg? ctg;
  Shop? shop;
  List<ItemFilter>? itemFilter;
  int? favorite;

  ProductDetailedModel({
    this.id,
    this.name,
    this.nameEn,
    this.desc,
    this.descEn,
    this.price,
    this.visitors,
    this.link,
    this.rating,
    this.images,
    this.video,
    this.ctg,
    this.shop,
    this.itemFilter,
    this.favorite,
  });

  factory ProductDetailedModel.fromJson(Map<String, dynamic> json) => ProductDetailedModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    desc: json["desc"],
    descEn: json["desc_en"],
    price: json["price"],
    visitors: json["visitors"],
    link: json["link"],
    rating: json["rating"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    video: json["video"],
    ctg: json["ctg"] == null ? null : Ctg.fromJson(json["ctg"]),
    shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
    itemFilter: json["item_filter"] == null ? [] : List<ItemFilter>.from(json["item_filter"]!.map((x) => ItemFilter.fromJson(x))),
    favorite: json["favorite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "desc": desc,
    "desc_en": descEn,
    "price": price,
    "visitors": visitors,
    "link": link,
    "rating": rating,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "video": video,
    "ctg": ctg?.toJson(),
    "shop": shop?.toJson(),
    "item_filter": itemFilter == null ? [] : List<dynamic>.from(itemFilter!.map((x) => x.toJson())),
    "favorite": favorite,
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

class ItemFilter {
  String? filter;
  String? filterEn;
  String? filterItem;
  String? filterItemEn;

  ItemFilter({
    this.filter,
    this.filterEn,
    this.filterItem,
    this.filterItemEn,
  });

  factory ItemFilter.fromJson(Map<String, dynamic> json) => ItemFilter(
    filter: json["filter"],
    filterEn: json["filter_en"],
    filterItem: json["filter_item"],
    filterItemEn: json["filter_item_en"],
  );

  Map<String, dynamic> toJson() => {
    "filter": filter,
    "filter_en": filterEn,
    "filter_item": filterItem,
    "filter_item_en": filterItemEn,
  };
}

class Shop {
  int? id;
  String? name;
  String? nameEn;
  String? phone;
  String? whatsapp;
  String? image;
  List<Branch>? branch;

  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.whatsapp,
    this.image,
    this.branch,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    image: json["image"],
    branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "phone": phone,
    "whatsapp": whatsapp,
    "image": image,
    "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
  };
}


