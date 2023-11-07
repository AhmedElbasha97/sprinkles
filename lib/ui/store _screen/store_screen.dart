// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_is_empty, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_widget.dart';
import 'package:sprinkles/ui/store%20_screen/controller/store_controller.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_loading_widget.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';
import '../product_screen/product_screen.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key, required this.mainCategoryId, required this.selectedFromDrawer}) : super(key: key);
  final int mainCategoryId;
  final bool selectedFromDrawer;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder(
      init:  StoreController(mainCategoryId,selectedFromDrawer,context),
      builder: (StoreController controller) =>  WillPopScope(
        onWillPop: () async {
          Get.delete<StoreController>();
          return true;
        },
        child: Scaffold(
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
          key: controller.scaffoldState,
          drawer: AppDrawers(scaffoldKey: controller.scaffoldState,),
          backgroundColor:kBackGroundColor,
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
                                        padding:  EdgeInsets.fromLTRB(8,8,8,8),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap:(){
                                                  controller.scaffoldState.currentState!.openDrawer();
                                                },
                                                child: Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
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
                                                controller.changeFiltersData();
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
                                          if(!selectedFromDrawer) {
                                            Get.off(() =>
                                                ProductScreen(mainCategoryId: mainCategoryId, selectingFromDrawer: false,));
                                          }
                                        },
                                        child: Container(
                                          height: Get.height*0.04,
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
                                            borderRadius: BorderRadius.circular(10), //
                                          ),
                                          child:  Center(
                                            child:  CustomText(
                                              selectedFromDrawer?storeTitle.tr:showProduct.tr,
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
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\u0621-\u064A]")),

                                          ],
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
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName
                                              ,
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
                            right:0,
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
                                    child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.fitWidth,),
                                  ),
                                ),Positioned(
                                  right:10,
                                  top:15,

                                  child: Container(
                                    width:Get.width*0.48,
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.end,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [


                                        SizedBox(
                                          height: Get.height*0.11,
                                          width: Get.width*0.23,
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
                    ):
                    Stack(

                        children:[
                          Container(
                            height: Get.height*0.31,
                            width:Get.width,

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
                                      width:Get.width*0.3,
                                      child:  Padding(
                                        padding:  EdgeInsets.fromLTRB(8,8,8,8),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap:(){
                                                  controller.scaffoldState.currentState!.openDrawer();
                                                },
                                                child: Icon( Icons.subject_rounded ,color:kDarkPinkColor,size:30)),
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

                                                controller.changeFiltersData();
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
                                      padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                                      child: InkWell(
                                        onTap:(){
                                          if(!selectedFromDrawer) {
                                            Get.off(() =>
                                                ProductScreen(mainCategoryId: mainCategoryId, selectingFromDrawer: false,));
    }
                                          },
                                        child: Container(
                                          height: Get.height*0.04,
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
                                            borderRadius: BorderRadius.circular(10), //
                                          ),
                                          child:  Center(
                                            child:  CustomText(
                                              selectedFromDrawer?storeTitle.tr:showProduct.tr,
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
                                              textStyle:  TextStyle(
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
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      ),
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
                                              padding:  EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                              child: Row(
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
                                          focusNode: controller.myFocusNode,
                                          textAlign:TextAlign.center,
                                          cursorColor: kDarkPinkColor,
                                          textInputAction: TextInputAction.search,
                                          inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\u0621-\u064A]")),


                                          ],
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

                                            suffixIcon:   Icon(
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
                                  top:0,
                                  child: SizedBox(
                                    height: Get.height*0.235,
                                    width: Get.width*0.6,
                                    child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                                  ),
                                ),Positioned(
                                  top:15,

                                  left:10,
                                  child: Container(
                                    width:Get.width*0.48,
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.end,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [


                                        SizedBox(
                                          height: Get.height*0.15,
                                          width: Get.width*0.3,
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
                    selectedFromDrawer?controller.categoryIsLoading?const CategoryLoadingWidget():
                    Container(
                      width:Get.width*0.95,
                      height: Get.height*0.18,

                      child: ListView.builder(
                        scrollDirection:Axis.horizontal,
                        controller: controller.scrollController,
                        shrinkWrap:true,
                        itemCount:controller.mainCategoryList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                             InkWell(
                               onTap:(){
                                 controller.selectingAnotherSubCategory(controller.mainCategoryList?[index].id??0);
                               },
                                 child: CategoryWidget(category:controller.mainCategoryList?[index], selectedCategoryId:  controller.selectedMainCategoryId,)); },

                      ),
                    ):const SizedBox(),
                    controller.storeIsLoading?const StoreLoadingWidget():controller.storeList?.length == 0? controller.activateSearching? Column(
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
                            noDataSearchStore.tr,
                            style: TextStyle(
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
                          child: Image.asset("assets/images/we are open-cuate.png",fit: BoxFit.fitWidth,),
                        ),
                        SizedBox(
                          height:50
                        ),
                        CustomText(
                          noStoreData.tr,
                          style: TextStyle(
                            fontSize:25,
                            fontFamily: Get
                                .find<StorageService>()
                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                            fontWeight: FontWeight.w900,
                            color: kDarkPinkColor,
                          ),
                        ),
                      ]
                    ):Column(

                      children:
                        controller.storeListWidget
                      ,
                    ),
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