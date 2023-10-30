import 'dart:convert';

List<CommentModel> commentModelFromJson(String str) => List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelToJson(List<CommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  String? name;
  String? review;
  double? shopRate;
  double? itemRate;
  DateTime? datetime;

  CommentModel({
    this.name,
    this.review,
    this.shopRate,
    this.itemRate,
    this.datetime,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    name: json["name"],
    review: json["review"],
    shopRate: json["shop_rate"],
    itemRate: json["item_rate"]?.toDouble(),
    datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "shop_rate": shopRate,
    "item_rate": itemRate,
    "datetime": datetime?.toIso8601String(),
  };
}
