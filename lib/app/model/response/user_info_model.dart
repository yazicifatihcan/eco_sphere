import 'activity_response_model.dart';

class UserInfoModel {
    UserInfoModel({
        this.profileImageUrl,
        this.dateCreated,
        this.fcmToken,
        this.email,
        this.uuid,
        this.isBanned,
        this.wallet,
        this.signUpWay,
        this.savedCo2,
        this.userActivities,
    });
    String? profileImageUrl;
    String? dateCreated;
    String? fcmToken;
    String? email;
    String? uuid;
    bool? isBanned;
    String? wallet;
    String? signUpWay;
    double? savedCo2;
    List<UserActivity>? userActivities;



    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        profileImageUrl: json["profile_image_url"],
        dateCreated: json["date_created"],
        fcmToken: json["fcm_token"],
        email: json["email"],
        uuid: json["uuid"],
        isBanned: json['is_banned'],
        wallet: json['wallet'],
        signUpWay: json['sign_up_way'],
        savedCo2: json['saved_co2'],
        userActivities: json["user_activities"] == null
            ? []
            : List<UserActivity>.from(json["user_activities"]!.map((x) => UserActivity().fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "profile_image_url": profileImageUrl,
        "date_created": dateCreated,
        "fcm_token": fcmToken,
        "email": email,
        "uuid": uuid,
        "is_banned":isBanned,
        'wallet':wallet,
        'sign_up_way':signUpWay,
        'saved_co2':savedCo2,
        "user_activities":
            userActivities == null ? [] : List<dynamic>.from(userActivities!.map((x) => x.toJson())),
    };
}


class UserActivity {
  String? id;
  String? name;
  Category? category;
  String? unit;
  double? amountSavedByUnit;
  String? imageUrl;
  DateTime? dateCreated;

  UserActivity({
    this.id,
    this.name,
    this.category,
    this.unit,
    this.amountSavedByUnit,
    this.imageUrl,
    this.dateCreated,
  });

  
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category?.toJson(),
        "unit": unit,
        "amount_saved_by_unit": amountSavedByUnit,
        "image_url": imageUrl,
        "date_created": dateCreated.toString(),
      };

  
  UserActivity fromJson(Map<String, dynamic> json) => UserActivity(
        id: json["id"],
        name: json["name"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        unit: json["unit"],
        amountSavedByUnit: json["amount_saved_by_unit"]?.toDouble(),
        imageUrl: json["image_url"],
        dateCreated: json["date_created"],
      );
}
