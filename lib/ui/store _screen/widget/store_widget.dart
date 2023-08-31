// ignore_for_file: avoid_print, sized_box_for_whitespace, empty_catches

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
import 'package:sprinkles/models/shops_model.dart';
import 'package:sprinkles/ui/store_details_screen/store_details_screen.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget({Key? key, this.store}) : super(key: key);
 final ShopsModel? store;
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
    return Stack(
        children:[
          Container(
            height: Get.height*0.23,
            width:Get.width*0.9,
            child:const Padding(padding: EdgeInsets.all(0),
            ),
          ),
          Positioned(
            top:Get.height*0.005,
            left:Get.width*0.1,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: Get.height*0.05,
                width:Get.width*0.725,
                decoration: BoxDecoration(

                  border:  const Border(
                    bottom:BorderSide( color:kDarkPinkColor,width: 2,),
                    top:BorderSide( color:kDarkPinkColor,width: 2),
                    right:BorderSide( color:kDarkPinkColor,width: 7),
                    left:BorderSide( color:kDarkPinkColor,width: 5),

                  ),

                  borderRadius: BorderRadius.circular(40), //
                ),
                child:   Center(
                  child:  CustomText(
                    Get.find<StorageService>().activeLocale == SupportedLocales.english?store?.nameEn??"":store?.name??"",
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                      fontFamily: fontFamilyArabicName,
                      color: kDarkPinkColor,
                    ),
                  ),

                ),
              ),
            ),
          ),

          Positioned(
            left:0,
            child: Container(
              height: Get.height*0.15,
              width: Get.width*0.29,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/store frame.png"),
                    fit: BoxFit.fitHeight),
              ),
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: "https://cake.syncqatar.com${store?.image??""}",
                  imageBuilder: ((context, image){
                    return  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          height: Get.height*0.09,
                          width: Get.width*0.17,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.contain,
                            ),
                          )
                      ),
                    );
                  }),
                  placeholder: (context, image){
                    return   Container(

                      height: Get.height*0.09,
                      width: Get.width*0.17,
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

                          height: Get.height*0.07,
                          width: Get.width*0.15,
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
                      height: Get.height*0.09,
                      width: Get.width*0.17,
                      child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.contain,),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width*0.2,
            top:Get.height*0.1145,
            child: Container(
                height: Get.height*0.025,
                width:Get.width*0.05,
                decoration: BoxDecoration(
                  color:kLightPinkColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child:const Center(
                  child:Icon(Icons.favorite,color:Colors.white,size:12),
                )
            ),
          ),
          Positioned(
            left: Get.width*0.26,

            top:Get.height*0.09,
            child: Container(
                width:Get.width*0.61,
                child:Column(
                    crossAxisAlignment:CrossAxisAlignment.end,
                    children:[
                       Padding(
                         padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                         child: CustomText(
                          Get.find<StorageService>().activeLocale == SupportedLocales.english?store?.descEn??"":store?.desc??"",
                          style: const TextStyle(
                            fontSize: 12,
                            letterSpacing: 0,
                            fontFamily: fontFamilyArabicName,
                            color: kDarkPinkColor,
                          ),
                      ),
                       ),
                      Row(
                          children:[
                            InkWell(
                              onTap:(){
                                Get.to(()=>const StoreDetailedScreen());
                              },
                              child: SizedBox(
                                height: Get.height*0.04,
                                width: Get.width*0.2,
                                child: Image.asset("assets/icons/more.png",fit: BoxFit.fitWidth,),
                              ),
                            ),
                            InkWell(
                              onTap:(){
                                _makePhoneCall(store?.phone??"");
                              },
                              child: SizedBox(
                                height: Get.height*0.065,
                                width: Get.width*0.08,
                                child: Image.asset("assets/icons/c.png",fit: BoxFit.fitHeight,),
                              ),
                            ),
                            InkWell(
                              onTap:(){
                                whatsapp(store?.whatsapp??"");
                                },
                              child: SizedBox(
                                height: Get.height*0.065,
                                width: Get.width*0.08,
                                child: Image.asset("assets/icons/w.png",fit: BoxFit.fitHeight,),
                              ),
                            ),

                            RatingBar.builder(
                              initialRating:double.parse("${store?.rating??0}") ,
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

                          ]
                      ),
                    ]
                )
            ),
          ),
        ]
    );
  }
}
