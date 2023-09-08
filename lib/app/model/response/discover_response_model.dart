import 'package:background_json_parser/background_json_parser.dart';

class DiscoverResponseModel extends IBaseModel<DiscoverResponseModel> {
    String? title;
    String? content;

    DiscoverResponseModel({
        this.title,
        this.content,
    });
    
      @override
      DiscoverResponseModel fromJson(Map<String, dynamic> json) =>DiscoverResponseModel(
        title: json["title"],
        content: json["content"],
    );
      
        @override
        Map<String, dynamic> toJson() {
          throw UnimplementedError();
        }
}
