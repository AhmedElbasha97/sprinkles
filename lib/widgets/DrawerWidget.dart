// ignore_for_file: file_names, library_private_types_in_public_api, use_build_context_synchronously, sized_box_for_whitespace, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/services/auth_services.dart';
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
import 'package:sprinkles/widgets/alert_dialogue.dart';
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
   DrawerItem(drawerTag1.tr,"homeIconDrawer.png"),
   DrawerItem(drawerTag2.tr,"storeIconDrawer.png"),
   DrawerItem(drawerTag3.tr,"productIconDrawer.png"),
  Get.find<StorageService>().checkUserIsSignedIn?
   DrawerItem(drawerTag4.tr,"userIcon.png"):
   DrawerItem(drawerTag5.tr,"loginIcon.png"),
  Get.find<StorageService>().checkUserIsSignedIn?
   DrawerItem(drawerTag6.tr,"logoutIcon.png"):
   DrawerItem(drawerTag7.tr,"signUpIconDrawer.png"),
   DrawerItem(drawerTag8.tr,"privacyIconDrawer.png"),
   DrawerItem(drawerTag9.tr,"termsIconDrawer.png"),
   DrawerItem(drawerTag11.tr,"shareIcon.png"),
   DrawerItem(drawerTag10.tr,"rateIconDrawer.png"),
];
  @override
  void initState() {
    super.initState();
  if(Get.find<StorageService>().checkUserIsSignedIn){
      data.insert(5,  DrawerItem(favTitle.tr,"favoriteIcon.png"));
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
    case "قائمة المفضلة":{
      Get.to(()=> const FavoriteScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "الحساب الشخصى":{
      Get.to(()=>const ProfileScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;

    case "سياسة الخصوصية":{
      Get.to(()=> const PrivacyPolicyScreen() ,transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    case "الأحكام والشروط":{
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
              return YesOrNoDialogue(alertText: logOutWarning.tr, alertTitle: drawerTag6.tr, alertYesButtonTitle: drawerTag6.tr, alertNoButtonTitle: deleteAcc.tr, alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
                Get.find<StorageService>().loggingOut();
                Get.offAll(()=>const SplashScreen());

              }, alertNoButtonFunction: () async {
                if(await BiomatricsAuthService.authenticateUser(deleteAcc.tr)) {
                  ResponseModel? data = await AuthServices.deleteUserAccount(Get.find<StorageService>().getId);
                  if(data?.msg == "succeeded"){
                    Get.find<StorageService>().loggingOut();
                    Get.offAll(()=>const SplashScreen());
                  }
                  else{
                    showDialog(context: context,
                        builder: (context) {
                          return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
                        }
                    );
                  }

                }
              }, alertYesButtonIcon: 'assets/icons/logoutIcon.png', alertNoButtonIcon: 'assets/icons/deleteAccountIcon.png', alertIcon: 'assets/icons/logoutIcon.png',containerHeight:Get.height*0.57);
            });
        widget.scaffoldKey.currentState?.openEndDrawer();

    }
    break;
    case "Home":{
      Get.to(()=>const HomeScreen(),transition:Transition.rightToLeftWithFade);

        widget.scaffoldKey.currentState?.openEndDrawer();

    }
    break;
    case "Shop Display":{
      Get.to(()=> const StoreScreen(selectedFromDrawer: true, mainCategoryId: 0,),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    case 'Favorites list':{
      Get.to(()=> const FavoriteScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "Personal Account":{
      Get.to(()=>const ProfileScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;

        case "Privacy Policy":{
      Get.to(()=> const PrivacyPolicyScreen() ,transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    case "Terms and Conditions":{
    Get.to(()=> const TermsScreen(),transition:Transition.rightToLeftWithFade);
    widget.scaffoldKey.currentState?.openEndDrawer();
  }
  break;
    case  "Display Products":{
      Get.to(()=> const ProductScreen(mainCategoryId: 0, selectingFromDrawer: true,),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "Log in":{
      Get.to(()=> LoginScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "Create an account":{
      Get.to(()=> const SignupScreen(),transition:Transition.rightToLeftWithFade);
      widget.scaffoldKey.currentState?.openEndDrawer();
    }
    break;
    case "Log out":{

        showDialog(context: context,
            builder: (context) {
              return YesOrNoDialogue(alertText: logOutWarning.tr, alertTitle:drawerTag6.tr, alertYesButtonTitle: drawerTag6.tr, alertNoButtonTitle:deleteAcc.tr, alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
                Get.find<StorageService>().loggingOut();
                Get.offAll(()=>const SplashScreen());

              }, alertNoButtonFunction: () async {
                if(await BiomatricsAuthService.authenticateUser(deleteAcc.tr)) {
                  ResponseModel? data = await AuthServices.deleteUserAccount(Get.find<StorageService>().getId);
                  if(data?.msg == "succeeded"){
                    Get.find<StorageService>().loggingOut();
                    Get.offAll(()=>const SplashScreen());
                  }
                  else{
                    showDialog(context: context,
                        builder: (context) {
                          return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
                        }
                    );
                  }

                }
              }, alertYesButtonIcon: 'assets/icons/logoutIcon.png', alertNoButtonIcon: 'assets/icons/deleteAccountIcon.png', alertIcon: 'assets/icons/logoutIcon.png',containerHeight:Get.height*0.57);
            });
        widget.scaffoldKey.currentState?.openEndDrawer();

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
          child:  Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
            child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,

                children:[
                CustomText(
                  greetingText.tr,
                  style: const TextStyle(

                    fontSize: 17,
                    letterSpacing: 0,
                    fontFamily: fontFamilyArabicName,
                    color: kDarkPinkColor,
                  ),
                ),
                Center(
                  child: CustomText(
                    Get.find<StorageService>().checkUserIsSignedIn?Get.find<StorageService>().userName:"",
                    style: const TextStyle(

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