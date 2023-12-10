// ignore_for_file: prefer_is_empty, empty_catches

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/models/choosing_filiter_model.dart';
import 'package:sprinkles/services/order_services.dart';
import 'package:sprinkles/services/stats_services.dart';
import 'package:sprinkles/ui/branches_list/branches_list_screen.dart';
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
       "",data?.itemFilter?[i].filter ?? "",""));
  }
 }
choosingFilterValue(int index,Item choosedFilterTitle){
  choosedData[index] =  ChoosingFilterModel(data?.itemFilter?[index].filter??"",choosedFilterTitle.filterItem??""
  ,data?.itemFilter?[index].filterEn??"",choosedFilterTitle.filterItemEn??"");
  update();
}
settingWhatsAppText(){
 messageTextWhatsApp = ' رأيت هذا ال ${data?.name??""} في تطبيق سبرينكلز وأريد عمل اوردر';
 if(data?.itemFilter?.length != 0) {
  for (int i = 0; i < choosedData.length ; i++) {
   messageTextWhatsApp =
   '$messageTextWhatsApp \n${choosedData[i].filterTitle}: \n${choosedData[i]
       .filterValue}';
  }

 }
 messageTextWhatsApp =
 '$messageTextWhatsApp \n I saw this ${data?.nameEn??""} In the Sprinkles app and I want to make an order';
 if(data?.itemFilter?.length != 0) {
  for (int i = 0; i < choosedData.length ; i++) {
   messageTextWhatsApp =
   '$messageTextWhatsApp \n${choosedData[i].filterTitleEn}: \n${choosedData[i]
       .filterValueEn}';
  }

 }
 if (Platform.isAndroid) {
  messageTextWhatsApp =
  '$messageTextWhatsApp \n ${data?.link ?? ""} ';
 }
}
ordering(context) async {

await settingWhatsAppText();
whatsapp(data?.shop?.whatsapp??"",context);
}
 whatsapp(String contact,context) async {
  var result = await StatsServices()
      .sendingOrderNowOrWhatsAppOrCallHasBeenClicked(
      "${data?.shop?.id ?? 0}", "${data?.id}", OrderType.FORM.name,
      messageTextWhatsApp);
  if (result?.status == "true") {
   if(data?.shop?.branch?.length != 0){
    var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp";
    var iosUrl = "     ";
    showDialog(context: context,
     builder: (context) =>
         BranchesListWidget(branch: data?.shop?.branch, androidUrl:androidUrl, iosUrl: iosUrl, shopId: "${ data?.shop?.id??0}", productId: "${ data?.id??0}",),);
   }else {
    try {
     if (Platform.isIOS) {
      var iosUrl = "https://wa.me/$contact?text=${Uri.parse(
          messageTextWhatsApp)} \n ${data?.link ?? ""} ";
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
}