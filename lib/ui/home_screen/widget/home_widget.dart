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
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/ui/product_screen/product_screen.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, this.category}) : super(key: key);
  final CategoryModel? category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.to(()=> ProductScreen(mainCategoryId: category?.id??0, selectingFromDrawer: false, mainCategoryImg:  category?.img2??"",));
      },
      child: Get.find<StorageService>().activeLocale == SupportedLocales.english?Stack(
          children:[
            Container(
              height: Get.height*0.15,
              width:Get.width*0.95,
              child:const Padding(padding: EdgeInsets.all(0),
              ),
            ),
            Positioned(
              bottom:Get.height*0.005,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0,18.0,0,18.0,),
                child: Container(
                  height: Get.height*0.09,
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Center(
                      child:  CustomText(
                        Get.find<StorageService>().activeLocale == SupportedLocales.english?category?.nameEn??"":category?.name??"",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          shadows: <Shadow>[
                            Shadow(
                                offset: const Offset(2.0, 2.0),
                                blurRadius: 13.0,

                                color: Colors.black.withOpacity(0.5)
                            ),
                          ],
                          fontSize: 20,
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
              left:0,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "${Services.baseEndPoint}${category?.img??""}",
                imageBuilder: ((context, image){
                  return   Container(
                      height: Get.height*0.15,
                      width: Get.width*0.31,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit:  BoxFit.fitHeight,
                        ),
                      ));
                }),
                placeholder: (context, image){
                  return   Container(

                    height: Get.height*0.14,
                    width: Get.width*0.29,
                    decoration:BoxDecoration(
                      color:  const Color(0xFFF2F0F3),
                      shape: BoxShape.circle,
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

                        height: Get.height*0.12,
                        width: Get.width*0.25,
                        decoration:const BoxDecoration(
                          color:  Color(0xFFDFDDDF),
                          shape: BoxShape.circle,

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
                    height: Get.height*0.15,
                    width: Get.width*0.3,
                    child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                  );
                },
              ),
            ),
          ]
      ):Stack(
          children:[
            Container(
              height: Get.height*0.15,
              width:Get.width*0.95,
              child:const Padding(padding: EdgeInsets.all(0),
              ),
            ),
            Positioned(
              bottom:Get.height*0.005,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: Get.height*0.09,
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
                  child:  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Center(
                      child:  CustomText(
                        Get.find<StorageService>().activeLocale == SupportedLocales.english?category?.nameEn??"":category?.name??"",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
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
              left:0,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "${Services.baseEndPoint}${category?.img??""}",
                imageBuilder: ((context, image){
                  return   Container(
                    height: Get.height*0.15,
                    width: Get.width*0.31,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: image,
                      fit:  BoxFit.fitHeight,
                  ),
                  ));
                }),
                placeholder: (context, image){
                  return   Container(

                    height: Get.height*0.14,
                    width: Get.width*0.29,
                    decoration:BoxDecoration(
                      color:  const Color(0xFFF2F0F3),
                      shape: BoxShape.circle,
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

                        height: Get.height*0.12,
                        width: Get.width*0.25,
                        decoration:const BoxDecoration(
                          color:  Color(0xFFDFDDDF),
                          shape: BoxShape.circle,

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
                    height: Get.height*0.15,
                    width: Get.width*0.3,
                    child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}
