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
import 'package:sprinkles/models/order_history_model.dart';
import 'package:sprinkles/ui/reviewiingMessage/reviewing_message_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class PurchaseHistoryCell extends StatelessWidget {
  const PurchaseHistoryCell({Key? key, required this.data, required this.counter}) : super(key: key);
  final OrderHistoryModel? data;
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Get.find<StorageService>().activeLocale == SupportedLocales.english?Padding(
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
                  SizedBox(
                    height:Get.height*0.175,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        SizedBox(
                          width:Get.width*0.5,
                          child: CustomText(
                            Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.itemNameEn??"":data?.itemName??"",
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

                        SizedBox(
                          width:Get.width*0.5,
                          child: CustomText(
                            data?.date??"",
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
                          child: SizedBox(
                            width:Get.width*0.5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:Get.width*0.35,
                                  child: CustomText(
                                    Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.shopNameEn??"":data?.shopName??"",
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
                  const SizedBox(width: 20,),
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:"${Services.baseEndPoint}${data?.img??""}",
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
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:"${Services.baseEndPoint}${data?.img??""}",
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
                  SizedBox(
                    height:Get.height*0.175,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          width:Get.width*0.5,
                          child: CustomText(
                            Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.itemNameEn??"":data?.itemName??"",
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
                        SizedBox(
                          width:Get.width*0.5,
                          child: CustomText(
                            data?.date??"",
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

                        counter==1&&data?.review==1 ?InkWell(
                          onTap: (){
                            showDialog(context: context,
                              builder: (context) =>
                                  ReviewingMessageWidget(historyId: data?.id??0,),);
                          },
                          child: Container(
                            height: 40,
                            width: Get.width*0.25,
                            decoration: BoxDecoration(
                              color: Colors.white,

                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                  color: Colors.black12,
                                ),
                              ],
                              border: Border.all(
                                  color: kDarkPinkColor,
                                  width: 2.0,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [ const Icon(Icons.star,color: kDarkPinkColor,),
                                  CustomText(
                                      reviewVisitBTN.tr,
                                      style: const TextStyle(
                                          fontFamily: fontFamilyArabicName,
                                          color:kDarkPinkColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)
                                  ),

                                ],

                              ),
                            ),
                          ),
                        ):const SizedBox(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width:Get.width*0.5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:Get.width*0.35,
                                  child: CustomText(
                                    Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.shopNameEn??"":data?.shopName??"",
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
    );
  }
}
