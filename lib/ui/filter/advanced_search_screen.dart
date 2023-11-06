
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/filter/controller/filter_controller.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_loading_widget.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_loading_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/localization_services.dart';


class AdvancedSearchScreen extends StatelessWidget {


  const AdvancedSearchScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: GetBuilder<FilterController>(
        init: FilterController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
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
                          width:Get.width*0.7,
                          child:     Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,10,20.0,0),
                            child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,

                                children:[
                                  InkWell(
                                    onTap:(){
                                      Get.back();
                                    },
                                    child: Container(
                                      child: const Row(
                                          children:[
                                            Icon(
                                                Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width:10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10.0,10,10.0,0),
                                    child: CustomText(
                                      greetingText.tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,

                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15.0,0,15.0,0),
                                    child: Center(
                                      child: CustomText(
                                        advancedSearchTitle.tr,
                                        style: const TextStyle(

                                          fontSize: 22,
                                          letterSpacing: 0,
                                          fontFamily: fontFamilyArabicName,
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
                                      Get.back();
                                    },
                                    child: Container(
                                      child: const Row(
                                          children:[
                                            Icon(
                                                Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                                            ),
                                          ]
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width:10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,10.0,0),
                                    child: CustomText(
                                      greetingText.tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,

                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                    child: Center(
                                      child: CustomText(
                                        advancedSearchTitle.tr,
                                        style: const TextStyle(

                                          fontSize: 22,
                                          letterSpacing: 0,
                                          fontFamily: fontFamilyArabicName,
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
              const SizedBox(height: 10,),
              controller.selectedTap == "s"?controller.isLoading?const StoreLoadingWidget():controller.shopList?.length == 0? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children:[
                      SizedBox(
                        height: Get.height*0.4,
                        width: Get.width*0.6,
                        child: Image.asset("assets/images/we are open-cuate.png",fit: BoxFit.fitWidth,),
                      ),
                      const SizedBox(
                          height:50
                      ),
                      CustomText(
                        advancedSearchNoStoreData.tr,
                        textAlign:TextAlign.center,
                        style:  TextStyle(
                          fontSize:25,
                          fontFamily: Get
                              .find<StorageService>()
                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                          fontWeight: FontWeight.w900,

                          color: kDarkPinkColor,
                        ),
                      ),
                    ]
                ),
              ):Column(
                children:controller.storeListWidget,)
                  : controller.isLoading?const ProductLoadingWidget():controller.products.length == 0? Column(
                  children:[
                    SizedBox(
                      height: Get.height*0.4,
                      width: Get.width*0.6,
                      child: Image.asset("assets/images/Product quality-bro.png",fit: BoxFit.fitWidth,),
                    ),
                    const SizedBox(
                        height:50
                    ),
                    CustomText(
                      advancedSearchNoProductData.tr,
                      textAlign:TextAlign.center,
                      style:  TextStyle(
                        fontSize:25,
                        fontFamily: Get
                            .find<StorageService>()
                            .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                        fontWeight: FontWeight.w600,
                        color: kDarkPinkColor,
                      ),
                    ),
                  ]
              ):Column(
                  children:
                  controller.products

              ),
            ],
          ),
        ),
      ),


    );

  }
}