import 'package:background_json_parser/background_json_parser.dart';
import 'package:flutter_base_project/app/model/response/activity_response_model.dart';

class UserActivityResponseModel extends IBaseModel<UserActivityResponseModel> {
  String? ownerId;
  DateTime? createDate;
  AllActivitiesResponseModel? activity;

  UserActivityResponseModel({
    this.activity,
    this.createDate,
    this.ownerId,
  });

  @override
  Map<String, dynamic> toJson() => {
        'activity':activity?.toJson(),
        'owner_id':ownerId,
        "create_date": createDate?.toIso8601String(),
      };

  @override
  UserActivityResponseModel fromJson(Map<String, dynamic> json) => UserActivityResponseModel(
        activity: json["activity"] == null ? null : AllActivitiesResponseModel().fromJson(json["activity"]),
        createDate: json["create_date"] == null ? null : DateTime.parse(json["create_date"]),
        ownerId: json['owner_id'],
      );
}

