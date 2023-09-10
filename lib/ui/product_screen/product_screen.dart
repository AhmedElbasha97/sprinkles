// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_is_empty

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/ui/product_screen/controller/product_contoller.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/category_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_loading_widget.dart';
import 'package:sprinkles/ui/store%20_screen/store_screen.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.mainCategoryId}) : super(key: key);
  final int mainCategoryId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  ProductController(mainCategoryId),
      builder: (ProductController controller) => Scaffold(
        key: controller.scaffoldState,
        drawer:const AppDrawers(),
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
                        child:const Padding(padding: EdgeInsets.all(0),
                        ),
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
                                        const CustomText(
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
                                      Get.to(()=> StoreScreen(mainCategoryId: mainCategoryId, selectedFromDrawer: false,));
                                    },
                                    child: Container(
                                      height: Get.height*0.05,
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
                                        borderRadius: BorderRadius.circular(15), //
                                      ),
                                      child:  Center(
                                        child:  CustomText(
                                          'عرض محلات الكيك',
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
                                          value:"${e}",
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
                                              offset: const Offset(2.0, 2.0),
                                              blurRadius: 13.0,

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
                              )),
                            Positioned(
                              left:20,
                              child: Container(
                                width:Get.width*0.48,
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.end,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [

                                    CustomText(
                                      'كيك',
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
                                    SizedBox(
                                      height: Get.height*0.2,
                                      width: Get.width*0.3,
                                      child: Image.asset("assets/images/Untitled-1.png",fit: BoxFit.fitHeight,),
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
                controller.categoryIsLoading?const CategoryLoadingWidget():
                  Container(
                    width:Get.width*0.95,
                    height: Get.height*0.15,
                    child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      controller: controller.scrollController,
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
                  controller.productIsLoading?const ProductLoadingWidget():controller.productList?.length == 0? Column(
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
                          'ليس هناك منتجات متوفره الأن',
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
