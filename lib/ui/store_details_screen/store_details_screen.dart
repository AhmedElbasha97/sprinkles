// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_loading_widget.dart';
import 'package:sprinkles/ui/store_details_screen/controller/store_detailed_screen.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';


class StoreDetailedScreen extends StatelessWidget {
  const StoreDetailedScreen({Key? key, required this.shopId, required this.mainCategoryId}) : super(key: key);

  final String shopId;

  final int mainCategoryId;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder(
      init:  StoreDetailedController( context:context, mainCategoryId:mainCategoryId, shopId: shopId,  ),
      builder: (StoreDetailedController controller) =>  Scaffold(
        body:  SingleChildScrollView(
          controller: controller.scrollController,
          child: Container(
            decoration:  const BoxDecoration(
                color: kBackGroundColor
            ),
            child:   Center(
              child: Column(
                children: [
                  Stack(

                      children:[
                        Container(
                          height: Get.height*0.3,
                          width:Get.width,
                          child:const Padding(padding: EdgeInsets.all(0),
                          ),
                        ),
                        Positioned(
                          top:statusBarHeight,
                          right:0,
                          child: Container(

                            width:Get.width*0.6,
                            child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Container(
                                    width:Get.width*0.4,
                                    child: const Padding(
                                      padding:  EdgeInsets.fromLTRB(8,8,8,8),
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30),
                                          CustomText(
                                            'English',
                                            style: TextStyle(
                                              fontSize:15,
                                              fontFamily: fontFamilyEnglishName,
                                              fontWeight: FontWeight.w600,
                                              color: kDarkPinkColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:Get.height*0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                                    child: InkWell(
                                      onTap:(){

                                      },
                                      child: Container(
                                        height: Get.height*0.05,
                                        width:Get.width*0.3,
                                        decoration: BoxDecoration(
                                          color:Colors.white,
                                          border: Border.all( color:kDarkPinkColor,width: 1),
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
                                          borderRadius: BorderRadius.circular(15), //
                                        ),
                                        child:  controller.shopIsLoading?
                                        Center(
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
                                            .slide()
                                            :Center(
                                          child:  CustomText(
                                              Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.shopData?.nameEn??"":controller.shopData?.name??"",
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

                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,5,8.0,0),
                                    child: InkWell(
                                      onTap:(){

                                      },
                                      child: Container(

                                        width:Get.width*0.5,
                                        decoration: BoxDecoration(

                                          borderRadius: BorderRadius.circular(15), //
                                        ),
                                        child:  Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:controller.shopIsLoading?Center(
                                            child:   Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width:Get.width*0.45,
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
                                                    width:Get.width*0.45,
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
                                                    width:Get.width*0.45,
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
                                                    width:Get.width*0.45,
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


                                          ): Center(
                                            child:  CustomText(
                                                Get.find<StorageService>().activeLocale == SupportedLocales.english?controller.shopData?.descEn??"":controller.shopData?.desc??"",
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

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ]
                            ),
                          ),
                        ),
                        Positioned(

                              top:statusBarHeight,
                              left:0,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height*0.235,
                                width: Get.width*0.6,
                              ),
                              Positioned(
                                  top:0,
                                  child: SizedBox(
                                    height: Get.height*0.235,
                                    width: Get.width*0.6,
                                    child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                                  )),
                             Positioned(
                                left:20,
                                child: Container(
                                  width:Get.width*0.48,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.end,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [


                                      controller.shopIsLoading?Container(

                                        height: Get.height*0.15,
                                        width: Get.width*0.33,
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

                                            height: Get.height*0.14,
                                            width: Get.width*0.3,
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
                                          :CachedNetworkImage(
                                        fit:  BoxFit.contain,
                                        imageUrl: "https://cake.syncqatar.com${controller.shopData?.image??""}",
                                        imageBuilder: ((context, image){
                                          return   Container(
                                              height: Get.height*0.15,
                                              width: Get.width*0.33,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: image,
                                                  fit:  BoxFit.contain,
                                                ),
                                              ));
                                        }),
                                        placeholder: (context, image){
                                          return   Container(

                                            height: Get.height*0.15,
                                            width: Get.width*0.33,
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

                                                height: Get.height*0.14,
                                                width: Get.width*0.3,
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
                                            height: Get.height*0.15,
                                            width: Get.width*0.33,
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

                      ]
                  ),
                  Column(
                    children: [
                      Row(
                        children: [

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                            child: InkWell(
                              onTap:() async {
                                await controller.makePhoneCall();
                              },
                              child: Container(
                                height: Get.height*0.05,
                                width:Get.width*0.45,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all( color:kDarkPinkColor,width: 1),
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
                                  borderRadius: BorderRadius.circular(15), //
                                ),
                                child:  Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          'تواصل عن طريق الهاتف',
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
                                        const SizedBox(width:5),
                                        const Icon(Icons.phone,color: kDarkPinkColor,size:18)
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                            child: InkWell(
                              onTap:(){
                                controller.whatsapp();
                              },
                              child: Container(
                                height: Get.height*0.05,
                                width:Get.width*0.45,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all( color:kDarkPinkColor,width: 1),
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
                                  borderRadius: BorderRadius.circular(15), //
                                ),
                                child:  Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          'تواصل عن طريق الواتس',
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
                                        const SizedBox(width:5),
                                        const Icon(Icons.chat,color: kDarkPinkColor,size:18)
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                            child: InkWell(
                              onTap:(){
                                controller.addingOrRemovingStoreToFavorite(context);
                              },
                              child: Container(
                                height: Get.height*0.05,
                                width:Get.width*0.45,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all( color:kDarkPinkColor,width: 1),
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
                                  borderRadius: BorderRadius.circular(15), //
                                ),
                                child:  Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children:[

                                          CustomText(
                                            controller.storeAreAddedOrNot?"امسح من المفضله":'أضف إلى المفضلة',
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
                                          controller.storeAreAddedOrNot? const Icon(
                                            Icons.favorite_border_rounded,
                                            color: kDarkPinkColor,
                                          ): const Icon(
                                            Icons.favorite,
                                            color: kDarkPinkColor,
                                          ),
                                        ]

                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                            child: InkWell(
                              onTap:(){
                                controller.showStoreLocation();
                              },
                              child: Container(
                                height: Get.height*0.05,
                                width:Get.width*0.45,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  border: Border.all( color:kDarkPinkColor,width: 1),
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
                                  borderRadius: BorderRadius.circular(15), //
                                ),
                                child:  Center(
                                  child:  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          'عرض موقع المحل',
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
                                        const SizedBox(width:5),
                                        const Icon(Icons.map,color: kDarkPinkColor,size:18)
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                 controller.shopIsLoading?const CategoryLoadingWidget():controller.shopData?.ctgs?.length == 0||controller.shopData?.ctgs?.length == 1? const SizedBox():Container(
                    width:Get.width*0.95,
                    height: Get.height*0.18,
                    child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      controller: controller.scrollController,
                      shrinkWrap:true,
                      itemCount:controller.shopData?.ctgs?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          InkWell(
                              onTap:(){
                                controller.selectingAnotherSubCategory(controller.shopData?.ctgs?[index].id??0);
                              },
                              child: CategoryWidget(category:controller.shopData?.ctgs?[index], selectedCategoryId:  controller.selectedSubCategoryId,)); },

                    ),
                  ),


                  controller.shopProductIsLoading?const ProductLoadingWidget():
                  controller.productList?.length == 0?Column(
                      children:[
                        SizedBox(
                          height: Get.height*0.4,
                          width: Get.width*0.6,
                          child: Image.asset("assets/images/Product quality-bro.png",fit: BoxFit.fitWidth,),
                        ),
                        const SizedBox(
                            height:50
                        ),
                        const CustomText(
                          'ليس هناك منتجات متوفره فى هذا المحل',
                          textAlign:TextAlign.center,
                          style: TextStyle(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
