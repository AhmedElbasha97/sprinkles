// ignore_for_file: empty_catches, avoid_print

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/ui/product_detailed_screen/product_detailed_screen.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, this.product}) : super(key: key);
final ProductsModel? product;
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  whatsapp(String contact) async{

    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{

    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Get.to(()=>const ProductDetailedScreen());
      },
      child: Container(
          width:Get.width*0.44,
          height:Get.height*0.305,
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
            borderRadius: BorderRadius.circular(15),
          ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children:[
                  Stack(
                    children: [

                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "https://cake.syncqatar.com${product?.images?[0]??""}",
                        imageBuilder: ((context, image){
                          return  ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width:Get.width*0.4,
                              height:Get.height*0.16,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: image,
                                    fit:  BoxFit.contain,
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

                                width:Get.width*0.38,
                                height:Get.height*0.14,
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
                            width:Get.width*0.38,
                            height:Get.height*0.14,
                            child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                          );
                        },
                      ),

                      Positioned(
                        right:5,
                        top:5,
                        child: Container(
                            height: Get.height*0.03,
                            width:Get.width*0.06,
                            decoration: BoxDecoration(
                              color:kLightPinkColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:const Center(
                              child:Icon(Icons.favorite,color:Colors.white,size:14),
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                             CustomText(
                              Get.find<StorageService>().activeLocale == SupportedLocales.english?product?.nameEn??"":product?.name??"",
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: Colors.black,
                              ),
                            ),
                             CustomText(
                              Get.find<StorageService>().activeLocale == SupportedLocales.english?product?.descEn??"":product?.desc??"",
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: Colors.black,
                              ),
                            ),
                             CustomText(
                              " عدد الافراد ${product?.persons??0}",
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: Colors.black,
                              ),
                            ),
                            RatingBar.builder(
                              initialRating:double.parse("${product?.persons??0}"),
                              minRating: 1,
                              itemSize:15,
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
                        Column(
                          children: [
                            InkWell(
                              onTap:(){
                                _makePhoneCall(product?.shop?.phone??"");
                                },
                              child: SizedBox(
                                height: Get.height*0.03,
                                width: Get.width*0.09,
                                child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                              ),
                            ),
                            InkWell(
                              onTap:(){
                                whatsapp(product?.shop?.whatsapp??"");
                              },
                              child: SizedBox(
                                height: Get.height*0.03,
                                width: Get.width*0.09,
                                child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
                              ),
                            ),
                            SizedBox(
                              height: Get.height*0.03,
                              width: Get.width*0.09,
                              child: Image.asset("assets/icons/s.png",fit: BoxFit.cover,),
                            ),

                          ],
                        ),
                      ]),
                  Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Container(
                          width:Get.width*0.18,
                          height:Get.height*0.028,
                          decoration: BoxDecoration(
                            color:const Color(0xFF810074).withAlpha(70),
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:  Center(
                            child: CustomText(
                              '${product?.price??0} ريال',
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width:Get.width*0.18,
                          height:Get.height*0.028,
                          decoration: BoxDecoration(
                            color:const Color(0xFF810074).withAlpha(70),
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
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: CustomText(
                              'أطلب الأن',
                              style: TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                              ),
                            ),
                          ),
                        ),
                      ]
                  )
                ]
            ),
          )
      ),
    );
  }
}
