import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/choosing_filiter_model.dart';
import 'package:sprinkles/models/ordering_model.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
class FilterWidget extends StatelessWidget {
  final ItemFilter? data;
  final Function selectingFilterTap;
  final ChoosingFilterModel selectedValue;
  
  const FilterWidget({Key? key, required this.data, required this.selectingFilterTap, required this.selectedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get
        .find<StorageService>()
        .activeLocale == SupportedLocales.english ?Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            width:Get.width,


            decoration:BoxDecoration(
              border: Border.all(color:kDarkPinkColor,width: 2),
              borderRadius:BorderRadius.circular(10),
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

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:Get.find<StorageService>().activeLocale == SupportedLocales.english? CrossAxisAlignment.end: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),

                PopupMenuButton<Item>(
                  itemBuilder: (context) =>
                      data!.items!.map((e){
                        return   PopupMenuItem(
                          value:e,
                          textStyle: const TextStyle(
                              fontFamily: fontFamilyArabicName,
                              color: kDarkPinkColor,
                              fontWeight: FontWeight.w600),
                          onTap: (){
                            selectingFilterTap(e);
                          },
                          child: SizedBox(
                            width: Get.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [

                                    CustomText(
                                      Get.find<StorageService>().activeLocale == SupportedLocales.english?e.filterItemEn??"":e.filterItem??"",
                                      style:  TextStyle(
                                          fontFamily: Get
                                              .find<StorageService>()
                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth:Get.width*0.4,
                          ),
                          height: Get.height*0.07,

                          child:   Center(
                            child: selectedValue.filterValue==""?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "${orderingText1.tr}${Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??""}:",
                                  style:  TextStyle(
                                      fontFamily: Get
                                          .find<StorageService>()
                                          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),
                                Icon(Icons.arrow_drop_down_circle_outlined,size:25,color: kDarkPinkColor,)

                              ],
                            ):
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  (Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??"")+" ${orderingText2.tr} "+(Get.find<StorageService>().activeLocale == SupportedLocales.english? selectedValue.filterValueEn:selectedValue.filterValue),
                                  style: TextStyle(
                                      fontFamily: Get
                                          .find<StorageService>()
                                          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),



              ],
            ),
          ),
          Positioned(
            bottom:0,
            right:0,
            child: Container(
              height: Get.height*0.08,
              width: Get.width*0.3,
              decoration:const BoxDecoration(
                borderRadius:BorderRadius.only(bottomRight:Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Image 3.png",
                  ),
                  fit:  BoxFit.cover,
                ),

              ),
            ),
          ),
        ],
      ),
    ):Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            width:Get.width,


            decoration:BoxDecoration(
              border: Border.all(color:kDarkPinkColor,width: 2),
              borderRadius:BorderRadius.circular(10),
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

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:Get.find<StorageService>().activeLocale == SupportedLocales.english? CrossAxisAlignment.end: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),

                PopupMenuButton<Item>(
                  itemBuilder: (context) =>
                      data!.items!.map((e){
                        return   PopupMenuItem(
                          value:e,
                          textStyle: const TextStyle(
                              fontFamily: fontFamilyArabicName,
                              color: kDarkPinkColor,
                              fontWeight: FontWeight.w600),
                          onTap: (){
                            selectingFilterTap(e);
                          },
                          child: SizedBox(
                            width: Get.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [

                                    CustomText(
                                      Get.find<StorageService>().activeLocale == SupportedLocales.english?e.filterItemEn??"":e.filterItem??"",
                                      style:  TextStyle(
                                          fontFamily: Get
                                              .find<StorageService>()
                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth:Get.width*0.4,
                          ),
                          height: Get.height*0.07,

                          child:   Center(
                            child: selectedValue.filterValue==""?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  "${orderingText1.tr}${Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??""}:",
                                  style:  TextStyle(
                                      fontFamily: Get
                                          .find<StorageService>()
                                          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),
                               Icon(Icons.arrow_drop_down_circle_outlined,size:25,color: kDarkPinkColor,)

                              ],
                            ):
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  (Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??"")+" ${orderingText2.tr} "+(Get.find<StorageService>().activeLocale == SupportedLocales.english? selectedValue.filterValueEn:selectedValue.filterValue),
                                  style: TextStyle(
                                      fontFamily: Get
                                          .find<StorageService>()
                                          .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),



              ],
            ),
          ),
          Positioned(
            bottom:0,
            left:0,
            child: Container(
              height: Get.height*0.08,
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
            ),
          ),
        ],
      ),
    );
  }
}
