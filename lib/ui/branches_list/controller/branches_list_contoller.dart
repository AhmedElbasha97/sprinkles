import 'dart:io';
import 'package:get/get.dart';
import 'package:sprinkles/services/stats_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/constant.dart';

class BranchesListController extends GetxController{
  final String iosUrl;
  final String androidUrl;
  final String productId;
  final String shopId;
  BranchesListController(this.iosUrl, this.androidUrl, this.productId, this.shopId);
  Future<void> makePhoneCall(String phoneNumber,context) async {
    var result = await StatsServices()
        .sendingOrderNowOrWhatsAppOrCallHasBeenClicked(
        "${shopId}", "${productId}", OrderType.CALL.name,
        "0");
    if (result?.status == "true") {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }else{

    }
  }

  whatsapp(String contact,context) async{
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
