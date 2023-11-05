// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/purchase_history/controller/purchase_history_controller.dart';
import 'package:sprinkles/ui/purchase_history/widget/loading_widget.dart';
import 'package:sprinkles/ui/purchase_history/widget/purchase_history_cell.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  PurchaseHistoryController(),
      builder: (PurchaseHistoryController controller)=>  Scaffold(
      appBar: AppBar(
      backgroundColor:kBackGroundColor,
      flexibleSpace: Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [kDarkPinkColor,kLightPinkColor],
      ),
      )),

      centerTitle:true,
      title: Stack(
      children: [
      // Implement the stroke
      CustomText(
      drawerTag12.tr,
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
      drawerTag12.tr,
      style: TextStyle(
      fontSize: 15,
      letterSpacing: 0,
      fontWeight: FontWeight.w900,
      fontFamily: Get
          .find<StorageService>()
          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
      color: kDarkPinkColor,
      ),
      ),
      ],
      ),
      leadingWidth:Get.width*0.25,
      leading:
      InkWell(
      onTap:(){
      Get.back();
      },
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(

      decoration: BoxDecoration(
      color:Colors.white,
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
      borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children:[
      const Icon(
      Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:15
      ),
      CustomText(
      goBack.tr,
      textAlign:TextAlign.left,
      style: TextStyle(
      height:1,
      shadows: <Shadow>[
      Shadow(
      offset: const Offset(0.5, 0.5),
      blurRadius: 0.5,

      color: Colors.black.withOpacity(0.5)
      ),
      ],
      fontSize: 13,
      letterSpacing: 0,
      fontFamily: Get
          .find<StorageService>()
          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
      color: kDarkPinkColor,
      ),
      ),
      ]

      ),
      ),
      ),
      )

      ),
        backgroundColor: kBackGroundColor,
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              controller.getNextTap();
            }

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              controller.getPreviousTap();
            }
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
            children: [
              //selector of order type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      controller.getNextTap();
                    },
                    child: const Icon(
                        Icons.arrow_back_ios_rounded  ,color:kLightPinkColor,size:35
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom:10),
                    child: Stack(
                      children: [
                        Container(
                          width:Get.width*0.75,
                          height:Get.height*0.08,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            border: Border.all(width: 2,color: kLightPinkColor),
                            gradient:  const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors:[Colors.white,Colors.white],
                            ),
                          ),
                        ),
                        Positioned(
                          top:0,
                          right:0,
                          child: Container(
                            height:Get.height*0.08,
                            width: Get.width*0.25,
                            decoration:const BoxDecoration(
                              borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/cakeBG1.png",
                                ),
                                fit:  BoxFit.cover,
                              ),

                            ),
                          ),
                        ),
                        Positioned(
                          right:10,
                          top:0,
                          child: SizedBox(
                            width:Get.width*0.12,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.end,
                              children: [


                                SizedBox(
                                  height: Get.height*0.07,
                                  width:Get.width*0.11,
                                  child: Image.asset('assets/icons/${controller.orderTapsImages[controller.activeIndex]}',fit: BoxFit.contain,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left:0,
                          child: Container(
                            width:Get.width*0.5,
                            height:Get.height*0.08,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(10),

                              color:Colors.transparent,

                            ),
                            child:Center(
                              child:  SizedBox(
                                width:Get.width*0.5,
                                child: Center(
                                  child: Stack(
                                    children: [
                                      // Implement the stroke
                                      CustomText(
                                        controller.orderTapsTitle[controller.activeIndex],
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
                                        controller.orderTapsTitle[controller.activeIndex],
                                        style:  TextStyle(
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: Get
                                              .find<StorageService>()
                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                          color:kLightPinkColor,
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
                  InkWell(
                    onTap: (){
                      controller.getPreviousTap();
                    },
                    child: const Icon(
                        Icons.arrow_forward_ios_rounded  ,color:kLightPinkColor,size:35
                    ),
                  ),
                ],
              ),
              controller.isLoading?const LoadingWidget():controller.ordersList?.length == 0?Column(
                  children:[
                    SizedBox(
                      height: Get.height*0.6,
                      width: Get.width*0.6,
                      child: Image.asset("assets/images/Add to Cart-amico.png",fit: BoxFit.fitWidth,),
                    ),
                    const SizedBox(
                        height:50
                    ),
                    CustomText(
                      controller.orderTapsWarning[controller.activeIndex],
                      style: const TextStyle(
                        fontSize:25,
                        fontFamily: fontFamilyEnglishName,
                        fontWeight: FontWeight.w600,
                        color: kDarkPinkColor,
                      ),
                    ),
                  ]
              )
                  :SizedBox(
                height: Get.height*0.77,
                width: Get.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount:controller.ordersList?.length,
                  itemBuilder: (_, index) =>
                  PurchaseHistoryCell(data: controller.ordersList?[index], counter: controller.activeIndex,),
                ),
              )


            ],
            ),
          ),
        )

      ),
    );
  }
}
