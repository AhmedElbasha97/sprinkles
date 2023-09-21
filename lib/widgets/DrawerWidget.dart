// ignore_for_file: file_names, library_private_types_in_public_api, use_build_context_synchronously, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/privacy_policy_model.dart';
import 'package:sprinkles/services/biomatrics_auth_services.dart';
import 'package:sprinkles/ui/favorite_screen/favorite_screen.dart';
import 'package:sprinkles/ui/home_screen/home_screen.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/privacypolicy/privacyPolicyScreen.dart';
import 'package:sprinkles/ui/product_screen/product_screen.dart';
import 'package:sprinkles/ui/profile/profile_screen.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/ui/splash_screen/splash_screen.dart';
import 'package:sprinkles/ui/store%20_screen/store_screen.dart';
import 'package:sprinkles/ui/term&condition/terms_screen.dart';
import 'package:sprinkles/widgets/drawer_tap_widget.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import '../Utils/constant.dart';
import 'custom_text_widget.dart';


class AppDrawers extends StatefulWidget {

  const AppDrawers({Key? key, required this.scaffoldKey}) : super(key: key);
  final scaffoldKey ;
  @override
  _AppDrawersState createState() => _AppDrawersState();
}

class _AppDrawersState extends State<AppDrawers> {
  List<DrawerItem> data= [
  const DrawerItem("الرئيسيّة","homeIconDrawer.png"),
  const DrawerItem("عرض المحلات","storeIconDrawer.png"),
  const DrawerItem("عرض المنتجات ","productIconDrawer.png"),
  const DrawerItem("البحث المتقدم","searchIconDrawer.png"),
  Get.find<StorageService>().checkUserIsSignedIn?
  const DrawerItem("الحساب الشخصى","userIcon.png"):
  const DrawerItem("تسجيل دخول","loginIcon.png"),
  Get.find<StorageService>().checkUserIsSignedIn?
  const DrawerItem("تسجيل الخروج","logoutIcon.png"):
  const DrawerItem("انشاء حساب","signUpIconDrawer.png"),
  const DrawerItem("سياسة الخصوصيه","privacyIconDrawer.png"),
  const DrawerItem("الشروط والاحكام","termsIconDrawer.png"),
  const DrawerItem("شارك التطبيق","shareIcon.png"),
  const DrawerItem("تقييم التطبيق","rateIconDrawer.png"),
];
  @override
  void initState() {
    super.initState();
  if(Get.find<StorageService>().checkUserIsSignedIn){
      data.insert(5, const DrawerItem("قائمه المفضله","favoriteIcon.png"));
  }

  }
  detectFunctionalityOfDrawerTap(String title){
  switch(title){
    case "الرئيسيّة":{
      Get.to(()=>const HomeScreen(),transition:Transition.rightToLeftWithFade);

        widget.scaffoldKey.currentState?.openEndDrawer();

    }
    break;
    case "عرض المحلات":{
      Get.to(()=> const StoreScreen(selectedFromDrawer: true, mainCategoryId: 0,),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    case "قائمه المفضله":{
      Get.to(()=> const FavoriteScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "الحساب الشخصى":{
      Get.to(()=>const ProfileScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;

        case "سياسة الخصوصيه":{
      Get.to(()=> const PrivacyPolicyScreen() ,transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    case "الشروط والاحكام":{
    Get.to(()=> const TermsScreen(),transition:Transition.rightToLeftWithFade);
    widget.scaffoldKey.currentState?.openEndDrawer();
  }
  break;
    case "عرض المنتجات ":{
      Get.to(()=> const ProductScreen(mainCategoryId: 0, selectingFromDrawer: true,),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "تسجيل دخول":{
      Get.to(()=> LoginScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "انشاء حساب":{
      Get.to(()=> const SignupScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "تسجيل الخروج":{

        showDialog(context: context,
            builder: (context) {
              return YesOrNoDialogue(alertText: 'هل تريد تسجيل الخروج من التطبيق يمكنك أيضآ مسح بيناتك أيضآ', alertTitle: 'تسجيل الخروج', alertYesButtonTitle: 'تسجيل الخروج', alertNoButtonTitle: 'مسح الحساب', alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
                Get.find<StorageService>().loggingOut();
                Get.offAll(()=>const SplashScreen());

              }, alertNoButtonFunction: () async {
                if(await BiomatricsAuthService.authenticateUser("مسح الحساب")) {

                Get.find<StorageService>().loggingOut(); Get.offAll(()=>const SplashScreen());
                }
              }, alertYesButtonIcon: 'assets/icons/logoutIcon.png', alertNoButtonIcon: 'assets/icons/deleteAccountIcon.png', alertIcon: 'assets/icons/logoutIcon.png',containerHeight:Get.height*0.57);
            });
        widget.scaffoldKey.currentState?.openEndDrawer();

    }
    break;
    case "الشروط والاحكام":{

    }
    break;
  }
  }

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
                  top:0,
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
                  top:0,
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
                      ),
                      Positioned(
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
              return InkWell(
                onTap:(){
                  detectFunctionalityOfDrawerTap(e.title);
                },
                  child: DrawerTapWidget(title: e.title, iconPath: 'assets/icons/${e.iconName}',));

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