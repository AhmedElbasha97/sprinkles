// ignore_for_file: empty_catches, avoid_print, sized_box_for_whitespace, prefer_adjacent_string_concatenation

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/services/stats_services.dart';
import 'package:sprinkles/ui/branches_list/branches_list_screen.dart';

import 'package:sprinkles/ui/ordering/ordering_screen.dart';
import 'package:sprinkles/ui/product_detailed_screen/controller/product_detailed_controller.dart';
import 'package:sprinkles/ui/product_detailed_screen/product_detailed_screen.dart';

import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key, this.product, required this.productAreAddedOrNot, required this.addingOrRemovingProductToFavorite, required this.mainCategoryId, required this.comingFromFavoriteList, required this.comingFromProductList, required this.comingFromProductDetails, required this.branchCategoryId, this.productDetailsFunction, required this.mainCategoryImg,}) : super(key: key);
final ProductsModel? product;
  final String mainCategoryImg;
  final bool productAreAddedOrNot ;
  final Function addingOrRemovingProductToFavorite;
  final int mainCategoryId;
  final int branchCategoryId;
  final bool comingFromFavoriteList;
  final bool comingFromProductList;
  final bool comingFromProductDetails;
  final Function? productDetailsFunction;
  Future<void> _makePhoneCall(String phoneNumber,context) async {
      if(product?.shop?.branch?.length != 0){
        String   messageTextWhatsApp = ' رأيت هذا ال ${product?.name??""} في تطبيق سبرينكلز و وأريد الاستفسار عنه \n I saw this ${product?.nameEn??""} In the Sprinkles app and I want to make an order ';
        var androidUrl = "whatsapp://send?phone=$phoneNumber&text=$messageTextWhatsApp /n ${product?.link}";
        var iosUrl = "https://wa.me/$phoneNumber?text=${Uri.parse(messageTextWhatsApp)} /n ${product?.link}";
        showDialog(context: context,
          builder: (context) =>
              BranchesListWidget(branch: product?.shop?.branch, androidUrl:androidUrl, iosUrl: iosUrl, shopId: "${product?.shop?.id??0}", productId: "${product?.id}",),);
      }else {
        var result = await StatsServices().sendingOrderNowOrWhatsAppOrCallHasBeenClicked("${product?.shop?.id??0}", "${product?.id}", OrderType.CALL.name, "0");
        if(result?.status == "true") {
          final Uri launchUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
          await launchUrl(launchUri);

        }

      }

    }



  whatsapp(String contact,context) async{
  String   messageTextWhatsApp = ' رأيت هذا ال ${product?.name??""} في تطبيق سبرينكلز و وأريد الاستفسار عنه \n I saw this ${product?.nameEn??""} In the Sprinkles app and I want to make an order ';
    try{
      if(Platform.isIOS){
        var iosUrl = "https://wa.me/$contact?text=${Uri.parse(messageTextWhatsApp)} /n ${product?.link}";
        if(product?.shop?.branch?.length != 0){
          showDialog(context: context,
            builder: (context) =>
                BranchesListWidget(branch: product?.shop?.branch, androidUrl: iosUrl, iosUrl: iosUrl, productId: "${product?.id}", shopId: "${product?.shop?.id??0}",),);
        }else {
          var result = await StatsServices().sendingOrderNowOrWhatsAppOrCallHasBeenClicked("${product?.shop?.id??0}", "${product?.id}", OrderType.WHATSAPP.name, "0");
          if(result?.status == "true") {
            await launchUrl(Uri.parse(iosUrl));
          }
        }
      }
      else{
        var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp /n ${product?.link}";
        if(product?.shop?.branch?.length != 0){
          showDialog(context: context,
            builder: (context) =>
                BranchesListWidget(branch: product?.shop?.branch, androidUrl: androidUrl, iosUrl: androidUrl,productId: "${product?.id}", shopId: "${product?.shop?.id??0}",),);
        }else {
          var result = await StatsServices().sendingOrderNowOrWhatsAppOrCallHasBeenClicked("${product?.shop?.id??0}", "${product?.id}", OrderType.WHATSAPP.name, "0");
          if(result?.status == "true") {
            await launchUrl(Uri.parse(androidUrl));

          }

        }
      }
    } on Exception{

    }
  }




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        bool test3 = Get.isRegistered<ProductDetailedController>();
        if(test3){
          Get.delete<ProductDetailedController>();
        }
        Get.to(() =>
            ProductDetailedScreen(productId: '${product?.id ?? 0}',
              mainCategoryId: mainCategoryId,
              comingFromProductList: comingFromProductList,
              comingFromFavoriteList: comingFromFavoriteList,
              comingFromProductDetails: comingFromProductDetails,
              branchCategoryId: branchCategoryId, mainCategoryImg: mainCategoryImg,),preventDuplicates: false);
        },
      child: Container(
          width:Get.width*0.44,

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
            padding: const EdgeInsets.only(top:8.0,left:8.0,right: 8.0,bottom: 8.0),
            child: Column(
                children:[
                  Stack(
                    children: [

                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "${Services.baseEndPoint}${product?.images?[0]??""}",
                        imageBuilder: ((context, image){
                          return  Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                width:Get.width*0.4,
                                height:Get.height*0.18,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: image,
                                      fit:  BoxFit.cover,
                                    ),
                                  )
                              ),
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

                      Positioned(
                        right:5,
                        top:5,
                        child: InkWell(
                          onTap:(){
                            addingOrRemovingProductToFavorite();

                          },
                          child: Container(
                              height: Get.height*0.03,
                              width:Get.width*0.06,
                              decoration: const BoxDecoration(
                                color:kLightPinkColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child:productAreAddedOrNot?const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size:14
                                ):const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size:14
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Container(
                      width:Get.width*0.45,
                      child: Row(

                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children:[
                            Container(
                              width:Get.width*0.3,
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.start,
                                children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(vertical: 2.0),
                                     child: CustomText(
                                      Get.find<StorageService>().activeLocale == SupportedLocales.english?product?.nameEn??"":product?.name??"",
                                       maxLines: 1,
                                      style: const TextStyle(
                                        height: 1.3,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: Colors.black,
                                      ),
                                  ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(vertical: 2.0),
                                     child: CustomText(

                                      Get.find<StorageService>().activeLocale == SupportedLocales.english?product?.shop?.nameEn??"":product?.shop?.name??"",
                                       maxLines: 2,
                                      style: const TextStyle(

                                        height: 1.3,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: Colors.black,
                                      ),
                                  ),
                                   ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                                    child: RatingBar.builder(
                                      initialRating:double.parse("${product?.rating??0}"),
                                      minRating: 1,
                                      itemSize:15,
                                      direction: Axis.horizontal,
                                      ignoreGestures:true,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.only(left: 2.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: InkWell(
                                    onTap:(){
                                      _makePhoneCall(product?.shop?.phone??"",context);
                                      },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 2.0),
                                      child: SizedBox(
                                        height: Get.height*0.03,
                                        width: Get.width*0.09,
                                        child: Image.asset("assets/icons/c.png",fit: BoxFit.fitHeight,),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: InkWell(
                                    onTap: (){
                                      whatsapp(product?.shop?.whatsapp??"",context);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 2,bottom: 2),
                                      child: SizedBox(
                                        height: Get.height*0.03,
                                        width: Get.width*0.09,
                                        child: Image.asset("assets/icons/w.png",fit: BoxFit.fitHeight,),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                                  child: InkWell(
                                    onTap: (){
                                      Share.share(product?.link??"");

                                    },
                                    child: SizedBox(
                                      height: Get.height*0.024,
                                      width: Get.width*0.09,
                                      child: Image.asset("assets/icons/s.png",fit: BoxFit.fitHeight,),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ]),
                    ),
                  ),
                  Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Container(
                          width:Get.width*0.18,
                          height:Get.height*0.028,
                          decoration: BoxDecoration(
                            color:const  Color(0xFFFFBDD2),
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
                              '${product?.price??0} ${currencyKey.tr}',
                              style: const TextStyle(
                                height: 1.3,
                                fontSize: 12,
                                letterSpacing: 0,
                                fontFamily: fontFamilyArabicName,
                                color:Color(0xFF641B46),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>OrderingScreen(productId: product?.id??0),transition:Transition.upToDown);
                          },
                          child: Container(
                            width:Get.width*0.18,
                            height:Get.height*0.028,
                            decoration: BoxDecoration(
                              color:const  Color(0xFFFFBDD2),
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
                                orderNow.tr,
                                style: const TextStyle(
                                  height: 1.3,
                                  fontSize: 12,
                                  letterSpacing: 0,
                                  fontFamily: fontFamilyArabicName,
                                  color:Color(0xFF641B46),
                                ),
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
