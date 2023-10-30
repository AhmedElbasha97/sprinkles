// ignore_for_file: prefer_is_empty, empty_catches

import 'dart:io';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/choosing_filiter_model.dart';
import 'package:sprinkles/services/order_services.dart';
import 'package:sprinkles/services/stats_services.dart';
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
settingWhatsAppText(){
 messageTextWhatsApp = ' رأيت هذا ال ${data?.name??""} في تطبيق سبرينكلس وأريد عمل اوردر';
 if(data?.itemFilter?.length != 0) {
  for (int i = 0; i < choosedData.length ; i++) {
   messageTextWhatsApp =
   '$messageTextWhatsApp \n${choosedData[i].filterTitle} \n${choosedData[i]
       .filterValue}';
  }

 }
 messageTextWhatsApp =
 '$messageTextWhatsApp \n I saw this ${data?.nameEn??""} In the Sprinkles app and I want to make an order';
 if(data?.itemFilter?.length != 0) {
  for (int i = 0; i < choosedData.length ; i++) {
   messageTextWhatsApp =
   '$messageTextWhatsApp \n${choosedData[i].filterTitle} \n${choosedData[i]
       .filterValue}';
  }

 }
 messageTextWhatsApp =
 '$messageTextWhatsApp \n ${data?.link??""} ';
}
ordering() async {

await settingWhatsAppText();
whatsapp(data?.shop?.whatsapp??"");
}
 whatsapp(String contact) async {
  print(messageTextWhatsApp);
  var result = await StatsServices()
      .sendingOrderNowOrWhatsAppOrCallHasBeenClicked(
      "${data?.shop?.id ?? 0}", "${data?.id}", OrderType.FORM.name,
      messageTextWhatsApp);
  if (result?.status == "true") {
   try {
    if (Platform.isIOS) {
     var iosUrl = "https://wa.me/$contact?text=${Uri.parse(
         messageTextWhatsApp)}";
     await launchUrl(Uri.parse(iosUrl));
    }
    else {
     var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp";
     await launchUrl(Uri.parse(androidUrl));
    }
   } on Exception {

   }
  }
 }
}