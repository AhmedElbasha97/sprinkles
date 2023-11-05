// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/edit_profile/edit_profile_screen.dart';
import 'package:sprinkles/ui/profile/controller/profile_controller.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) => Scaffold(
          backgroundColor:kBackGroundColor,
          key: controller.scaffoldState,
          drawer: AppDrawers(scaffoldKey: controller.scaffoldState,),
          body:Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
            Column(
              children: [
                Get.find<StorageService>().activeLocale == SupportedLocales.english?
                Stack(
                    children:[
                      Container(
                        height: Get.height*0.25,
                        width:Get.width,

                      ),
                      Positioned(
                        top:statusBarHeight-5,
                        right:0,
                        child: Stack(
                          children: [
                            Container(
                              height: Get.height*0.19,
                              width: Get.width*0.47,
                            ),
                            Positioned(
                              top:0,
                              child: SizedBox(
                                height: Get.height*0.19,
                                width: Get.width*0.47,
                                child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.fitHeight,),
                              ),
                            ),
                            Positioned(
                              top:5,
                              right:5,
                              child: Container(
                                width:Get.width*0.26,
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: Get.height*0.14,
                                      width: Get.width*0.26,
                                      child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top:statusBarHeight-5,
                        left:0,
                        child: Container(
                            height: Get.height*0.25,
                            width:Get.width*0.65,
                            child:    Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0.0,0),
                              child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,

                                  children:[
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap:(){
                                              controller.scaffoldState.currentState!.openDrawer();
                                            },
                                            child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                        const SizedBox(
                                          width:20,
                                        ),
                                         CustomText(
                                          greetingText.tr,
                                          style:  TextStyle(

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                      child: controller.isLoading?Center(
                                        child:   Container(
                                          width:Get.width*0.35,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFDFDDDF),
                                              borderRadius: BorderRadius.circular(50)
                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide(),


                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(): Center(
                                        child: CustomText(
                                          controller.userData?.name??"",
                                          style:  TextStyle(

                                            fontSize: 22,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ]
                              ),
                            )),),


                    ]
                ):
                Stack(
                    children:[
                      Container(
                        height: Get.height*0.25,
                        width:Get.width,

                      ),
                      Positioned(
                        top:statusBarHeight-5,
                        right:0,
                        child: Container(
                            height: Get.height*0.25,
                            width:Get.width*0.65,
                            child:    Padding(
                              padding: const EdgeInsets.fromLTRB(0,0,0.0,0),
                              child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,

                                  children:[
                                     Row(
                                      children: [
                                        InkWell(
                                            onTap:(){
                                              controller.scaffoldState.currentState!.openDrawer();
                                            },
                                            child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                        const SizedBox(
                                          width:20,
                                        ),
                                         CustomText(
                                          greetingText.tr,
                                          style: TextStyle(

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                      child: controller.isLoading?Center(
                                        child:   Container(
                                          width:Get.width*0.35,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFDFDDDF),
                                              borderRadius: BorderRadius.circular(50)
                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide(),


                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(): Center(
                                        child: CustomText(
                                          controller.userData?.name??"",
                                          style:  TextStyle(

                                            fontSize: 22,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                    ),

                                  ]
                              ),
                            )),),
                      Positioned(
                        top:statusBarHeight-5,
                        left:0,
                        child: Stack(
                          children: [
                            Container(
                              height: Get.height*0.19,
                              width: Get.width*0.47,
                            ),
                            Positioned(
                              top:0,
                              child: SizedBox(
                                height: Get.height*0.19,
                                width: Get.width*0.47,
                                child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitHeight,),
                              ),
                            ),
                            Positioned(
                              top:5,
                              left:5,
                              child: Container(
                                width:Get.width*0.26,
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.start,
                                  crossAxisAlignment:CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: Get.height*0.14,
                                      width: Get.width*0.26,
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
                 Row(
                    children:[
                      const SizedBox(
                        width:10,
                      ),
                      const Icon(Icons.email,color:kDarkPinkColor,size:18),
                      const SizedBox(
                        width:10,
                      ),
                      controller.isLoading?Center(
                        child:   Container(
                          width:Get.width*0.35,
                          height: 20,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),


                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(): CustomText(
                        controller.userData?.email??"",
                        style: TextStyle(

                          fontSize: 17,
                          letterSpacing: 0,
                          fontFamily: Get
                              .find<StorageService>()
                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                          color: kDarkPinkColor,
                        ),
                      ),

                    ]
                ),
                 Row(
                    children:[
                      const SizedBox(
                        width:10,
                      ),
                      const Icon(Icons.phone,color:kDarkPinkColor,size:18),
                      const SizedBox(
                        width:10,
                      ),
                      controller.isLoading?Center(
                        child:   Container(
                          width:Get.width*0.35,
                          height: 20,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),


                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(): CustomText(
                        controller.userData?.phone??"",
                        style:  TextStyle(

                          fontSize: 17,
                          letterSpacing: 0,
                          fontFamily: Get
                              .find<StorageService>()
                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                          color: kDarkPinkColor,
                        ),
                      ),

                    ]
                ),
              ],
            ),


        Padding(
          padding:  EdgeInsets.only(bottom:Get.width*0.3),
          child: Column(
            children: [
              InkWell(
                onTap:(){
                 controller.goToChangePass();
                },
                child: Stack(
                    children:[
                      Container(
                        height: Get.height*0.12,
                        width:Get.width*0.9,
                        child:const Padding(padding: EdgeInsets.all(0),
                        ),
                      ),
                      Positioned(
                        top:Get.height*0.025,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.12),
                          child: Container(
                            height: Get.height*0.06,
                            width:Get.width*0.75,
                            decoration: BoxDecoration(
                              border: Border.all( color:kBackGroundColor,width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 13.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [kDarkPinkColor,kLightPinkColor],
                              ),borderRadius: BorderRadius.circular(40), //
                            ),
                            child:  Center(
                              child:  Container(
                                width:Get.width*0.8,
                                child: CustomText(
                                  profileBtn1.tr,
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
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kBackGroundColor,
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right:0,
                        child: SizedBox(
                          height: Get.height*0.12,
                          width: Get.width*0.25,
                          child: Image.asset("assets/icons/editPasswordIcon.png",fit: BoxFit.fitHeight,),
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(height:10),
              InkWell(
                onTap:(){
                  Get.to(()=>const EditProfileScreen());
                },
                child: Stack(
                    children:[
                      Container(
                        height: Get.height*0.12,
                        width:Get.width*0.9,
                        child:const Padding(padding: EdgeInsets.all(0),
                        ),
                      ),
                      Positioned(
                        top:Get.height*0.025,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.12),
                          child: Container(
                            height: Get.height*0.06,
                            width:Get.width*0.75,
                            decoration: BoxDecoration(
                              border: Border.all( color:kBackGroundColor,width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  blurRadius: 13.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [kDarkPinkColor,kLightPinkColor],
                              ),borderRadius: BorderRadius.circular(40), //
                            ),
                            child:  Center(
                              child:  Container(
                                width:Get.width*0.8,
                                child: CustomText(
                                  profileBtn2.tr,
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
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    fontWeight: FontWeight.w900,
                                    color: kBackGroundColor,
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        right:0,
                        child: SizedBox(
                          height: Get.height*0.12,
                          width: Get.width*0.25,
                          child: Image.asset("assets/icons/editProfileIcon.png",fit: BoxFit.fitHeight,),
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        )
          ]
        )
      ),
    );
  }
}
