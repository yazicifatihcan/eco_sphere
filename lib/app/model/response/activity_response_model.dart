import 'package:background_json_parser/background_json_parser.dart';

class AllActivitiesResponseModel extends IBaseModel<AllActivitiesResponseModel> {
  String? id;
  String? name;
  Category? category;
  String? imageUrl;
  int? dailyLimit;
  double? amount;

  AllActivitiesResponseModel({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.dailyLimit,
    this.amount
  });

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category?.toJson(),
        "image_url": imageUrl,
        "daily_limit": dailyLimit,
        "amount": amount,
      };

  @override
  AllActivitiesResponseModel fromJson(Map<String, dynamic> json) => AllActivitiesResponseModel(
        id: json["id"],
        name: json["name"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        imageUrl: json["image_url"],
        dailyLimit: json['daily_limit'],
        amount: json['amount']?.toDouble(),
      );
}

  class Category {
    String? id;
    String? name;

    Category({
      this.id,
      this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
          id: json["id"],
          name: json["name"],
        );

    Map<String, dynamic> toJson() => {
          "id": id,
          "name": name,
        };
  }
