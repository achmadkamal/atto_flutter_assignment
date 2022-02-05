import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  int? qty;

  ProductModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
    this.qty = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
