// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/comment_model.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/read_more_widget.dart';

import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';


class CommentWidget extends StatelessWidget {
  final CommentModel? data;
  final bool isStoreComment;
  const CommentWidget({Key? key, required this.data, required this.isStoreComment}) : super(key: key);
  String returnDateAndTime(String dateAndTime){
    String dateOrTime = "" ;
    final format = DateFormat('HH:mm a');
    DateFormat formatDate = DateFormat("yyyy MMM dd");
    final dateTime = DateTime.parse(dateAndTime);
    if(dateTime.day == DateTime.now().day){
      dateOrTime = format.format(dateTime);
    }else{
      dateOrTime = formatDate.format(dateTime);
    }
    return dateOrTime;
  }
  @override
  Widget build(BuildContext context) {
    return Get.find<StorageService>().activeLocale == SupportedLocales.english?Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color:Colors.white,
                border: Border.all(color: kDarkPinkColor,width: 1)
            ),
            width: Get.width*0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20,),

                    StarRating(
                      color: kLightPinkColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      length: 5,
                      rating: isStoreComment?data?.shopRate??0.0:data?.itemRate??0.0,
                      between: 5,
                      starSize: 20,
                      onRaitingTap: (rating) {

                      },
                    )
                  ],
                ),
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: Get.width*0.7,
                    child:   ReadMoreText(data?.review??"",
                      textAlign: TextAlign.start,
                      style:  TextStyle(
                          fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyArabicName:fontFamilyEnglishName,
                          color: kDarkPinkColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),colorClickableText: kLightPinkColor,  semanticsLabel: '',),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: Get.width*0.9,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(data?.name??"",
                          textAlign: TextAlign.start,
                          style:  TextStyle(
                              fontFamily: Get
                                  .find<StorageService>()
                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                              color: kLightPinkColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
                        const SizedBox(height: 10,),
                        CustomText(returnDateAndTime(data?.datetime??""),
                          textAlign: TextAlign.start,
                          style:  TextStyle(
                              fontFamily: Get
                                  .find<StorageService>()
                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                              color: kLightPinkColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),),
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

        ],
      ),
    ):
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color:Colors.white,
                border: Border.all(color: kDarkPinkColor,width: 1)
            ),
            width: Get.width*0.85,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20,),

                      StarRating(
                        color: kLightPinkColor,
                        mainAxisAlignment: MainAxisAlignment.center,
                        length: 5,
                        rating: data?.itemRate??0.0,
                        between: 5,
                        starSize: 20,
                        onRaitingTap: (rating) {

                        },
                      )
                    ],
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width*0.9,
                      child:   ReadMoreText(data?.review??"",
                        textAlign: TextAlign.start,
                        style:  TextStyle(
                            fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyArabicName:fontFamilyEnglishName,
                            color: kDarkPinkColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),colorClickableText: kLightPinkColor,  semanticsLabel: '',),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width*0.7,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(data?.name??"",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                color: kLightPinkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                          const SizedBox(height: 10,),
                          CustomText(returnDateAndTime(data?.datetime??""),
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                                fontFamily: Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                color: kLightPinkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),



                ],
              ),
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

        ],
      ),
    );
  }
}
