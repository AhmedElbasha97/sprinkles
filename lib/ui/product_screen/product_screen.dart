import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration:  const BoxDecoration(
          color: kBackGroundColor
          ),
          child:   Center(
            child: Column(
              children: [
                Stack(

                  children:[
                    Container(
                      height: Get.height*0.25,
                      width:Get.width,
                      child:const Padding(padding: EdgeInsets.all(0),
                      ),
                    ),
                    Container(

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
                                    'كيك',
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
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
                                  child:  CustomText(
                                    'كيك',
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
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
                                    'كيك',
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    Positioned(
                      left:0,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: Get.height*0.225,
                            width: Get.width*0.6,
                            child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                          ),Positioned(
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
                                            offset: Offset(2.0, 2.0),
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
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
