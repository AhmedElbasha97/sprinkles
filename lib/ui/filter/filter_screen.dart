// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/filter/controller/filter_controller.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (controller) =>  Scaffold(
          key: controller.scaffoldState,
          drawer: AppDrawers(scaffoldKey: controller.scaffoldState,),
        backgroundColor: kBackGroundColor,
          body: SingleChildScrollView(
            child: Container(
              width: Get.width,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Get.find<StorageService>().activeLocale == SupportedLocales.english?Stack(
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
                                  child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.fitWidth,),
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
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitWidth,),
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
                              width:Get.width*0.7,
                              child:     Padding(
                                padding: const EdgeInsets.fromLTRB(20.0,10,20.0,0),
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,

                                    children:[
                                      InkWell(
                                          onTap:(){
                                            controller.scaffoldState.currentState!.openDrawer();
                                          },
                                          child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                      const SizedBox(
                                        width:10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10.0,10,10.0,0),
                                        child: CustomText(
                                          greetingText.tr,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15.0,0,15.0,0),
                                        child: Center(
                                          child: CustomText(
                                            advancedSearchTitle.tr,
                                            style: TextStyle(

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
                              width:Get.width*0.6,
                              child:     Padding(
                                padding: const EdgeInsets.fromLTRB(0,10,20.0,0),
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,

                                    children:[
                                      InkWell(
                                          onTap:(){
                                            controller.scaffoldState.currentState!.openDrawer();
                                          },
                                          child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                      const SizedBox(
                                        width:10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,10.0,0),
                                        child: CustomText(
                                          greetingText.tr,
                                          style:  TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                        child: Center(
                                          child: CustomText(
                                            advancedSearchTitle.tr,
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
                                  child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
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
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitWidth,),
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
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap:(){
                          controller.selectingTap("s");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0,bottom:10),
                          child: Stack(
                            children: [
                              Container(
                                width:Get.width*0.45,
                                height:Get.height*0.08,
                                decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),

                                  gradient:  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: controller.selectedTap == "s"?[kDarkPinkColor,kLightPinkColor]:[Colors.white,Colors.white],
                                  ),
                                ),
                              ),
                              Positioned(
                                top:0,
                                left:0,
                                child: Container(
                                  height:Get.height*0.08,
                                  width: Get.width*0.21,
                                  decoration:const BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/cakeBG.png",
                                      ),
                                      fit:  BoxFit.cover,
                                    ),

                                  ),
                                ),
                              ),
                              Positioned(
                                left:10,
                                top:5,
                                child: Container(
                                  width:Get.width*0.1,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.end,
                                    children: [


                                      SizedBox(
                                        height: Get.height*0.05,
                                        width:Get.width*0.1,
                                        child: Image.asset("assets/icons/${ controller.selectedTap == "s"?"storeIconDrawer.png":"storeIconDrawer1.png"}",fit: BoxFit.contain,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right:0,
                                child: Container(
                                  width:Get.width*0.35,
                                  height:Get.height*0.08,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(10),
                                    color:Colors.transparent,

                                  ),
                                  child:Center(
                                    child:  Container(
                                      width:Get.width*0.3,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            // Implement the stroke
                                            CustomText(
                                              favTap2.tr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =3
                                                  ..color = kBackGroundColor,
                                              ),
                                            ),
                                            // The text inside
                                            CustomText(
                                              favTap2.tr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                color: controller.selectedTap == "s"?kDarkPinkColor:kLightPinkColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ),

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          controller.selectingTap("p");
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top:10.0,bottom:10),
                          child: Stack(
                            children: [
                              Container(
                                width:Get.width*0.45,
                                height:Get.height*0.08,
                                decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),

                                  gradient:  LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: controller.selectedTap == "p"?[kDarkPinkColor,kLightPinkColor]:[Colors.white,Colors.white],
                                  ),
                                ),
                              ),
                              Positioned(
                                top:0,
                                left:0,
                                child: Container(
                                  height:Get.height*0.08,
                                  width: Get.width*0.21,
                                  decoration:const BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/cakeBG.png",
                                      ),
                                      fit:  BoxFit.cover,
                                    ),

                                  ),
                                ),
                              ),
                              Positioned(
                                left:10,
                                top:5,
                                child: Container(
                                  width:Get.width*0.1,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.end,
                                    children: [


                                      SizedBox(
                                        height: Get.height*0.05,
                                        width:Get.width*0.1,
                                        child: Image.asset('assets/icons/${controller.selectedTap == 1?"productIconDrawer.png":"productIconDrawer1.png"}',fit: BoxFit.contain,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right:0,
                                child: Container(
                                  width:Get.width*0.35,
                                  height:Get.height*0.08,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(10),
                                    color:Colors.transparent,

                                  ),
                                  child:Center(
                                    child:  Container(
                                      width:Get.width*0.3,
                                      child: Center(
                                        child: Stack(
                                          children: [
                                            // Implement the stroke
                                            CustomText(
                                              favTap1.tr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth =3
                                                  ..color = kBackGroundColor,
                                              ),
                                            ),
                                            // The text inside
                                            CustomText(
                                              favTap1.tr,
                                              style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                color:  controller.selectedTap == "p"?kDarkPinkColor:kLightPinkColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ),

                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: Get.width,
                      child:  Text(mainCategoryTitle.tr,
                        textAlign: TextAlign.start,
                        style:  TextStyle(
                            fontFamily: Get
                                .find<StorageService>()
                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                            color: kDarkPinkColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  controller.isLoading? Center(
                    child: Container(
                      width: Get.width*0.9,
                      height: Get.height*0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBackGroundColor,
                        border: Border.all(width: 1, color: kDarkPinkColor),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5, //soften the shadow
                            spreadRadius: 0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            CustomText(
                              loadingKey.tr,
                              style:  TextStyle(
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: kDarkPinkColor,
                                height: 1,
                                letterSpacing: -1,
                              ),
                            ) .animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color: kLightPinkColor)
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                            const SizedBox(height: 10,),
                            Image.asset("assets/images/logo sprinkles.png",width: 150,height: 150,fit: BoxFit.contain).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kLightPinkColor)
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ],
                        ),
                      ),
                    ).animate(onPlay: (controller) => controller.repeat())

                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide(),
                  ):
                  PopupMenuButton<String>(
                    itemBuilder: (context) =>
                        controller.mainCategoryList!.map((e){
                          return   PopupMenuItem(
                            value:"${e.id}",
                            textStyle:  TextStyle(
                                color: kDarkPinkColor,
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                fontWeight: FontWeight.w600),
                            onTap: (){
                              controller.choosingMainCategory(e);
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                              height: 40,
                                width:40,
                                decoration: const BoxDecoration(
                                    color:kDarkPinkColor,
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: CachedNetworkImage(
                                    fit:  BoxFit.contain,
                                    imageUrl:"${Services.baseEndPoint}${e.img}",
                                    imageBuilder: ((context, image){
                                      return   Container(
                                          height: 30,
                                          width:30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: image,
                                              fit:  BoxFit.fitHeight,
                                            ),
                                          ));
                                    }),
                                    placeholder: (context, image){
                                      return   Container(

                                        height: 30,
                                        width:30,
                                        decoration:BoxDecoration(
                                          color:  const Color(0xFFF2F0F3),
                                          borderRadius: BorderRadius.circular(50),
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
                                        ),
                                        child:Center(
                                          child: Container(
                                            height: 20,
                                            width:20,
                                            decoration:BoxDecoration(
                                              color:  const Color(0xFFDFDDDF),
                                              borderRadius: BorderRadius.circular(50),

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate() // this wraps the previous Animate in another Animate
                                          ,
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          ;
                                    },
                                    errorWidget: (context, url, error){
                                      return SizedBox(
                                        height: 30,
                                        width:30,
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                      );
                                    },
                                  ),
                                ),
                              ),
                                      const SizedBox(width: 10,),
                                      CustomText(
                                        Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn??"":e.name??"",
                                        style:  TextStyle(
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: kDarkPinkColor,
                                    height: 1,
                                    thickness: 1,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                    child: Center(
                      child: Container(
                        width: Get.width*0.9,
                        height: Get.height*0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDarkPinkColor,width: 1)
                        ),
                        child:   Center(
                          child:  controller.mainCategoryName==""?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                mainCategoryText1.tr,
                                style:  TextStyle(
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 25,
                                width: 20,
                                child: Image.asset("assets/icons/searchIconDrawer.png",fit: BoxFit.fitHeight,),
                              ),

                            ],
                          ):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                mainCategoryText2.tr,
                                style:  TextStyle(
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: Get.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                height: 40,
                                  width:40,
                                  decoration: const BoxDecoration(
                                      color:kDarkPinkColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Center(
                                    child: CachedNetworkImage(
                                      fit:  BoxFit.contain,
                                      imageUrl:controller.mainCategoryImageURl,
                                      imageBuilder: ((context, image){
                                        return   Container(
                                            height: 30,
                                            width:30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: image,
                                                fit:  BoxFit.fitHeight,
                                              ),
                                            ));
                                      }),
                                      placeholder: (context, image){
                                        return   Container(

                                          height: 30,
                                          width:30,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(50),
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
                                          ),
                                          child:Center(
                                            child: Container(
                                              height: 20,
                                              width:20,
                                              decoration:BoxDecoration(
                                                color:  const Color(0xFFDFDDDF),
                                                borderRadius: BorderRadius.circular(50),

                                              ),
                                            ).animate(onPlay: (controller) => controller.repeat())
                                                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                                .animate() // this wraps the previous Animate in another Animate
                                            ,
                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            ;
                                      },
                                      errorWidget: (context, url, error){
                                        return SizedBox(
                                          height: 30,
                                          width:30,
                                          child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                        ,const SizedBox(width: 10,),
                                        Text(controller.mainCategoryName,
                                          style:  TextStyle(
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),),
                                      ],
                                    ),
                                    const SizedBox(height: 3,),
                                    const Divider(
                                      color: kDarkPinkColor,
                                      height: 1,
                                      thickness: 1,
                                      endIndent: 0,
                                      indent: 0,
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),



                  ///seprate
                  controller.selectedTap != "p"?const SizedBox():controller.mainCategoryName == ""?const SizedBox():const SizedBox(
                    height: 10,
                  ),
                  controller.selectedTap != "p"?const SizedBox():controller.mainCategoryName == ""?const SizedBox():const Divider(
                    color: kDarkPinkColor,
                    height: 0.5,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  controller.selectedTap != "p"?const SizedBox():  controller.mainCategoryName == ""?const SizedBox():const SizedBox(
                    height: 10,
                  ),
                  controller.selectedTap != "p"?const SizedBox(): controller.mainCategoryName == ""?const SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: Get.width,
                      child:  Text(subCategoryTitle.tr,
                        textAlign: TextAlign.start,
                        style:  TextStyle(
                            fontFamily: Get
                                .find<StorageService>()
                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                            color: kDarkPinkColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  controller.selectedTap != "p"?const SizedBox(): controller.mainCategoryName == ""?const SizedBox():const SizedBox(
                    height: 10,
                  ),
                  controller.selectedTap != "p"?const SizedBox():controller.mainCategoryName == ""?const SizedBox():controller.categoryIsLoading? Center(
                    child: Container(
                      width: Get.width*0.9,
                      height: Get.height*0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kBackGroundColor,
                        border: Border.all(width: 1, color: kDarkPinkColor),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5, //soften the shadow
                            spreadRadius: 0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            CustomText(
                              loadingKey.tr,
                              style:  TextStyle(
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: kDarkPinkColor,
                                height: 1,
                                letterSpacing: -1,
                              ),
                            ) .animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color: kLightPinkColor)
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                            const SizedBox(height: 10,),
                            Image.asset("assets/images/logo sprinkles.png",width: 150,height: 150,fit: BoxFit.contain,).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kLightPinkColor)
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                                .slide(),
                          ],
                        ),
                      ),
                    ).animate(onPlay: (controller) => controller.repeat())

                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                        .slide(),
                  ):
                  PopupMenuButton<String>(
                    itemBuilder: (context) =>
                        controller.subCategoryList!.map((e){
                          return   PopupMenuItem(
                            value:"${e.id}",
                            textStyle: const TextStyle(
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                                fontWeight: FontWeight.w600),
                            onTap: (){
                              controller.choosingSubCategory(e);
                            },
                            child: SizedBox(
                              width: Get.width,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                     Container(
                              height: 40,
                                width:40,
                                decoration: const BoxDecoration(
                                    color:kDarkPinkColor,
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: CachedNetworkImage(
                                    fit:  BoxFit.contain,
                                    imageUrl:"${Services.baseEndPoint}${e.img}",
                                    imageBuilder: ((context, image){
                                      return   Container(
                                          height: 30,
                                          width:30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: image,
                                              fit:  BoxFit.fitHeight,
                                            ),
                                          ));
                                    }),
                                    placeholder: (context, image){
                                      return   Container(

                                        height: 30,
                                        width:30,
                                        decoration:BoxDecoration(
                                          color:  const Color(0xFFF2F0F3),
                                          borderRadius: BorderRadius.circular(50),
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
                                        ),
                                        child:Center(
                                          child: Container(
                                            height: 20,
                                            width:20,
                                            decoration:BoxDecoration(
                                              color:  const Color(0xFFDFDDDF),
                                              borderRadius: BorderRadius.circular(50),

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate() // this wraps the previous Animate in another Animate
                                          ,
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          ;
                                    },
                                    errorWidget: (context, url, error){
                                      return SizedBox(
                                        height: 30,
                                        width:30,
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                      );
                                    },
                                  ),
                                ),
                              ),
                                      const SizedBox(width: 10,),
                                      CustomText(
                                        Get.find<StorageService>().activeLocale == SupportedLocales.english?e.nameEn??"":e.name??"",
                                        style: const TextStyle(
                                            fontFamily: fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: kDarkPinkColor,
                                    height: 1,
                                    thickness: 1,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                    child: Center(
                      child: Container(
                        width: Get.width*0.9,
                        height: Get.height*0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDarkPinkColor,width: 1)
                        ),
                        child:   Center(
                          child:  controller.subCategoryName==""?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                subCategoryText1.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 25,
                                width: 20,
                                child: Image.asset("assets/icons/searchIconDrawer.png",fit: BoxFit.fitWidth,),
                              ),

                            ],
                          ):
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                subCategoryText2.tr,
                                style: const TextStyle(
                                    fontFamily: fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: Get.width*0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Row(
                                     children: [
                                       Container(
                                         height: 40,
                                         width:40,
                                         decoration: const BoxDecoration(
                                             color:kDarkPinkColor,
                                             shape: BoxShape.circle
                                         ),
                                         child: Center(
                                           child: CachedNetworkImage(
                                             fit:  BoxFit.contain,
                                             imageUrl:controller.subCategoryImageURl,
                                             imageBuilder: ((context, image){
                                               return   Container(
                                                   height: 30,
                                                   width:30,
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     image: DecorationImage(
                                                       image: image,
                                                       fit:  BoxFit.fitHeight,
                                                     ),
                                                   ));
                                             }),
                                             placeholder: (context, image){
                                               return   Container(

                                                   height: 30,
                                                   width:30,
                                                 decoration:BoxDecoration(
                                                   color:  const Color(0xFFF2F0F3),
                                                   borderRadius: BorderRadius.circular(50),
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
                                                 ),
                                                 child:Center(
                                                   child: Container(
                                               height: 20,
                                               width:20,
                                                     decoration:BoxDecoration(
                                                       color:  const Color(0xFFDFDDDF),
                                                       borderRadius: BorderRadius.circular(50),

                                                     ),
                                                   ).animate(onPlay: (controller) => controller.repeat())
                                                       .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                                       .animate() // this wraps the previous Animate in another Animate
                                                   ,
                                                 ),
                                               ).animate(onPlay: (controller) => controller.repeat())
                                                   .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                                   .animate() // this wraps the previous Animate in another Animate
                                                   ;
                                             },
                                             errorWidget: (context, url, error){
                                               return SizedBox(
                                                 height: 30,
                                                 width:30,
                                                 child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                               );
                                             },
                                           ),
                                         ),
                                       ),
                                       const SizedBox(width: 10,),
                                       Text(controller.subCategoryName,
                                         style: const TextStyle(
                                             fontFamily: fontFamilyArabicName,
                                             color: kDarkPinkColor,
                                             fontWeight: FontWeight.w600,
                                             fontSize: 15),),
                                     ],
                                   ),
                                    const SizedBox(height: 3,),
                                    const Divider(
                                      color: kDarkPinkColor,
                                      height: 1,
                                      thickness: 1,
                                      endIndent: 0,
                                      indent: 0,
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: kDarkPinkColor,
                    height: 0.5,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  controller.mainCategoryName == ""?const SizedBox():const SizedBox(
                    height: 10,
                  ),

                  controller.selectedTap != "p"?const SizedBox():Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: Get.width,
                      child:  CustomText(searchPriceTitle.tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: Get
                                .find<StorageService>()
                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                            color: kDarkPinkColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  controller.selectedTap != "p"?const SizedBox(): const SizedBox(
                    height: 10,
                  ),
                  controller.selectedTap != "p"?const SizedBox():Center(
                    child: Container(
                      width: Get.width*0.9,
                      height: Get.height*0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kDarkPinkColor,width: 1)
                      ),
                      child:   Center(
                        child: Wrap(
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                showValueIndicator: ShowValueIndicator.always,
                                thumbShape:
                                const RoundSliderThumbShape(enabledThumbRadius: 10),
                                trackHeight: 1
                              ),
                              child: RangeSlider(
                                min: 0,
                                max: 1000,
                                activeColor:kDarkPinkColor,
                                inactiveColor: kLightPinkColor,
                                labels: RangeLabels(
                                  controller.currentRangeValues.start
                                      .round()
                                      .toString()
                                      ,
                                  controller.currentRangeValues.end
                                      .round()
                                      .toString()
                                      ,
                                ),
                                values:controller.currentRangeValues,
                                onChanged: (value) {
                                  controller.choosingPriceRange(value);
                                },
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                  controller.selectedTap != "p"?const SizedBox():const SizedBox(height: 10,),
                  controller.selectedTap != "p"?const SizedBox():Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Get.width*0.35,
                        height: Get.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDarkPinkColor,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.startPriceRange,
                            maxLength: 3,
                            onFieldSubmitted: controller.changeStartPrice,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: Get
                                  .find<StorageService>()
                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                              fontWeight: FontWeight.w600,
                              color: kLightPinkColor,
                            ),
                            decoration:   InputDecoration(
                                labelText: searchPriceText1.tr,
                                counterText: '',

                                labelStyle:  TextStyle(
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kDarkPinkColor,width: 2),
                                  //  when the TextFormField in unfocused
                                ) ,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kDarkPinkColor,width: 2),
                                  //  when the TextFormField in focused
                                ) ,
                                border: const UnderlineInputBorder(
                                )
                            ),
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width*0.35,
                        height: Get.height*0.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDarkPinkColor,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLength: 3,
                            controller: controller.endPriceRange,
                            onFieldSubmitted: controller.changeEndPrice,
                            style:   TextStyle(
                              fontSize: 15.0,
                              fontFamily: Get
                                  .find<StorageService>()
                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                              fontWeight: FontWeight.w600,
                              color: kLightPinkColor,
                            ),
                            decoration:   InputDecoration(
                                labelText: searchPriceText2.tr,
                                counterText: '',

                                labelStyle: const TextStyle(
                                    fontFamily: fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kDarkPinkColor,width: 2),
                                  //  when the TextFormField in unfocused
                                ) ,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: kDarkPinkColor,width: 2),
                                  //  when the TextFormField in focused
                                ) ,
                                border: const UnderlineInputBorder(
                                )
                            ),
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  controller.selectedTap != "p"?const SizedBox():const SizedBox(
                    height: 10,
                  ),
                  controller.selectedTap != "p"?const SizedBox():const Divider(
                    color: kDarkPinkColor,
                    height: 0.5,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: Get.width,
                      child:  CustomText(searchRateTitle.tr,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: Get
                                .find<StorageService>()
                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                            color: kDarkPinkColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PopupMenuButton<String>(
                    itemBuilder: (context) =>
                        controller.ratingsListData.map((e){
                          return   PopupMenuItem(
                            value:e.title,
                            textStyle: TextStyle(
                                color: kDarkPinkColor,
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                fontWeight: FontWeight.w700),
                            onTap: (){
                              controller.choosingRating(e);
                            },
                            child: SizedBox(
                              width: Get.width*0.9,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                       e.title??"",
                                        style:  TextStyle(
                                            color: kDarkPinkColor,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      StarRating(
                                        color: kDarkPinkColor,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        length: 5,
                                        rating: double.parse(e.id??""),
                                        between: 0,
                                        starSize: 20,
                                        onRaitingTap: (rating) {

                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: kDarkPinkColor,
                                    height: 0.5,
                                    thickness: 2,
                                    endIndent: 0,
                                    indent: 0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),

                    child: Center(
                      child: Container(
                        width: Get.width*0.9,
                        height: Get.height*0.07,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kDarkPinkColor,width: 1)
                        ),
                        child:   Center(
                          child:  controller.ratingName==""? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                searchRateText1.tr,
                                style: TextStyle(
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.star,color: kDarkPinkColor,size: 20,)

                            ],
                          ):Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text(
                                searchRateText2.tr,
                                style:  TextStyle(
                                    fontFamily: Get
                                        .find<StorageService>()
                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: Get.width*0.55,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                          controller.ratingName,
                                          style:  TextStyle(
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13),

                                        ),
                                        StarRating(
                                          color: kDarkPinkColor,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          length: 5,
                                          rating: double.parse(controller.ratingId),
                                          between: 0,
                                          starSize: 20,
                                          onRaitingTap: (rating) {

                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    const Divider(
                                      color: kDarkPinkColor,
                                      height: 1,
                                      thickness: 2,
                                      endIndent: 0,
                                      indent: 0,
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: kDarkPinkColor,
                    height: 0.5,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),


                  Center(
                    child: InkWell(
                      onTap: (){
                        controller.startSearching(context);



                      },
                      child: Container(
                        width: Get.width*0.35,
                        height: Get.height*0.08,
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
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search_outlined,
                              weight: 30,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              advancedSearchBTN.tr,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
      ),
            ),
          )
      ),
    );
  }
}
