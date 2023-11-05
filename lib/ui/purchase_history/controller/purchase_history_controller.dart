import 'package:get/get.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/order_history_model.dart';
import 'package:sprinkles/services/orders_history_services.dart';

class PurchaseHistoryController extends GetxController{
  late List<OrderHistoryModel>? ordersList;
  bool isLoading = true;
  List<String> orderTapsTitle = [
    orderStatus1.tr,
    orderStatus2.tr,
    orderStatus3.tr,
  ];
  List<String> orderTapsWarning = [
    orderStatusWarning1.tr,
    orderStatusWarning2.tr,
    orderStatusWarning3.tr,
  ];
  List<String> orderTapsImages = [
   "purchase-pending-icon.png",
    "purchase-done-icon.png",
    "purchase-canceled-icon.png",
  ];
  int activeIndex = 0;
  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }
  getNextTap (){
    if(
    activeIndex < 2
    ){
      activeIndex++;
      getData();
    }
  }
  getPreviousTap (){
    if(
    activeIndex > 0
    ){
      activeIndex--;
      getData();
    }
  }
  getData() async {
    isLoading = true;
    update();
    ordersList = await OrderHistoryServices().getOrdersHistory("$activeIndex");
    isLoading = false;
    update();
  }


}