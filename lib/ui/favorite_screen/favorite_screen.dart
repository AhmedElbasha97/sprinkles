// ignore_for_file: sized_box_for_whitespace, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/favorite_screen/controller/favorite_controller.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_loading_widget.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_loading_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  FavoriteController(context),
      builder: (FavoriteController controller) => Scaffold(
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
                  favTitle.tr,
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                    fontFamily: fontFamilyArabicName,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth =3
                      ..color = kBackGroundColor,
                  ),
                ),
                // The text inside
                 CustomText(
                  favTitle.tr,
                  style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w900,
                    fontFamily: fontFamilyArabicName,
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
                            fontFamily: fontFamilyArabicName,
                            color: kDarkPinkColor,
                          ),
                        ),
                      ]

                  ),
                ),
              ),
            )

        ),
        backgroundColor:kBackGroundColor,
        body:  SingleChildScrollView(
          child: Column(
            children:[
             Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:(){
                  controller.selectingTap(0);
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
                            colors: controller.selectedTap == 0?[kDarkPinkColor,kLightPinkColor]:[Colors.white,Colors.white],
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
                                child: Image.asset("assets/icons/${controller.selectedTap == 0?"storeIconDrawer.png":"storeIconDrawer1.png"}",fit: BoxFit.contain,),
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
                                        fontFamily: fontFamilyArabicName,
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
                                        fontFamily: fontFamilyArabicName,
                                        color: controller.selectedTap == 0?kDarkPinkColor:kLightPinkColor,
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
                  controller.selectingTap(1);
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
                            colors: controller.selectedTap == 1?[kDarkPinkColor,kLightPinkColor]:[Colors.white,Colors.white],
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
                                        fontFamily: fontFamilyArabicName,
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
                                        fontFamily: fontFamilyArabicName,
                                        color: controller.selectedTap == 1?kDarkPinkColor:kLightPinkColor,
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
          controller.selectedTap == 0?controller.isLoading?const StoreLoadingWidget():controller.shopFavList?.length == 0? Padding(
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
                     noFavDataStoreList.tr,
                    textAlign:TextAlign.center,
                    style: const TextStyle(
                      fontSize:25,
                      fontFamily: fontFamilyArabicName,
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
                  noFavDataProductList.tr,
                  textAlign:TextAlign.center,
                  style: const TextStyle(
                    fontSize:25,
                    fontFamily: fontFamilyEnglishName,
                    fontWeight: FontWeight.w600,
                    color: kDarkPinkColor,
                  ),
                ),
              ]
          ):Column(
              children:
              controller.products

          ),
            ]
          ),
        ),
      ),
    );
  }
}
