import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/models/shops_model.dart';
import 'package:sprinkles/services/category_services.dart';
import 'package:sprinkles/services/shop_services.dart';

class StoreController extends GetxController {
  bool storeIsLoading = true;
  bool categoryIsLoading = true;
  bool advertisementsIsLoading = true;
  final int mainCategoryId;
  final bool selectedFromDrawer;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  StoreController(this.mainCategoryId, this.selectedFromDrawer);

  int selectedMainCategoryId = 0;
  late List<ShopsModel>? storeList;
  late List<CategoryModel>? mainCategoryList;
  List<String> governmentData = ["ترتيب حسب السعر","ترتيب حسب الاسم","ترتيب حسب التصنيف"];

  ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
    if(selectedFromDrawer){
    await getMainCategoryData();
    }
    await   getStoreData();
  }
  getStoreData() async {
    storeIsLoading = true;
    update();
    if(selectedFromDrawer){
      storeList = await ShopServices.getAllShops();
    }else {
      storeList = await ShopServices.getShopsForMainCategory(mainCategoryId);
    }
    storeIsLoading = false;
    update();
  }
  getMainCategoryData() async {
    mainCategoryList = await CategoryServices.getHomeCategory();
    categoryIsLoading = false;
    update();
  }

  selectingAnotherSubCategory(int mainCategoryId) async {
    selectedMainCategoryId = mainCategoryId;
    storeIsLoading = true;
    update();
    storeList = await ShopServices.getShopsForMainCategory(mainCategoryId);
    storeIsLoading = false;
    update();
  }

}