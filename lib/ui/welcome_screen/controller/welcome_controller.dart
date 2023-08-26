import 'dart:io';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sprinkles/models/links_model.dart';
import 'package:sprinkles/services/app_info_services.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeController extends GetxController {
  late LinksModel? links;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
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