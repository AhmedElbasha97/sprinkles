// ignore_for_file: file_names, library_private_types_in_public_api, use_build_context_synchronously, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/services/biomatrics_auth_services.dart';
import 'package:sprinkles/ui/home_screen/home_screen.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/profile/profile_screen.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/ui/splash_screen/splash_screen.dart';
import 'package:sprinkles/ui/store%20_screen/store_screen.dart';
import 'package:sprinkles/widgets/drawer_tap_widget.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import '../Utils/constant.dart';
import 'custom_text_widget.dart';


class AppDrawers extends StatefulWidget {

  const AppDrawers({Key? key}) : super(key: key);

  @override
  _AppDrawersState createState() => _AppDrawersState();
}

class _AppDrawersState extends State<AppDrawers> {
  detectFunctionalityOfDrawerTap(String title){
  switch(title){
    case "الرئيسيّة":{
      Get.to(()=>const HomeScreen());
    }
    break;
    case "عرض المحلات":{
      Get.to(()=> const StoreScreen(selectedFromDrawer: true, mainCategoryId: 0,));
    }
    break;
    case "الحساب الشخصى":{
      Get.to(()=>const ProfileScreen());
    }
    break;

    case "تسجيل دخول":{
      Get.to(()=> LoginScreen());
    }
    break;
    case "انشاء حساب":{
      Get.to(()=> const SignupScreen());
    }
    break;
    case "تسجيل الخروج":{

        showDialog(context: context,
            builder: (context) {
              return YesOrNoDialogue(alertText: 'هل تريد تسجيل الخروج من التطبيق يمكنك أيضآ مسح بيناتك أيضآ', alertTitle: 'تسجيل الخروج', alertYesButtonTitle: 'تسجيل الخروج', alertNoButtonTitle: 'مسح الحساب', alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
                Get.find<StorageService>().loggingOut();
                Get.to(()=>const SplashScreen());

              }, alertNoButtonFunction: () async {
                if(await BiomatricsAuthService.authenticateUser("مسح الحساب")) {

                Get.find<StorageService>().loggingOut(); Get.to(()=>const SplashScreen());
                }
              }, alertYesButtonIcon: 'assets/icons/logoutIcon.png', alertNoButtonIcon: 'assets/icons/deleteAccountIcon.png', alertIcon: 'assets/icons/logoutIcon.png',containerHeight:Get.height*0.57);
            });

    }
    break;
    case "الشروط والاحكام":{
      showDialog(context: context,
        builder: (context) {
        return Dialog(
          backgroundColor:Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: Container(
            height:Get.height*0.26,
            color:Colors.transparent,
            child: Stack(

              children: [
                Positioned(
                  bottom:0,
                  child: Center(
                    child:  Container(

                      padding:  EdgeInsets.only(top:Get.height*0.05,left:10,right:10,bottom:10),                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:kDarkPinkColor
                    ),

                      width:Get.width*0.9,
                      child: Container(
                        height:Get.height*0.09,
                        width:Get.width*0.9,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color:kBackGroundColor
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            CustomText(
                              "تحميل....",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                shadows: <Shadow>[
                                  Shadow(
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 13.0,

                                      color: Colors.black.withOpacity(0.5)
                                  ),
                                ],
                                fontSize: 18,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: kLightPinkColor,
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ],
                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                    ),

                  ),
                ),
                Positioned(
                  top:0,
                  left:Get.width*0.3,
                  child: Container(

                    padding:const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(50),color:kDarkPinkColor
                    ),
                    height: Get.height*0.15,
                    width: Get.width*0.3,
                    child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                  ),
                ),
              ],
            ),
          ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
              .animate() // this wraps the previous Animate in another Animate
              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
              .slide(),
        );
        }

      );
    }
    break;
  }
  }
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
   const DrawerItem("تسجيل دخول المحلات","addNewStoreIcon.png"),
   const DrawerItem("سياسة الخصوصيه","privacyIconDrawer.png"),
   const DrawerItem("الشروط والاحكام","termsIconDrawer.png"),
   const DrawerItem("شارك التطبيق","shareIcon.png"),
   const DrawerItem("تقييم التطبيق","rateIconDrawer.png"),
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