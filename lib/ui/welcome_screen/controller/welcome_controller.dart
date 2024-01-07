import 'dart:io';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sprinkles/models/links_model.dart';
import 'package:sprinkles/services/app_info_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../services/dynamic_link_services.dart';

class WelcomeController extends GetxController {
  late LinksModel? links;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
    await DynamicLinkHandler().initDynamicLinks();
  }
  whatsapp(context) async{
    String   messageTextWhatsApp = 'I want to ask about something \n أريد الِأستفسار عن شىْ';
    var androidUrl = "whatsapp://send?phone=${links?.whatsApp}&text=$messageTextWhatsApp";
    var iosUrl = "https://wa.me/${links?.whatsApp}?text=${Uri.parse(messageTextWhatsApp)}";
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
  getData() async {
    links = await AppInfoServices.getLinks();
    update();
  }

  launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url,mode:LaunchMode.externalNonBrowserApplication)) {
      throw Exception('Could not launch $url');
    }
  }
   sharingAppLink(){
     Share.share(Platform.isAndroid
         ? links!.andriod!
         : links!.ios!,);
   }
}