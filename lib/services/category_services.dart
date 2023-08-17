import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/category_model.dart';


class CategoryServices {
  static ApiService api = ApiService();
  static Future<List<CategoryModel>?> getHomeCategory() async {
    List<CategoryModel>? categoryList = [];
    var data = await api.request(Services.categoryEndPoint, "POST");
    if (data != null) {
      for (var category in data){
        categoryList.add(CategoryModel.fromJson(category));
      }
      return categoryList;
    }
    return null;
  }
}