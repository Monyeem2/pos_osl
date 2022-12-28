// To parse this JSON data, do
//
//     final foodCategory = foodCategoryFromJson(jsonString);

import 'dart:convert';

List<FoodCategory> foodCategoryFromJson(String str) => List<FoodCategory>.from(json.decode(str).map((x) => FoodCategory.fromJson(x)));

String foodCategoryToJson(List<FoodCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodCategory {
  FoodCategory({
    this.xcitem,
  });

  String? xcitem;

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
    xcitem: json["xcitem"] == null ? null : json["xcitem"],
  );

  Map<String, dynamic> toJson() => {
    "xcitem": xcitem == null ? null : xcitem,
  };
}
