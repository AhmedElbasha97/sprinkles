// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_is_empty, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/product_screen/controller/product_contoller.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_loading_widget.dart';
import 'package:sprinkles/ui/store%20_screen/store_screen.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import '../../Utils/constant.dart';
import '../../Utils/localization_services.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.mainCategoryId, required this.selectingFromDrawer, required this.mainCategoryImg}) : super(key: key);
  final String mainCategoryImg;
  final int mainCategoryId;
  final bool selectingFromDrawer;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder(
      init:  ProductController(mainCategoryId,context,selectingFromDrawer,mainCategoryImg),
      builder: (ProductController controller) => WillPopScope(
        onWillPop: () async {
            Get.delete<ProductController>();
          return true;
        },
        child: Scaffold(
          key: controller.scaffoldState,
          drawer: AppDrawers(scaffoldKey: controller.scaffoldState,),
          backgroundColor:kBackGroundColor,
          floatingActionButton: Visibility(
            visible: controller.isVisible,
            child: InkWell(
              onTap: (){
              controller. goUpToTopOfSScreen();
              },
              child: Container(
                width: Get.width*0.17,
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
                  ),shape: BoxShape.circle,
                ),
                child:  Center(
                  child: const Icon(
                    Icons.arrow_upward_sharp,
                    weight: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body:  SingleChildScrollView(
            controller: controller.scrollController,
            child: Container(
              decoration:  const BoxDecoration(
              color: kBackGroundColor
              ),
              child:   Center(
                child: Column(
                  children: [
                    Get.find<StorageService>().activeLocale == SupportedLocales.english?Stack(

                        children:[
                          Container(
                            height: Get.height*0.31,
                            width:Get.width,
                            child:const Padding(padding: EdgeInsets.all(0),
                            ),
                          ),
                          Positioned(
                            top:statusBarHeight-5,
                            right:0,
                            child: Stack(
                              children: [
                                Container(
                                  height: Get.height*0.235,
                                  width: Get.width*0.6,
                                ),
                                Positioned(

                                    right:0,
                                    child: SizedBox(
                                      height: Get.height*0.235,
                                      width: Get.width*0.6,
                                      child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.contain,),
                                    )),
                                Positioned(
                                  top:15,
                                  right:10,
                                  child: Container(
                                    width:Get.width*0.45,
                                    child: Row(
                                      mainAxisAlignment:selectingFromDrawer?controller.selectedMainCategoryId==240?MainAxisAlignment.end:MainAxisAlignment.start:MainAxisAlignment.start,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        selectingFromDrawer?controller.selectedMainCategoryId==240?SizedBox():controller.categoryIsLoading?Container(
                                          width: Get.width*0.2,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              color:  const Color(0xFFF2F0F3),
                                              borderRadius: BorderRadius.circular(50)
                                          ),

                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide():Container(
                                          width: Get.width*0.2,
                                          child: CustomText(
                                            Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
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
                                                  .activeLocale == SupportedLocales.english ?fontFamilyArabicName:fontFamilyEnglishName,
                                              color: kBackGroundColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ):controller.categoryIsLoading?Container(
                                          width: Get.width*0.2,
                                          height: 13,
                                          decoration: BoxDecoration(
                                              color:  const Color(0xFFF2F0F3),
                                              borderRadius: BorderRadius.circular(50)
                                          ),

                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide():Container(
                                          width: Get.width*0.2,
                                          child: CustomText(
                                            Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
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
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        selectingFromDrawer?controller.selectedMainCategoryId==240?SizedBox(
                                          height: Get.height*0.15,
                                          width: Get.width*0.3,
                                          child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                        ):controller.categoryIsLoading?
                                        Container(

                                          height: Get.height*0.11,
                                          width: Get.width*0.23,
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

                                              height: Get.height*0.09,
                                              width: Get.width*0.2,
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
                                            .animate()
                                            :CachedNetworkImage(
                                          fit:  BoxFit.fitWidth,
                                          imageUrl: "${Services.baseEndPoint}${controller.data?.img2??""}",
                                          imageBuilder: ((context, image){
                                            return   Container(
                                                height: Get.height*0.14,
                                                width: Get.width*0.25,
                                                decoration: BoxDecoration(

                                                  image: DecorationImage(
                                                    image: image,
                                                    fit:  BoxFit.fitWidth,
                                                  ),
                                                ));
                                          }),
                                          placeholder: (context, image){
                                            return   Container(
                                              height: Get.height*0.11,
                                              width: Get.width*0.23,
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

                                                  height: Get.height*0.09,
                                                  width: Get.width*0.2,
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
                                              height: Get.height*0.14,
                                              width: Get.width*0.25,
                                              child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                            );
                                          },
                                        ):
                                        controller.categoryIsLoading?
                                        Container(

                                          height: Get.height*0.11,
                                          width: Get.width*0.23,
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

                                              height: Get.height*0.09,
                                              width: Get.width*0.2,
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
                                            .animate():
                                        CachedNetworkImage(
                                          fit:  BoxFit.contain,
                                          imageUrl: "${Services.baseEndPoint}${controller.data?.img2??""}",
                                          imageBuilder: ((context, image){
                                            return   Container(
                                                height: Get.height*0.14,
                                                width: Get.width*0.25,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: image,
                                                    fit:  BoxFit.fitWidth,
                                                  ),
                                                ));
                                          }),
                                          placeholder: (context, image){
                                            return   Container(
                                              height: Get.height*0.11,
                                              width: Get.width*0.23,
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

                                                  height: Get.height*0.09,
                                                  width: Get.width*0.2,
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
                                              height: Get.height*0.14,
                                              width: Get.width*0.25,
                                              child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                            );
                                          },
                                        )

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

                              width:Get.width*0.6,
                              child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    Container(
                                      width:Get.width*0.3,
                                      child:  Padding(
                                        padding:  const EdgeInsets.fromLTRB(8,8,8,8),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap:(){
                                                  controller.scaffoldState.currentState!.openDrawer();
                                                },
                                                child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                            InkWell(
                                              onTap: () async {
                                                final Locale newLocale =
                                                Get.find<StorageService>().activeLocale == SupportedLocales.arabic
                                                    ? SupportedLocales.english
                                                    : SupportedLocales.arabic;
                                                //in storage
                                                Get.find<StorageService>().activeLocale = newLocale;
                                                //in Getx
                                                Get.updateLocale(newLocale);
                                                controller.changeFilterData();
                                              },
                                              child: CustomText(
                                                translateButton.tr,
                                                style: TextStyle(
                                                  fontSize:15,
                                                  fontFamily: Get
                                                      .find<StorageService>()
                                                      .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                  fontWeight: FontWeight.w600,
                                                  color: kDarkPinkColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:Get.height*0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                      child: InkWell(
                                        onTap:(){
                                          if(!selectingFromDrawer) {
                                            Get.off(() =>
                                                StoreScreen(
                                                  mainCategoryId: mainCategoryId,
                                                  selectedFromDrawer: false, mainCategoryImg: mainCategoryImg,));
                                          }else{
                                            Get.off(() =>
                                             StoreScreen(selectedFromDrawer: true, mainCategoryId: 0, mainCategoryImg: mainCategoryImg,));
                                          }
                                        },
                                        child: Container(
                                          height: Get.height*0.04,
                                          width:Get.width*0.35,
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
                                            borderRadius: BorderRadius.circular(10), //
                                          ),
                                          child:  Center(
                                            child:  CustomText(
                                              showStore.tr,
                                              style:TextStyle(
                                                shadows: <Shadow>[
                                                  Shadow(
                                                      offset: const Offset(0.5, 0.5),
                                                      blurRadius: 0.5,

                                                      color: Colors.black.withOpacity(0.5)
                                                  ),
                                                ],
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                color: kDarkPinkColor,
                                              ),
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:Get.height*0.02,
                                    ),
                                    PopupMenuButton<String>(
                                      constraints:BoxConstraints(
                                        maxWidth:  Get.width*0.45,
                                        minWidth:  Get.width*0.45,
                                      ),
                                      itemBuilder: (context) =>
                                          controller.governmentData.map((e){
                                            return   PopupMenuItem(
                                              value:e,
                                              textStyle: TextStyle(
                                                  color: kDarkPinkColor,
                                                  fontFamily: Get
                                                      .find<StorageService>()
                                                      .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                  fontWeight: FontWeight.w700),
                                              onTap: (){
                                                controller.selectingFilter(e,false);
                                              },
                                              child: SizedBox(
                                                width: Get.width*0.45,
                                                child: Column(
                                                  children: [
                                                    CustomText(
                                                      e,
                                                      style:  TextStyle(
                                                          color: kDarkPinkColor,
                                                          fontFamily: Get
                                                              .find<StorageService>()
                                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    e == controller.governmentData.last?const SizedBox():const Divider(
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

                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: Get.height*0.04,
                                          ),
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
                                            borderRadius: BorderRadius.circular(10), //
                                          ),
                                          child:  Center(
                                            child:  Padding(
                                              padding:  EdgeInsets.fromLTRB(8.0,0,8.0,0),                                              child: Row(
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                              children: [

                                                Container(

                                                  width:Get.width*0.34,
                                                  child: CustomText(
                                                    textAlign:TextAlign.center,
                                                    maxLines:3,
                                                    controller.selectingFilterTagName,
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
                                                      fontFamily: Get
                                                          .find<StorageService>()
                                                          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                      color: kDarkPinkColor,
                                                    ),
                                                  ),
                                                ),
                                                controller.selectingFilterTag == "0"||controller.selectingFilterTag.contains("desc")?const Icon( Icons.arrow_downward_sharp ,color:kDarkPinkColor,size:20):controller.selectingFilterTag.contains("asc")?const Icon( Icons.arrow_upward_sharp ,color:kDarkPinkColor,size:20):const SizedBox(),
                                              ],
                                            ),
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      height:Get.height*0.022,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                      child: Container(
                                        height: Get.height*0.04,
                                        width:Get.width*0.8,
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
                                          borderRadius: BorderRadius.circular(10), //
                                        ),
                                        child:TextFormField(
                                          controller:controller.searchController,
                                          textAlign:TextAlign.center,
                                          focusNode: controller.myFocusNode,
                                          cursorColor: kDarkPinkColor,
                                          textInputAction: TextInputAction.search,

                                          style: TextStyle(
                                            shadows: <Shadow>[
                                              Shadow(
                                                  offset: const Offset(2.0, 2.0),
                                                  blurRadius: 13.0,

                                                  color: Colors.black.withOpacity(0.5)
                                              ),
                                            ],
                                            fontSize: 15,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                          onChanged:(e){
                                            controller.searchingForKeyword();
                                          },
                                          onFieldSubmitted:(e)  {

                                            controller
                                                .searchingForKeyword();

                                          },
                                          decoration:  InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                            enabledBorder:  OutlineInputBorder(
                                                borderSide: const BorderSide(width: 1, color: kDarkPinkColor,),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:   const BorderSide(color: kDarkPinkColor,width: 1.0),
                                                borderRadius: BorderRadius.circular(10)),

                                            hintText: controller.myFocusNode.hasFocus ? "":searchKey.tr,
                                            hintStyle: TextStyle(

                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: const Offset(0.5, 0.5),
                                                    blurRadius: 0.5,

                                                    color: Colors.black.withOpacity(0.5)
                                                ),
                                              ],
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),

                                            suffixIcon:   const Icon(
                                              Icons.search_outlined,
                                              color: kDarkPinkColor,
                                              size: 24,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),


                        ]
                    ):
                    Stack(
                      children:[
                        Container(
                          height: Get.height*0.31,
                          width:Get.width,
                          child:const Padding(padding: EdgeInsets.all(0),
                          ),
                        ),
                        Positioned(
                          top:statusBarHeight-5,
                          right:0,
                          child: Container(

                            width:Get.width*0.6,
                            child: Column(
                               crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Container(
                                    width:Get.width*0.35,
                                    child:  Padding(
                                      padding:  const EdgeInsets.fromLTRB(8,8,8,8),
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                              onTap:(){
                                                controller.scaffoldState.currentState!.openDrawer();
                                              },
                                              child: const Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
                                           InkWell(
                                             onTap: (){
                                               final Locale newLocale =
                                               Get.find<StorageService>().activeLocale == SupportedLocales.arabic
                                                   ? SupportedLocales.english
                                                   : SupportedLocales.arabic;
                                               //in storage
                                               Get.find<StorageService>().activeLocale = newLocale;
                                               //in Getx
                                               Get.updateLocale(newLocale);
                                               controller.changeFilterData();

                                             },
                                             child: CustomText(
                                               translateButton.tr,
                                              style:  TextStyle(
                                                fontSize:15,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                fontWeight: FontWeight.w600,
                                                color: kDarkPinkColor,
                                              ),
                                          ),
                                           ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:Get.height*0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                    child:InkWell(
                                      onTap:(){
                                        if(!selectingFromDrawer) {
                                          Get.off(() =>
                                              StoreScreen(
                                                mainCategoryId: mainCategoryId,
                                                selectedFromDrawer: false, mainCategoryImg: mainCategoryImg,));
                                        }else{
                                          Get.off(() =>
                                           StoreScreen(selectedFromDrawer: true, mainCategoryId: 0, mainCategoryImg: mainCategoryImg,));
                                        }
                                      },
                                      child: Container(
                                        height: Get.height*0.04,
                                        width:Get.width*0.35,
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
                                          borderRadius: BorderRadius.circular(10), //
                                        ),
                                        child:  Center(
                                          child:  CustomText(
                                            showStore.tr,
                                            style:TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: const Offset(0.5, 0.5),
                                                    blurRadius: 0.5,

                                                    color: Colors.black.withOpacity(0.5)
                                                ),
                                              ],
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:Get.height*0.02,
                                  ),
                                  PopupMenuButton<String>(
                                    constraints:BoxConstraints(
                                      maxWidth:  Get.width*0.45,
                                      minWidth:  Get.width*0.45,
                                    ),
                                    itemBuilder: (context) =>
                                        controller.governmentData.map((e){
                                          return   PopupMenuItem(
                                            value:e,
                                            textStyle: TextStyle(
                                                color: kDarkPinkColor,
                                                fontFamily: Get
                                                    .find<StorageService>()
                                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                fontWeight: FontWeight.w700),
                                            onTap: (){
                                              controller.selectingFilter(e,false);
                                            },
                                            child: SizedBox(
                                              width: Get.width*0.45,
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    e,
                                                    style:  TextStyle(
                                                        color: kDarkPinkColor,
                                                        fontFamily: Get
                                                            .find<StorageService>()
                                                            .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  e == controller.governmentData.last?const SizedBox():const Divider(
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

                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minHeight: Get.height*0.04,
                                        ),
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
                                          borderRadius: BorderRadius.circular(10), //
                                        ),
                                        child:  Center(
                                          child:  Padding(
                                            padding:  EdgeInsets.fromLTRB(8.0,0,8.0,0),                                              child: Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [

                                              Container(

                                                width:Get.width*0.34,
                                                child: CustomText(
                                                  textAlign:TextAlign.center,
                                                  maxLines:3,
                                                  controller.selectingFilterTagName,
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
                                                    fontFamily: Get
                                                        .find<StorageService>()
                                                        .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                    color: kDarkPinkColor,
                                                  ),
                                                ),
                                              ),
                                              controller.selectingFilterTag == "0"||controller.selectingFilterTag.contains("desc")?const Icon( Icons.arrow_downward_sharp ,color:kDarkPinkColor,size:20):controller.selectingFilterTag.contains("asc")?const Icon( Icons.arrow_upward_sharp ,color:kDarkPinkColor,size:20):const SizedBox(),
                                            ],
                                          ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:Get.height*0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                                    child: Container(
                                      height: Get.height*0.04,
                                      width:Get.width*0.8,
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
                                        borderRadius: BorderRadius.circular(10), //
                                      ),
                                      child:TextFormField(
                                        controller:controller.searchController,
                                        textAlign:TextAlign.center,
                                        focusNode: controller.myFocusNode,
                                        cursorColor: kDarkPinkColor,
                                        textInputAction: TextInputAction.search,

                                        style: TextStyle(

                                          fontSize: 15,
                                          letterSpacing: 0,
                                          fontFamily: Get
                                              .find<StorageService>()
                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                        ),
                                        onChanged:(e){
                                          controller.searchingForKeyword();
                                        },
                                        onFieldSubmitted:(e)  {

                                          controller
                                              .searchingForKeyword();

                                        },
                                        decoration:  InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                            enabledBorder:  OutlineInputBorder(
                                                borderSide: const BorderSide(width: 1, color: kDarkPinkColor,),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:   const BorderSide(color: kDarkPinkColor,width: 1.0),
                                                borderRadius: BorderRadius.circular(10)),

                                            hintText:  controller.myFocusNode.hasFocus ?"":searchKey.tr,
                                            hintStyle: TextStyle(

                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: const Offset(0.5, 0.5),
                                                    blurRadius: 0.5,

                                                    color: Colors.black.withOpacity(0.5)
                                                ),
                                              ],
                                              fontSize: 15,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),

                                            suffixIcon:   const Icon(
                                              Icons.search_outlined,
                                              color: kDarkPinkColor,
                                              size: 24,),
                                            ),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Positioned(
                          top:statusBarHeight-5,
                          left:0,
                          child: Stack(
                            children: [
                          Container(
                          height: Get.height*0.235,
                            width: Get.width*0.6,
                          ),
                            Positioned(
                                left:0,
                                child: SizedBox(
                                  height: Get.height*0.235,
                                  width: Get.width*0.6,
                                  child: Image.asset("assets/images/cakeBG.png",fit:  BoxFit.contain,),
                                )),
                              Positioned(
                                top: 15,
                                left:10,
                                child: Container(
                                  width:Get.width*0.45,
                                  child: Row(
                                    mainAxisAlignment:selectingFromDrawer?controller.selectedMainCategoryId==240?MainAxisAlignment.end:MainAxisAlignment.start:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      selectingFromDrawer?controller.selectedMainCategoryId==240?SizedBox():controller.categoryIsLoading?Container(
                                        width: Get.width*0.2,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(50)
                                        ),

                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide():Container(
                                        width: Get.width*0.2,
                                            child: CustomText(
                                  Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
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
                                                .activeLocale == SupportedLocales.english ?fontFamilyArabicName:fontFamilyEnglishName,
                                            color: kBackGroundColor,
                                        ),
                                              textAlign: TextAlign.center,
                                      ),
                                          ):controller.categoryIsLoading?Container(
                                        width: Get.width*0.2,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(50)
                                        ),

                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide():Container(
                                        width: Get.width*0.2,
                                            child: CustomText(
                                        Get.find<StorageService>().activeLocale == SupportedLocales.english? controller.data?.nameEn??"":controller.data?.name??"",
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
                                              textAlign: TextAlign.center,
                                      ),
                                          ),
                                      selectingFromDrawer?controller.selectedMainCategoryId==240?SizedBox(
                                        height: Get.height*0.15,
                                        width: Get.width*0.3,
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                      ):controller.categoryIsLoading?
                                      Container(

                                        height: Get.height*0.11,
                                        width: Get.width*0.23,
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

                                            height: Get.height*0.09,
                                            width: Get.width*0.2,
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
                                          .animate()
                                          :CachedNetworkImage(
                                          fit:  BoxFit.fitWidth,
                                        imageUrl: "${Services.baseEndPoint}${controller.data?.img2??""}",
                                        imageBuilder: ((context, image){
                                          return   Container(
                                              height: Get.height*0.14,
                                              width: Get.width*0.25,
                                              decoration: BoxDecoration(

                                                image: DecorationImage(
                                                  image: image,
                                                  fit:  BoxFit.fitWidth,
                                                ),
                                              ));
                                        }),
                                        placeholder: (context, image){
                                          return   Container(
                                            height: Get.height*0.11,
                                            width: Get.width*0.23,
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

                                                height: Get.height*0.09,
                                                width: Get.width*0.2,
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
                                            height: Get.height*0.14,
                                            width: Get.width*0.25,
                                            child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                          );
                                        },
                                      ):
                                      controller.categoryIsLoading?
                                      Container(

                                        height: Get.height*0.11,
                                        width: Get.width*0.23,
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

                                            height: Get.height*0.09,
                                            width: Get.width*0.2,
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
                                          .animate():
                                      CachedNetworkImage(
                                        fit:  BoxFit.contain,
                                        imageUrl: "${Services.baseEndPoint}${controller.data?.img2??""}",
                                        imageBuilder: ((context, image){
                                          return   Container(
                                              height: Get.height*0.14,
                                              width: Get.width*0.25,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: image,
                                                  fit:  BoxFit.fitWidth,
                                                ),
                                              ));
                                        }),
                                        placeholder: (context, image){
                                          return   Container(
                                            height: Get.height*0.11,
                                            width: Get.width*0.23,
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

                                                height: Get.height*0.09,
                                                width: Get.width*0.2,
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
                                            height: Get.height*0.14,
                                            width: Get.width*0.25,
                                            child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                          );
                                        },
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ]
                    ),
                    SizedBox(height: 10,),
                    selectingFromDrawer?controller.mainCategoryIsLoading?const CategoryLoadingWidget():
                  Container(
                    width:Get.width*0.95,
                    height: Get.height*0.13,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,

                        shrinkWrap:true,
                        itemCount:controller.mainCategoryList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            InkWell(
                                onTap:(){
                                  controller.selectingCategoryFromMainCategory(controller.mainCategoryList?[index].id??0);
                                },
                                child: CategoryWidget(category:controller.mainCategoryList?[index], selectedCategoryId:  controller.selectedMainCategoryId,)); },

                      ),
                    ),
                  ):
                    controller.categoryIsLoading?const CategoryLoadingWidget():Container(
                      width:Get.width*0.95,
                      height: Get.height*0.13,
                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,

                        shrinkWrap:true,
                        itemCount:controller.subCategoryList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            InkWell(
                                onTap:(){
                                  controller.selectingAnotherSubCategory(controller.subCategoryList?[index].id??0);
                                },
                                child: CategoryWidget(category:controller.subCategoryList?[index], selectedCategoryId:  controller.selectedSubCategoryId,)); },

                      ),
                    ),
                    selectingFromDrawer?controller.selectedMainCategoryId==240?const SizedBox():controller.categoryIsLoading?const CategoryLoadingWidget():Container(
                      width:Get.width*0.95,
                      height: Get.height*0.13,
                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,

                        shrinkWrap:true,
                        itemCount:controller.subCategoryList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            InkWell(
                                onTap:(){
                                  controller.selectingAnotherSubCategory(controller.subCategoryList?[index].id??0);
                                },
                                child: CategoryWidget(category:controller.subCategoryList?[index], selectedCategoryId:  controller.selectedSubCategoryId,)); },

                      ),
                    ):const SizedBox(),
                    controller.productIsLoading? ProductLoadingWidget(isLoadingMoreData:  controller.isLoadingMoreData,):controller.productList?.length == 0?controller.activateSearching? Column(
                        children:[
                          SizedBox(
                            height: Get.height*0.4,
                            width: Get.width*0.8,
                            child: Image.asset("assets/images/Search-rafiki.png",fit: BoxFit.fitWidth,),
                          ),
                          SizedBox(
                              height: Get.height*0.03
                          ),
                           CustomText(
                            noDataSearchProduct.tr,
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
                            noProductData.tr,
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
                    controller.isLoadingMoreData?ProductLoadingWidget(  isLoadingMoreData: controller.isLoadingMoreData,):SizedBox(),


                  ],
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
