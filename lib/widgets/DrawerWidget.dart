// ignore_for_file: file_names, library_private_types_in_public_api, use_build_context_synchronously, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/widgets/drawer_tap_widget.dart';

import '../Utils/constant.dart';
import '../ui/product_screen/product_screen.dart';
import 'custom_text_widget.dart';


class AppDrawers extends StatefulWidget {

  const AppDrawers({Key? key}) : super(key: key);

  @override
  _AppDrawersState createState() => _AppDrawersState();
}

class _AppDrawersState extends State<AppDrawers> {
 List<DrawerItem> data= [
   DrawerItem("الرئيسيّة ","homeIconDrawer.png"),
   DrawerItem("عرض المحلات","storeIconDrawer.png"),
   DrawerItem("عرض المنتجات ","productIconDrawer.png"),
   DrawerItem("البحث المتقدم","searchIconDrawer.png"),
   DrawerItem("تسجيل دخول المحلات","signUpIconDrawer.png"),
   DrawerItem("سياسة الخصوصيه","privacyIconDrawer.png"),
   DrawerItem("الشروط والاحكام","termsIconDrawer.png"),
   DrawerItem("شارك التطبيق","shareIcon.png"),
   DrawerItem("تقييم التطبيق","rateIconDrawer.png"),
 ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kBackGroundColor,
      child: ListView(
        children: [
          Stack(

              children:[
                Container(
                  height: Get.height*0.17,
                  width:Get.width,

                ),
      Positioned(
          right:0, child: Container(
          height: Get.height*0.25,
          width:Get.width*0.45,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(8.0,0,8.0,0),
            child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,

                children:[
                CustomText(
                  'مرحبًا',
                  style: TextStyle(

                    fontSize: 17,
                    letterSpacing: 0,
                    fontFamily: fontFamilyArabicName,
                    color: kDarkPinkColor,
                  ),
                ),
                Center(
                  child: CustomText(
                    'اسم المستخدم',
                    style: TextStyle(

                      fontSize: 15,
                      letterSpacing: 0,
                      fontFamily: fontFamilyArabicName,
                      color: kDarkPinkColor,
                    ),
                  ),
                ),
              ]
            ),
          )),),
                Positioned(
                  left:0,
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height*0.157,
                        width: Get.width*0.4,
                      ),
                      Positioned(
                        top:0,
                        child: SizedBox(
                          height: Get.height*0.157,
                          width: Get.width*0.4,
                          child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                        ),
                      ),Positioned(
                        left:5,
                        child: Container(
                          width:Get.width*0.22,
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.end,
                            children: [


                              SizedBox(
                                height: Get.height*0.12,
                                width: Get.width*0.22,
                                child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ]
          ),
          Column(
            children:data.map((e){
              return DrawerTapWidget(title: e.title, iconPath: 'assets/icons/${e.iconName}',);

            }).toList(),
          )
        ],
      ),
    );
  }
}
class DrawerItem {
  const DrawerItem(this.title, this.iconName);

  final String title;
  final String iconName;
}