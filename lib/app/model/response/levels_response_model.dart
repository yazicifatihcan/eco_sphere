import 'package:background_json_parser/background_json_parser.dart';

class LevelsResponseModel extends IBaseModel<LevelsResponseModel> {
    String? id;
    String? name;
    int? level;
    int? co2Amount;
    String? imageUrl;

    LevelsResponseModel({
        this.id,
        this.name,
        this.co2Amount,
        this.imageUrl,
        this.level,
    });


    @override
      Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "co2_amount": co2Amount,
        "image_url": imageUrl,
        "level": level,
    };
    
      @override
      LevelsResponseModel fromJson(Map<String, dynamic> json) =>LevelsResponseModel(
        id: json["id"],
        name: json["name"],
        co2Amount: json["co2_amount"],
        imageUrl: json["image_url"],
        level: json["level"],
    );
}
