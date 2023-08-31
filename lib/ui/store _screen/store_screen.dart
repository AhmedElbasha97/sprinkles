// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_brace_in_string_interps, prefer_is_empty, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_widget.dart';
import 'package:sprinkles/ui/store%20_screen/controller/store_controller.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_loading_widget.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';
import '../product_screen/product_screen.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key, required this.mainCategoryId, required this.selectedFromDrawer}) : super(key: key);
  final int mainCategoryId;
  final bool selectedFromDrawer;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  StoreController(mainCategoryId,selectedFromDrawer),
      builder: (StoreController controller) =>  Scaffold(
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
                  Stack(

                      children:[
                        Container(
                          height: Get.height*0.3,
                          width:Get.width,

                        ),
                        Positioned(
                          top:Get.height*0.04,
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
                                        Get.to(()=> ProductScreen(mainCategoryId: mainCategoryId,));
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
                                        child:  Center(
                                          child:  CustomText(
                                            'عرض المنتجات',
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
                                  SizedBox(
                                    height:Get.height*0.01,
                                  ),
                                  PopupMenuButton<String>(
                                    itemBuilder: (context) =>
                                        controller.governmentData.map((e){
                                          return   PopupMenuItem(
                                            value:e,
                                            textStyle: const TextStyle(
                                                color: kDarkPinkColor,
                                                fontFamily: fontFamilyArabicName,
                                                fontWeight: FontWeight.w700),
                                            onTap: (){

                                            },
                                            child: SizedBox(
                                              width: Get.width,
                                              child: Column(
                                                children: [
                                                  CustomText(
                                                    e,
                                                    style: const TextStyle(
                                                        color: kDarkPinkColor,
                                                        fontFamily: fontFamilyArabicName,
                                                        fontWeight: FontWeight.w600),
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

                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
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
                                            padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                            child: Row(
                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                CustomText(
                                                  'ترتيب حسب',
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
                                                const Icon( Icons.arrow_downward_sharp ,color:kDarkPinkColor,size:20),
                                              ],
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:Get.height*0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,8.0,0),
                                    child: Container(
                                      height: Get.height*0.05,
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
                                        borderRadius: BorderRadius.circular(15), //
                                      ),
                                      child:TextField(

                                        textAlign:TextAlign.center,
                                        cursorColor: kDarkPinkColor,
                                        textInputAction: TextInputAction.search,
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
                                        decoration:  InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                          enabledBorder:  OutlineInputBorder(
                                              borderSide: const BorderSide(width: 1, color: kDarkPinkColor,),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:   const BorderSide(color: kDarkPinkColor,width: 1.0),
                                              borderRadius: BorderRadius.circular(15)),

                                          hintText: "بحث",
                                          hintStyle: TextStyle(

                                            shadows: <Shadow>[
                                              Shadow(
                                                  offset: const Offset(1.0, 1.0),
                                                  blurRadius: 3.0,

                                                  color: Colors.black.withOpacity(0.5)
                                              ),
                                            ],
                                            fontSize: 15,
                                            letterSpacing: 0,
                                            fontFamily: fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),

                                          suffixIcon:   const Icon(
                                            Icons.search_outlined,
                                            color: kDarkPinkColor,
                                            size: 20,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        Positioned(
                          top:Get.height*0.04,
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
                                left:10,
                                child: Container(
                                  width:Get.width*0.48,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.end,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [


                                      SizedBox(
                                        height: Get.height*0.18,
                                        width: Get.width*0.35,
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
                    height: Get.height*0.15,
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
                  controller.storeIsLoading?const StoreLoadingWidget():controller.storeList?.length == 0? Column(
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
                        'ليس هناك محلات متوفره الأن',
                        style: TextStyle(
                          fontSize:25,
                          fontFamily: fontFamilyEnglishName,
                          fontWeight: FontWeight.w600,
                          color: kDarkPinkColor,
                        ),
                      ),
                    ]
                  ):Column(
                    children:controller.storeList!.map(
                        (e){
                         return StoreWidget(store:e);
                        }
                    ).toList(),
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