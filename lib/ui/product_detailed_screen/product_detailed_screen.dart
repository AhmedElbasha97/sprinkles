// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/ui/product_detailed_screen/controller/product_detailed_controller.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/product_image_widget.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/read_more_widget.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/seller_product_loading_widget.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class ProductDetailedScreen extends StatefulWidget {
  const ProductDetailedScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailedScreen> createState() => _ProductDetailedScreenState();
}

class _ProductDetailedScreenState extends State<ProductDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  ProductDetailedController(),
      builder: (ProductDetailedController controller) => Scaffold(
        appBar: AppBar(
          backgroundColor:kBackGroundColor,
            actions:[
              Container(
                child: Row(
                    children:[

                      CustomText(
                        'أضف إلى المفضلة',
                        textAlign:TextAlign.left,
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
                      const Icon(
                          Icons.favorite_outline_rounded  ,color:kDarkPinkColor,size:20
                      ),
                    ]

                ),
              )
            ],
            leading:
              InkWell(
                onTap:(){
                  Get.back();
                },
                child: Container(
                  child: Row(
                    children:[
                      const Icon(
                        Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                      ),
                      CustomText(
                        'رجوع',
                        textAlign:TextAlign.left,
                        style: TextStyle(
                          shadows: <Shadow>[
                            Shadow(
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 0.5,

                                color: Colors.black.withOpacity(0.5)
                            ),
                          ],
                          fontSize: 13,
                          letterSpacing: 0,
                          fontFamily: fontFamilyArabicName,
                          color: kDarkPinkColor,
                        ),
                      ),
                    ]

                  ),
                ),
              )

        ),
        backgroundColor:kBackGroundColor,
        body:  SafeArea(
          child: SingleChildScrollView(
            controller:controller.scrollController,
            child: Container(
              width:Get.width,
              child: Column(
                children:[
                  Stack(
                    children: [
                      CarouselSlider.builder(
                        carouselController: controller.carouselController,
                        itemCount: controller.imageList.length,
                        itemBuilder: (BuildContext context, int index, int realIndex) {
                          return ProductImageWidget(imageUrl: controller.imageList[index], activeIndex: '${index+1}', imageTotalCount: '${controller.imageList.length}',);
                        },
                        options: CarouselOptions(
                            height:Get.height*0.4,
                            autoPlay: true,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            onPageChanged: (val, _) {
                                controller.onImageChange(val);
                            }
                        ),
                      ),
                      Positioned(
                        bottom:10,
                        left:Get.width*0.37,
                        child: Row(
                          children:controller.dotsList
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                      Container(
                      width:Get.width,
                      height:Get.height*0.14,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.white,

                        ),
                      ),
                        Positioned(
                          top:0,
                          left:0,
                          child: Container(
                            height:Get.height*0.14,
                            width: Get.width*0.35,
                            decoration:const BoxDecoration(
                              borderRadius:BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/cakeBG.png",
                                ),
                                fit:  BoxFit.cover,
                              ),

                            ),
                          ),
                        ),
                        Positioned(
                          left:5,
                          child: Container(
                            width:Get.width*0.2,
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.end,
                              children: [


                                SizedBox(
                                  height: Get.height*0.1,
                                  width:Get.width*0.2,
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right:0,
                          child: Container(
                              width:Get.width*0.65,
                              height:Get.height*0.14,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color:Colors.transparent,

                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children:[
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        'كيك الزفاف',
                                        style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: const Offset(0.5, 0.5),
                                                blurRadius: 0.5,

                                                color: Colors.black.withOpacity(0.5)
                                            ),
                                          ],
                                          fontSize: 16,
                                          letterSpacing: 0,
                                          fontFamily: fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                        ),
                                      ),

                                      RatingBar.builder(
                                        initialRating:3.5,
                                        minRating: 1,
                                        itemSize:20,
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

                                  CustomText(
                                    'السعر:1233435ريال',
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
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                      children:[
                                        InkWell(
                                          onTap:(){

                                          },
                                          child: Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.height*0.03,
                                                width: Get.width*0.09,
                                                child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                              ),
                                              CustomText(
                                                '10934324234',
                                                style: TextStyle(
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                        offset: const Offset(0.5, 0.5),
                                                        blurRadius: 0.5,

                                                        color: Colors.black.withOpacity(0.5)
                                                    ),
                                                  ],
                                                  fontSize: 13,
                                                  letterSpacing: 0,
                                                  fontFamily: fontFamilyArabicName,
                                                  color: kDarkPinkColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: Get.height*0.03,
                                              width: Get.width*0.09,
                                              child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
                                            ),
                                            CustomText(
                                              '10934324234',
                                              style: TextStyle(
                                                shadows: <Shadow>[
                                                  Shadow(
                                                      offset: const Offset(0.5, 0.5),
                                                      blurRadius: 0.5,

                                                      color: Colors.black.withOpacity(0.5)
                                                  ),
                                                ],
                                                fontSize: 13,
                                                letterSpacing: 0,
                                                fontFamily: fontFamilyArabicName,
                                                color: kDarkPinkColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  )
                                ]
                              ),
                            )

                          ),
                        ),

                      ],
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width:Get.width,
                  child: GridView.builder(
                    shrinkWrap:true,
                    controller:controller.scrollController,
                    itemCount: controller.tagsTitle.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio:1.7
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return  Container(
                          height: Get.height*0.02,
                        width:Get.width*0.3,
                          decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                            color:Colors.white,
                          ),
                          child: Center(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                CustomText(
                            controller.tagsTitle[index],
                                  style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: const Offset(0.5, 0.5),
                                          blurRadius: 0.5,

                                          color: Colors.black.withOpacity(0.5)
                                      ),
                                    ],
                                    fontSize: 13,
                                    letterSpacing: 0,
                                    fontFamily: fontFamilyArabicName,
                                    color: kDarkPinkColor,
                                  ),
                                ),
                                CustomText(
                                  controller.tagsValue[index],
                                  style: TextStyle(
                                    shadows: <Shadow>[
                                      Shadow(
                                          offset: const Offset(0.5, 0.5),
                                          blurRadius: 0.5,

                                          color: Colors.black.withOpacity(0.5)
                                      ),
                                    ],
                                    fontSize: 13,
                                    letterSpacing: 0,
                                    fontFamily: fontFamilyArabicName,
                                    color: kLightPinkColor,
                                  ),
                                ),
                              ]
                          ),
                          )
                      );
                    },
                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                  width:Get.width,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                    color:Colors.white,
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        'التفاصيل:',

                      textAlign:TextAlign.left,
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
                      const ReadMoreText("المزيد من التفاصيل المزيد من التفاصيل المزيد من التفاصيل المزيد من التفاصيل المزيد من التفاصيل المزيد من التفاصيل المزيد من التفاصيلالمزيد من التفاصيل المزيد من التفاصيلالمزيد من التفاصيل المزيد من التفاصيلالمزيد من التفاصيل المزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيلالمزيد من التفاصيل", colorClickableText: kLightPinkColor, style:  TextStyle(
                        fontSize: 13,
                        letterSpacing: 0,
                        fontFamily: fontFamilyArabicName,
                        color: kLightPinkColor,
                      ), textAlign: TextAlign.center, textDirection: TextDirection.rtl, semanticsLabel: '',),
                    ],
                  ),
                )
              ),
            ),

              Padding(
              padding: const EdgeInsets.all(8.0),
          child: Container(
              width:Get.width*0.95,
              height:Get.height*0.42,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color:Colors.white,
              ),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  CustomText(
                    'منتجات أخرى من نفس البائع:',
                    textAlign:TextAlign.left,
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
                  controller.productIsLoading?const SellerProductLoadingWidget():Container(
                    width:Get.width*0.95,
                    height:Get.height*0.33,
                    child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      shrinkWrap:true,
                      itemCount:controller.productList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:controller.productList?[index]),
                        );
                      },

                    ),
                  )
                ]
              ),
            )

          )

              ),
          ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
