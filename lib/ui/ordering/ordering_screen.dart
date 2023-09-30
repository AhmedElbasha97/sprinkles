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
import 'package:sprinkles/ui/ordering/controller/ordering_controller.dart';
import 'package:sprinkles/ui/ordering/widget/filter_loading.dart';
import 'package:sprinkles/ui/ordering/widget/filter_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class OrderingScreen extends StatelessWidget {
  final int productId;
  const OrderingScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init:  OrderingController(productId: productId),
        builder: (OrderingController controller)=> Scaffold(
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
                  orderNowBTN.tr,
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
                  orderNowBTN.tr,
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
                          'رجوع',
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
            children: [
              Get.find<StorageService>().activeLocale == SupportedLocales.english?Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      width:Get.width,
                      height:Get.height*0.195,
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.white,
                          border: Border.all(color: kDarkPinkColor,width: 1)
                      ),
                    ),
                    Positioned(
                        bottom:0,
                        left:0,
                        child:Container(
                          height:Get.height*0.09,
                          width: Get.width*0.3,
                          decoration:const BoxDecoration(
                            borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/Image 2.png",
                              ),
                              fit:  BoxFit.cover,
                            ),

                          ),
                        )
                    ),
                    Positioned(
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height:Get.height*0.175,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  controller.dataIsLoading? Container(
                                    width:Get.width*0.5,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide():
                                  Container(
                                    width:Get.width*0.5,
                                    child: CustomText(
                                      Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(

                                        shadows: <Shadow>[
                                          Shadow(
                                              offset: const Offset(0.5, 0.5),
                                              blurRadius: 0.5,

                                              color: Colors.black.withOpacity(0.5)
                                          ),

                                        ],

                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  controller.dataIsLoading? Container(
                                    width:Get.width*0.4,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide():
                                  Container(
                                    width:Get.width*0.5,
                                    child: CustomText(
                                      "${priceKey.tr} ${controller.data?.price??""} ${currencyKey.tr}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(

                                        shadows: <Shadow>[
                                          Shadow(
                                              offset: const Offset(0.5, 0.5),
                                              blurRadius: 0.5,

                                              color: Colors.black.withOpacity(0.5)
                                          ),

                                        ],

                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Container(
                                      width:Get.width*0.5,
                                      child: Row(
                                        children: [
                                          controller.dataIsLoading? Container(
                                            width:Get.width*0.2,
                                            height: 13,
                                            decoration: BoxDecoration(
                                                color:  const Color(0xFFF2F0F3),
                                                borderRadius: BorderRadius.circular(50)
                                            ),

                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(): Container(
                                            width:Get.width*0.35,
                                            child: CustomText(
                                              Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.shop?.nameEn??"":controller.data?.shop?.name??"",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontFamily: fontFamilyArabicName,
                                                color: kLightPinkColor,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                          const SizedBox(width: 5,),
                                          controller.dataIsLoading?Container(
                                            width:Get.width*0.1,
                                            height:Get.height*0.05,
                                            decoration:BoxDecoration(
                                              color: const Color(0xFFDFDDDF),
                                              borderRadius: BorderRadius.circular(50),

                                            ),
                                            child:  Center(
                                              child: Container(

                                                width:Get.width*0.065,
                                                height:Get.height*0.03,
                                                decoration:BoxDecoration(
                                                  color:  const Color(0xFFF2F0F3),
                                                  borderRadius: BorderRadius.circular(15),

                                                ),
                                              ).animate(onPlay: (controller) => controller.repeat())
                                                  .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                                  .animate() // this wraps the previous Animate in another Animate
                                              ,
                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate():CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: "http://sprinkles-qa.com${controller.data?.shop?.image??""}",
                                            imageBuilder: ((context, image){
                                              return  ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Container(
                                                    width:Get.width*0.1,
                                                    height:Get.height*0.05,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: image,
                                                        fit:  BoxFit.cover,
                                                      ),
                                                    )
                                                ),
                                              );
                                            }),
                                            placeholder: (context, image){
                                              return   Container(

                                                width:Get.width*0.1,
                                                height:Get.height*0.05,
                                                decoration:BoxDecoration(
                                                  color:  const Color(0xFFF2F0F3),
                                                  borderRadius: BorderRadius.circular(15),
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

                                                    width:Get.width*0.065,
                                                    height:Get.height*0.03,
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
                                                width:Get.width*0.1,
                                                height:Get.height*0.05,
                                                child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                              );
                                            },
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20,),
                            controller.dataIsLoading? Container(

                              width:Get.width*0.4,
                              height:Get.height*0.16,
                              decoration:BoxDecoration(
                                color:  const Color(0xFFF2F0F3),
                                borderRadius: BorderRadius.circular(15),
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

                                  width:Get.width*0.37,
                                  height:Get.height*0.13,
                                  decoration:BoxDecoration(
                                    color:  const Color(0xFFDFDDDF),
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate() // this wraps the previous Animate in another Animate
                                ,
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                .animate() // this wraps the previous Animate in another Animate
                                :CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:"${Services.baseEndPoint}${controller.data?.images?[0]??""}",
                              imageBuilder: ((context, image){
                                return  ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      width:Get.width*0.4,
                                      height:Get.height*0.16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: image,
                                          fit:  BoxFit.cover,
                                        ),
                                      )
                                  ),
                                );
                              }),
                              placeholder: (context, image){
                                return   Container(

                                  width:Get.width*0.4,
                                  height:Get.height*0.16,
                                  decoration:BoxDecoration(
                                    color:  const Color(0xFFF2F0F3),
                                    borderRadius: BorderRadius.circular(15),
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

                                      width:Get.width*0.37,
                                      height:Get.height*0.13,
                                      decoration:BoxDecoration(
                                        color:  const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(15),

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
                                  width:Get.width*0.4,
                                  height:Get.height*0.16,
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                );
                              },
                            ),


                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ):
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      width:Get.width,
                      height:Get.height*0.195,
                      decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:Colors.white,
                        border: Border.all(color: kDarkPinkColor,width: 1)
                      ),
                    ),
                    Positioned(
                      bottom:0,
                      left:0,
                      child:Container(
                        height:Get.height*0.09,
                        width: Get.width*0.3,
                        decoration:const BoxDecoration(
                          borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/Image 2.png",
                            ),
                            fit:  BoxFit.cover,
                          ),

                        ),
                      )
                    ),
                    Positioned(
                      top: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.dataIsLoading? Container(

                              width:Get.width*0.4,
                              height:Get.height*0.16,
                              decoration:BoxDecoration(
                                color:  const Color(0xFFF2F0F3),
                                borderRadius: BorderRadius.circular(15),
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

                                  width:Get.width*0.37,
                                  height:Get.height*0.13,
                                  decoration:BoxDecoration(
                                    color:  const Color(0xFFDFDDDF),
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate() // this wraps the previous Animate in another Animate
                                ,
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                .animate() // this wraps the previous Animate in another Animate
                                :CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:"${Services.baseEndPoint}${controller.data?.images?[0]??""}",
                              imageBuilder: ((context, image){
                                return  ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      width:Get.width*0.4,
                                      height:Get.height*0.16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: image,
                                          fit:  BoxFit.cover,
                                        ),
                                      )
                                  ),
                                );
                              }),
                              placeholder: (context, image){
                                return   Container(

                                  width:Get.width*0.4,
                                  height:Get.height*0.16,
                                  decoration:BoxDecoration(
                                    color:  const Color(0xFFF2F0F3),
                                    borderRadius: BorderRadius.circular(15),
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

                                      width:Get.width*0.37,
                                      height:Get.height*0.13,
                                      decoration:BoxDecoration(
                                        color:  const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(15),

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
                                  width:Get.width*0.4,
                                  height:Get.height*0.16,
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                );
                              },
                            ),
                           const SizedBox(width: 20,),
                           Container(
                              height:Get.height*0.175,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  controller.dataIsLoading? Container(
                                    width:Get.width*0.5,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide():Container(
                                    width:Get.width*0.5,
                                    child: CustomText(
                                      Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(

                                        shadows: <Shadow>[
                                          Shadow(
                                              offset: const Offset(0.5, 0.5),
                                              blurRadius: 0.5,

                                              color: Colors.black.withOpacity(0.5)
                                          ),

                                        ],

                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  controller.dataIsLoading? Container(
                                    width:Get.width*0.4,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide():Container(
                                    width:Get.width*0.5,
                                    child: CustomText(
                                      "السعر: ${controller.data?.price??""} ريال",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(

                                        shadows: <Shadow>[
                                          Shadow(
                                              offset: const Offset(0.5, 0.5),
                                              blurRadius: 0.5,

                                              color: Colors.black.withOpacity(0.5)
                                          ),

                                        ],

                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Container(
                                      width:Get.width*0.5,
                                      child: Row(
                                        children: [
                                      controller.dataIsLoading?Container(
                                        width:Get.width*0.1,
                                        height:Get.height*0.05,
                                        decoration:BoxDecoration(
                                          color: const Color(0xFFDFDDDF),
                                          borderRadius: BorderRadius.circular(50),

                                        ),
                                        child:  Center(
                                          child: Container(

                                            width:Get.width*0.065,
                                            height:Get.height*0.03,
                                            decoration:BoxDecoration(
                                              color:  const Color(0xFFF2F0F3),
                                              borderRadius: BorderRadius.circular(15),

                                            ),
                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate() // this wraps the previous Animate in another Animate
                                          ,
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate():CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: "http://sprinkles-qa.com${controller.data?.shop?.image??""}",
                                      imageBuilder: ((context, image){
                                        return  ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: Container(
                                              width:Get.width*0.1,
                                              height:Get.height*0.05,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: image,
                                                  fit:  BoxFit.cover,
                                                ),
                                              )
                                          ),
                                        );
                                      }),
                                      placeholder: (context, image){
                                        return   Container(

                                          width:Get.width*0.1,
                                          height:Get.height*0.05,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(15),
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

                                              width:Get.width*0.065,
                                              height:Get.height*0.03,
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
                                          width:Get.width*0.1,
                                          height:Get.height*0.05,
                                          child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                        );
                                      },
                                    ),
                                          const SizedBox(width: 5,),

                                          controller.dataIsLoading? Container(
                                            width:Get.width*0.2,
                                            height: 13,
                                            decoration: BoxDecoration(
                                                color:  const Color(0xFFF2F0F3),
                                                borderRadius: BorderRadius.circular(50)
                                            ),

                                          ).animate(onPlay: (controller) => controller.repeat())
                                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                              .animate() // this wraps the previous Animate in another Animate
                                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                              .slide(): Container(
                                            width:Get.width*0.35,
                                            child: CustomText(
                                              Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.shop?.nameEn??"":controller.data?.shop?.name??"",
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontFamily: fontFamilyArabicName,
                                                color: kLightPinkColor,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              controller.dataIsLoading?const FilterLoading(): ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:controller.data?.itemFilter?.length,
                itemBuilder: (_, index) =>
                    FilterWidget(data: controller.data?.itemFilter?[index],
                      selectingFilterTap: (e){
                      controller.choosingFilterValue(index,e);
                      },
                      selectedValue: controller.choosedData[index],)
              ),
              const SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: (){
                    controller.ordering();
                  },
                  child: Container(
                    width: Get.width*0.65,
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
                          Icons.shopping_cart,
                          weight: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          orderNowBTN.tr,
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
                            color: kBackGroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ) ,
      ),
    );
  }
}
