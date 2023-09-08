import 'package:background_json_parser/background_json_parser.dart';

class DailyTasksResponseModel extends IBaseModel<DailyTasksResponseModel> {
    String? title;
    String? content;
    String? savedCo2;

    DailyTasksResponseModel({
        this.title,
        this.content,
        this.savedCo2
    });
    
      @override
      DailyTasksResponseModel fromJson(Map<String, dynamic> json) =>DailyTasksResponseModel(
        title: json["title"],
        content: json["content"],
        savedCo2: json["amount_saved_co2"],
    );
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}
