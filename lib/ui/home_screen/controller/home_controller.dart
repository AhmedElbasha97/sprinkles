import 'package:get/get.dart';
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/services/category_services.dart';

class HomeController extends GetxController {
  bool isLoading = true;
 late List<CategoryModel>? dataHomeCategory;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }
getData() async {
  dataHomeCategory = await CategoryServices.getHomeCategory();
  isLoading = false;
  update();
}
}