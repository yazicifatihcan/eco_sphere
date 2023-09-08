import 'package:background_json_parser/background_json_parser.dart';

class AllLegalListResponseModel extends IBaseModel<AllLegalListResponseModel> {
    String? id;
    String? legalType;
    String? title;
    String? content;
    DateTime? createdAt;
    DateTime? updatedAt;

    AllLegalListResponseModel({
        this.id,
        this.legalType,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
    });
    
      @override
      AllLegalListResponseModel fromJson(Map<String, dynamic> json) =>AllLegalListResponseModel(
        id: json["id"],
        legalType: json["legalType"],
        title: json["title"],
        content: json["content"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
    
      @override
      Map<String, dynamic> toJson() {
    throw UnimplementedError();
      }
}
