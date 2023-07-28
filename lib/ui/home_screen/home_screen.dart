import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';
import '../product_screen/product_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
            image: DecorationImage(
                image: AssetImage("assets/images/homeBG2.jpg"),
                fit: BoxFit.cover),
          ),
          child:  Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      const Icon( Icons.subject_rounded ,color:Colors.white,size:30),
                      Row(
                        children:[
                          const Icon( Icons.search ,color:Colors.white,size:30),


                          SizedBox(
                            width:Get.width*0.05,
                          ),
                          const CustomText(
                            'English',
                            style: TextStyle(
                              fontSize:15,

                              fontFamily: fontFamilyEnglishName,
                              fontWeight: FontWeight.w600,
                              color: kBackGroundColor,
                            ),
                          ),
                        ]
                      )
                    ]
                  ),
                ),
                const SizedBox(height:40),
                InkWell(
                  onTap:(){
                    Get.to(()=>const ProductScreen());
                  },
                  child: Stack(
                   children:[
                     Container(
                       height: Get.height*0.15,
                       width:Get.width*0.8,
                       child:const Padding(padding: EdgeInsets.all(0),
                       ),
                     ),
                     Positioned(
            bottom:Get.height*0.005,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  height: Get.height*0.09,
                  width:Get.width*0.6,
                  decoration: BoxDecoration(
                    border: Border.all( color:kBackGroundColor,width: 2),
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
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kDarkPinkColor,kLightPinkColor],
                    ),borderRadius: BorderRadius.circular(40), //
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
                            color: kBackGroundColor,
                          ),
                        ),

                    ),
                  ),
              ),
              ),

                     Positioned(
                       left:0,
                       child: SizedBox(
                         height: Get.height*0.15,
                         width: Get.width*0.3,
                         child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                       ),
                     ),
                   ]
                  ),
                ),
                Stack(
                 children:[
                   Container(
                     height: Get.height*0.15,
                     width:Get.width*0.8,
                     child:const Padding(padding: EdgeInsets.all(0),
                     ),
                   ),
                   Positioned(
            bottom:Get.height*0.005,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: Get.height*0.09,
                width:Get.width*0.6,
                decoration: BoxDecoration(
                  border: Border.all( color:kBackGroundColor,width: 2),
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
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kDarkPinkColor,kLightPinkColor],
                  ),borderRadius: BorderRadius.circular(40), //
                ),
                child:  Center(
                  child:  CustomText(
                        'شيكولاتة',

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

                  ),
                ),
              ),
              ),

                   Positioned(
                     left:0,
                     child: SizedBox(
                       height: Get.height*0.15,
                       width: Get.width*0.3,
                       child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                     ),
                   ),
                 ]
                ),
                Stack(
                 children:[
                   Container(
                     height: Get.height*0.15,
                     width:Get.width*0.8,
                     child:const Padding(padding: EdgeInsets.all(0),
                     ),
                   ),
                   Positioned(
            bottom:Get.height*0.005,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: Get.height*0.09,
                width:Get.width*0.6,
                decoration: BoxDecoration(
                  border: Border.all( color:kBackGroundColor,width: 2),
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
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kDarkPinkColor,kLightPinkColor],
                  ),borderRadius: BorderRadius.circular(40), //
                ),
                child:  Center(
                  child:  CustomText(
                        'ورد',
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

                  ),
                ),
              ),
              ),

                   Positioned(
                     left:0,
                     child: SizedBox(
                       height: Get.height*0.15,
                       width: Get.width*0.3,
                       child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                     ),
                   ),
                 ]
                ),
                Stack(
                 children:[
                   Container(
                     height: Get.height*0.15,
                     width:Get.width*0.8,
                     child:const Padding(padding: EdgeInsets.all(0),
                     ),
                   ),
                   Positioned(
            bottom:Get.height*0.005,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: Get.height*0.09,
                width:Get.width*0.6,
                decoration: BoxDecoration(
                  border: Border.all( color:kBackGroundColor,width: 2),
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
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kDarkPinkColor,kLightPinkColor],
                  ),borderRadius: BorderRadius.circular(40), //
                ),
                child:  Center(
                  child:  CustomText(
                        'ديكور حفلات',
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

                  ),
                ),
              ),
              ),

                   Positioned(
                     left:0,
                     child: SizedBox(
                       height: Get.height*0.15,
                       width: Get.width*0.3,
                       child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                     ),
                   ),
                 ]
                ),
                Stack(
                 children:[
                   Container(
                     height: Get.height*0.15,
                     width:Get.width*0.8,
                     child:const Padding(padding: EdgeInsets.all(0),
                     ),
                   ),
                   Positioned(
            bottom:Get.height*0.005,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: Get.height*0.09,
                width:Get.width*0.6,
                decoration: BoxDecoration(
                  border: Border.all( color:kBackGroundColor,width: 2),
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
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kDarkPinkColor,kLightPinkColor],
                  ),borderRadius: BorderRadius.circular(40), //
                ),
                child:  Center(
                  child:  CustomText(
                        'قاعات مناسبات',
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

                  ),
                ),
              ),
              ),

                   Positioned(
                     left:0,
                     child: SizedBox(
                       height: Get.height*0.15,
                       width: Get.width*0.3,
                       child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                     ),
                   ),
                 ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
