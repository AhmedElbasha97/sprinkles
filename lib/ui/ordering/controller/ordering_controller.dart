// ignore_for_file: prefer_is_empty, empty_catches

import 'dart:io';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/choosing_filiter_model.dart';
import 'package:sprinkles/services/order_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/ordering_model.dart';

class OrderingController extends GetxController{
 late OrderingModel? data ;
 List<ChoosingFilterModel> choosedData = [];
 bool dataIsLoading  = true;
 final int productId;
 String messageTextWhatsApp = "";
 OrderingController({required this.productId});
 @override
 Future<void> onInit() async {
  super.onInit();
  getData();
 }

 getData() async {
  data = await OrderingServices.orderingProduct("$productId");
  if(data?.itemFilter?.length != 0){
   await fillingChoosedData();
  }
  dataIsLoading = false;
  update();
 }
 fillingChoosedData() {
  for (int i = 0; i < (data?.itemFilter?.length ?? 0 - 1); i++) {
   choosedData.add(ChoosingFilterModel(data?.itemFilter?[i].filter ?? "",
       data?.itemFilter?[i].items?[0].filterItem ?? ""));
  }
 }
choosingFilterValue(int index,String choosedFilterTitle){
  choosedData[index] =  ChoosingFilterModel(Get.find<StorageService>().activeLocale == SupportedLocales.english? (data?.itemFilter?[index].filterEn??""):(data?.itemFilter?[index].filter??""),choosedFilterTitle);
  update();
}
ordering(){
messageTextWhatsApp = " ${whatsAppText2Key.tr} ${Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.nameEn??"":data?.name??""} ${whatsAppText1Key.tr} ";

if(data?.itemFilter?.length!=0) {
 for (int i = 0; i > choosedData.length - 1; i++) {
  messageTextWhatsApp =
  "$messageTextWhatsApp\n ${choosedData[i].filterTitle} \n ${choosedData[i]
      .filterValue}";
 }
}
whatsapp(data?.shop?.whatsapp??"");
}
 whatsapp(String contact) async{

  var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp";
  var iosUrl = "https://wa.me/$contact?text=${Uri.parse(messageTextWhatsApp)}";

  try{
   if(Platform.isIOS){
    await launchUrl(Uri.parse(iosUrl));
   }
   else{
    await launchUrl(Uri.parse(androidUrl));
   }
  } on Exception{

  }
 }
}