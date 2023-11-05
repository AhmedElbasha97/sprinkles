import 'dart:convert';

List<OrderHistoryModel> orderHistoryModelFromJson(String str) => List<OrderHistoryModel>.from(json.decode(str).map((x) => OrderHistoryModel.fromJson(x)));

String orderHistoryModelToJson(List<OrderHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryModel {
  int? id;
  String? itemName;
  String? itemNameEn;
  String? img;
  String? shopName;
  String? shopNameEn;
  String? date;
  int? review;

  OrderHistoryModel({
    this.id,
    this.itemName,
    this.itemNameEn,
    this.img,
    this.shopName,
    this.shopNameEn,
    this.date,
    this.review,

  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
    id: json["id"],
    itemName: json["item_name"],
    itemNameEn: json["item_name_en"],
    img: json["img"],
    shopName: json["shop_name"],
    shopNameEn: json["shop_name_en"],
    date: json["date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_name": itemName,
    "item_name_en": itemNameEn,
    "img": img,
    "shop_name": shopName,
    "shop_name_en": shopNameEn,
    "date": date,
    "review": review,
  };
}
