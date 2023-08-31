// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/category_model.dart';

import '../../../widgets/custom_text_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, this.category, required this.selectedCategoryId}) : super(key: key);
  final CategoryModel? category;
  final int selectedCategoryId;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.15,
      width:Get.width*0.2,

      child:Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.start,
        children: [

          Center(
            child: Stack(
                children:[
                  SizedBox(
                    height: Get.height*0.11,
                    width:Get.width*0.2,

                  ),
                  Positioned(
                    bottom:5,
                    child: Container(
                      height: Get.height*0.08,
                      width:Get.width*0.17,
                      decoration: BoxDecoration(
                        color:selectedCategoryId == category?.id?kDarkPinkColor:kLightPinkColor,
                        borderRadius: BorderRadius.circular(50), //
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:0,
                    child: CachedNetworkImage(
                      fit:  BoxFit.contain,
                      imageUrl: "https://cake.syncqatar.com${category?.img??""}",
                      imageBuilder: ((context, image){
                        return   Container(
                            height: Get.height*0.08,
                            width:Get.width*0.17,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: image,
                                fit:  BoxFit.contain,
                              ),
                            ));
                      }),
                      placeholder: (context, image){
                        return   Container(

                          height: Get.height*0.04,
                          width:Get.width*0.1,
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

                              height: Get.height*0.04,
                              width:Get.width*0.1,
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
                          height: Get.height*0.04,
                          width:Get.width*0.1,
                          child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                        );
                      },
                    ),
                  ),
                ]
            ),
          ),
           Center(
            child: CustomText(
          Get.find<StorageService>().activeLocale == SupportedLocales.english?category?.nameEn??"":category?.name??"",
              style:  TextStyle(

                fontSize: 15,
                letterSpacing: 0,
                fontFamily: fontFamilyArabicName,
                color:selectedCategoryId == category?.id?kDarkPinkColor:kLightPinkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}