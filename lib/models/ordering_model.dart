// To parse this JSON data, do
//
//     final orderingModel = orderingModelFromJson(jsonString);

import 'dart:convert';

OrderingModel orderingModelFromJson(String str) => OrderingModel.fromJson(json.decode(str));

String orderingModelToJson(OrderingModel data) => json.encode(data.toJson());

class OrderingModel {
  int? id;
  String? name;
  String? nameEn;
  List<String>? images;
  String? price;
  Ctg? ctg;
  Shop? shop;
  List<ItemFilter>? itemFilter;

  OrderingModel({
    this.id,
    this.name,
    this.nameEn,
    this.images,
    this.price,
    this.ctg,
    this.shop,
    this.itemFilter,
  });

  factory OrderingModel.fromJson(Map<String, dynamic> json) => OrderingModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    price: json["price"],
    ctg: json["ctg"] == null ? null : Ctg.fromJson(json["ctg"]),
    shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
    itemFilter: json["item_filter"] == null ? [] : List<ItemFilter>.from(json["item_filter"]!.map((x) => ItemFilter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "price": price,
    "ctg": ctg?.toJson(),
    "shop": shop?.toJson(),
    "item_filter": itemFilter == null ? [] : List<dynamic>.from(itemFilter!.map((x) => x.toJson())),
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
  List<Item>? items;

  ItemFilter({
    this.filter,
    this.filterEn,
    this.items,
  });

  factory ItemFilter.fromJson(Map<String, dynamic> json) => ItemFilter(
    filter: json["filter"],
    filterEn: json["filter_en"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter": filter,
    "filter_en": filterEn,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  String? filterItem;
  String? filterItemEn;

  Item({
    this.filterItem,
    this.filterItemEn,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    filterItem: json["filter_item"],
    filterItemEn: json["filter_item_en"],
  );

  Map<String, dynamic> toJson() => {
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

  Shop({
    this.id,
    this.name,
    this.nameEn,
    this.phone,
    this.whatsapp,
    this.image,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "phone": phone,
    "whatsapp": whatsapp,
    "image": image,
  };
}
