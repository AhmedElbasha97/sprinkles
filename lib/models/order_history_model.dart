import 'dart:convert';

List<OrderHistoryModel> orderHistoryModelFromJson(String str) => List<OrderHistoryModel>.from(json.decode(str).map((x) => OrderHistoryModel.fromJson(x)));

String orderHistoryModelToJson(List<OrderHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderHistoryModel {
  int? id;
  String? itemName;
  String? itemNameEn;
  String? date;

  OrderHistoryModel({
    this.id,
    this.itemName,
    this.itemNameEn,
    this.date,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
    id: json["id"],
    itemName: json["item_name"],
    itemNameEn: json["item_name_en"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_name": itemName,
    "item_name_en": itemNameEn,
    "date": date,
  };
}
