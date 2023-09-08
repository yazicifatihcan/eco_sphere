import 'package:background_json_parser/background_json_parser.dart';

class FaqResponseModel extends IBaseModel<FaqResponseModel> {
    String? id;
    String? question;
    String? answer;
    DateTime? createdAt;
    DateTime? updatedAt;

    FaqResponseModel({
        this.id,
        this.question,
        this.answer,
        this.createdAt,
        this.updatedAt,
    });
    
      @override
      FaqResponseModel fromJson(Map<String, dynamic> json) =>FaqResponseModel(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}
