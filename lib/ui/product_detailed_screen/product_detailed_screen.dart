// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unnecessary_string_interpolations, prefer_is_empty

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/ui/product_detailed_screen/controller/product_detailed_controller.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/product_image_widget.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/read_more_widget.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/seller_product_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class ProductDetailedScreen extends StatelessWidget {
  const ProductDetailedScreen({Key? key, required this.productId}) : super(key: key);
  final String? productId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  ProductDetailedController(productId??""),
      builder: (ProductDetailedController controller) => Scaffold(
        appBar: AppBar(
          backgroundColor:kBackGroundColor,
            actions:[
              InkWell(

                onTap:(){
                  controller. showWarningFavorite(context);
                },
                child: Container(
                  child: Row(
                      children:[

                        CustomText(
                          'أضف إلى المفضلة',
                          textAlign:TextAlign.left,
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                  offset: const Offset(0.5, 0.5),
                                  blurRadius: 0.5,

                                  color: Colors.black.withOpacity(0.5)
                              ),
                            ],
                            fontSize: 12,
                            letterSpacing: 0,
                            fontFamily: fontFamilyArabicName,
                            color: kDarkPinkColor,
                          ),
                        ),
                        const Icon(
                            Icons.favorite_outline_rounded  ,color:kDarkPinkColor,size:20
                        ),
                      ]

                  ),
                ),
              )
            ],
            leading:
              InkWell(
                onTap:(){
                  Get.back();
                },
                child: Container(
                  child: Row(
                    children:[
                      const Icon(
                        Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                      ),
                      CustomText(
                        'رجوع',
                        textAlign:TextAlign.left,
                        style: TextStyle(
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
              )

        ),
        backgroundColor:kBackGroundColor,
        body:  SafeArea(
          child: SingleChildScrollView(
            controller:controller.scrollController,
            child: Container(
              width:Get.width,
              child: Column(
                children:[
                  controller.productIsLoading? Container(

              width:Get.width,
                height:Get.height*0.4,
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

                    width:Get.width*0.95,
                    height:Get.height*0.38,
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
              : controller.productData?.images?.length ==0?const SizedBox():
                  controller.productData?.images?.length ==1? Container(
                      width:Get.width,
                      height:Get.height*0.4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://cake.syncqatar.com${controller.productData!.images?[0]??""}",
                          ),
                          fit:  BoxFit.fill,
                        ),
                      )
                  ):Stack(
                    children: [

                      CarouselSlider.builder(
                        carouselController: controller.carouselController,
                        itemCount: controller.productData?.images?.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return ProductImageWidget(imageUrl: "${controller.productData?.images?[index]??""}", activeIndex: '${index+1}', imageTotalCount:"${controller.productData?.images?.length??0}",);
                        },
                        options: CarouselOptions(
                            height:Get.height*0.4,
                            autoPlay: true,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            onPageChanged: (val, _) {
                                controller.onImageChange(val);
                            }
                        ),
                      ),
                      Positioned(
                        bottom:10,

                        child: Container(

                          width:Get.width,
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Row(
                                children:controller.dotsList
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                      Container(
                      width:Get.width,
                      height:Get.height*0.14,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.white,

                        ),
                      ),
                        Positioned(
                          top:0,
                          left:0,
                          child: Container(
                            height:Get.height*0.14,
                            width: Get.width*0.35,
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
                          left:5,
                          child: Container(
                            width:Get.width*0.2,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.end,
                              children: [


                                SizedBox(
                                  height: Get.height*0.1,
                                  width:Get.width*0.2,
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right:0,
                          child: Container(
                              width:Get.width*0.65,
                              height:Get.height*0.14,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color:Colors.transparent,

                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      controller.productIsLoading?Center(
                                        child:   Container(
                                          width:Get.width*0.25,
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
                                          .slide():CustomText(
                                        Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.productData?.nameEn??"":controller.productData?.name??"",
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
                                      ),

                                      controller.productIsLoading?Center(
                                        child:   Container(
                                          width:Get.width*0.25,
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
                                          .slide():RatingBar.builder(
                                        initialRating:double.parse(controller.productData?.rating??"0"),
                                        minRating: double.parse(controller.productData?.rating??"0"),
                                        itemSize:20,
                                        direction: Axis.horizontal,
                                        ignoreGestures:true,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),

                                  controller.productIsLoading?Center(
                                    child:   Container(
                                      width:Get.width*0.25,
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
                                      .slide():CustomText(
                                    'السعر:${controller.productData?.price}ريال',
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset(0.5, 0.5),
                                            blurRadius: 0.5,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                      children:[
                                        controller.productIsLoading?Center(
                                          child:   Container(
                                            width:Get.width*0.25,
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
                                            .slide():InkWell(
                                          onTap:(){
                                            controller.makePhoneCall( '${controller.productData?.shop?.phone}');
                                          },
                                          child: Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height*0.03,
                                                width: Get.width*0.09,
                                                child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                              ),
                                              CustomText(
                                                '${controller.productData?.shop?.phone}',
                                                style: TextStyle(
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
                                            ],
                                          ),
                                        ),
                                        controller.productIsLoading?Center(
                                          child:   Container(
                                            width:Get.width*0.25,
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
                                            .slide():InkWell(
                                          onTap:(){
                                            controller.whatsapp('${controller.productData?.shop?.whatsapp}');
                                          },
                                          child: Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height*0.03,
                                                width: Get.width*0.09,
                                                child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
                                              ),
                                              CustomText(
                                                '${controller.productData?.shop?.whatsapp}',
                                                style: TextStyle(
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
                                            ],
                                          ),
                                        ),
                                      ]
                                    ),
                                  )
                                ]
                              ),
                            )

                          ),
                        ),

                      ],
                    ),
                  ),
              controller.productIsLoading? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:Get.width,
                  child: GridView.builder(
                    shrinkWrap:true,
                    controller:controller.scrollController,
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio:1.7
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return  Container(
                          height: Get.height*0.02,
                          width:Get.width*0.3,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                            color:Colors.white,
                          ),
                          child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Center(
                                  child:   Container(
                                    width:Get.width*0.25,
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
                                    .slide(),
                                Center(
                                  child:   Container(
                                    width:Get.width*0.25,
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
                                    .slide()
                              ]
                          ),
                          )
                      );
                    },
                  ),
                ),
              ):Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:Get.width,
                  child: GridView.builder(
                    shrinkWrap:true,
                    controller:controller.scrollController,
                    itemCount:controller.productData!.itemFilter?.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio:1.7
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return  Container(
                          height: Get.height*0.02,
                        width:Get.width*0.3,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                            color:Colors.white,
                          ),
                          child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                CustomText(
                                  Get.find<StorageService>().activeLocale == SupportedLocales.english?"${controller.productData!.itemFilter?[index].filterEn??""}":"${controller.productData!.itemFilter?[index].filter??""}",
                                  style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: const Offset(0.5, 0.5),
                                          blurRadius: 0.5,

                                          color: Colors.black.withOpacity(0.5)
                                      ),
                                    ],
                                    fontSize: 13,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w900,

                                    fontFamily: fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                  ),
                                ),
                                CustomText(
                                  Get.find<StorageService>().activeLocale == SupportedLocales.english?"${controller.productData!.itemFilter?[index].filterItemEn??""}":"${controller.productData!.itemFilter?[index].filterItem??""}",
                                  style: TextStyle(
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
                                    color: kLightPinkColor,
                                  ),
                                ),
                              ]
                          ),
                          )
                      );
                    },
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                  width:Get.width,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color:Colors.white,
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        'التفاصيل:',

                      textAlign:TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,

                          shadows: <Shadow>[
                            Shadow(
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 0.5,

                                color: Colors.black.withOpacity(0.5)
                            ),
                          ],
                          fontSize: 15,
                          letterSpacing: 0,
                          fontFamily: fontFamilyArabicName,
                          color: kDarkPinkColor,
                        ),
                      ),
                      controller.productIsLoading?Center(
                        child:   Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:Get.width*0.85,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:Get.width*0.85,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:Get.width*0.85,
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
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:Get.width*0.85,
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
                            ),
                          ],
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),


                      ): ReadMoreText(  Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.productData?.descEn??"":controller.productData?.desc??"", colorClickableText: kLightPinkColor, style:  const TextStyle(
                        fontSize: 13,
                        letterSpacing: 0,
                        fontFamily: fontFamilyArabicName,
                        color: kLightPinkColor,
                      ), textAlign: TextAlign.center, textDirection: TextDirection.rtl, semanticsLabel: '',),
                    ],
                  ),
                )
              ),
            ),

              Padding(
              padding: const EdgeInsets.all(8.0),
          child: Container(
              width:Get.width*0.95,
              height:Get.height*0.42,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color:Colors.white,
              ),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  CustomText(
                    'منتجات أخرى من نفس البائع:',
                    textAlign:TextAlign.left,
                    style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(
                            offset: const Offset(0.5, 0.5),
                            blurRadius: 0.5,

                            color: Colors.black.withOpacity(0.5)
                        ),
                      ],
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      letterSpacing: 0,
                      fontFamily: fontFamilyArabicName,
                      color: kDarkPinkColor,
                    ),
                  ),
                  controller.productIsLoading?const SellerProductLoadingWidget():controller.productsList?.length == 0?Row(
                      children:[
                        SizedBox(
                          width:Get.width*0.4,
                          height:Get.height*0.33,
                          child: Image.asset("assets/images/Product quality-bro.png",fit: BoxFit.fitWidth,),
                        ),
                        const SizedBox(
                            width:30
                        ),
                        SizedBox(
                          width:Get.width*0.4,
                          child: const CustomText(
                            'ليس هناك منتجات متوفره الأن',
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              fontSize:20,
                              fontFamily: fontFamilyEnglishName,
                              fontWeight: FontWeight.w900,
                              color: kDarkPinkColor,
                            ),
                          ),
                        ),
                      ]
                  ):Container(
                    width:Get.width*0.95,
                    height:Get.height*0.33,
                    child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      shrinkWrap:true,
                      itemCount:controller.productsList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:controller.productsList?[index]),
                        );
                      },

                    ),
                  )
                ]
              ),
            )

          )

              ),
          ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
