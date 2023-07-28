import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';
import '../home_screen/home_screen.dart';


class WelcomeScreenUI extends StatefulWidget {
  const WelcomeScreenUI({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenUI> createState() => _WelcomeScreenUIState();
}

class _WelcomeScreenUIState extends State<WelcomeScreenUI> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/homeBG.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height:Get.height*0.23),
              Column(

                children: [
                  SizedBox(
                    height: Get.height*0.3,
                    width: Get.width*0.8,
                    child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){
                          Get.to(()=>const HomeScreen());
                        },
                        child: Container(
                          height: Get.height*0.08,
                          width:Get.width*0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color:Colors.white.withOpacity(0.2),width: 4),
                              boxShadow: [
                                const BoxShadow(
                                  color: kLightPinkColor,
                                  offset: Offset(
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
                              color: Colors.white.withOpacity(0.2)
                          ),
                          child:  Container(
                            height:  Get.height*0.08,
                            width:Get.width*0.34,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
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
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white.withOpacity(0.2)
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  // Implement the stroke
                                  CustomText(
                                    'عربي',
                                    style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth =3
                                        ..color = kBackGroundColor,
                                    ),
                                  ),
                                  // The text inside
                                  const CustomText(
                                    'عربي',
                                    style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap:(){
                          Get.to(()=>const HomeScreen());
                        },
                        child: Container(
                          height:  Get.height*0.08,
                          width:Get.width*0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all( color:Colors.white.withOpacity(0.2),width: 4),
                              boxShadow: [
                                const BoxShadow(
                                  color: kLightPinkColor,
                                  offset: Offset(
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
                              color: Colors.white.withOpacity(0.2)
                          ),
                          child:  Container(
                            height:  Get.height*0.08,
                            width:Get.width*0.34,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(
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
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white.withOpacity(0.2)
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  // Implement the stroke
                                  CustomText(
                                    'English',
                                    style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyEnglishName,
                                      fontWeight: FontWeight.w900,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth =3
                                        ..color = kBackGroundColor,
                                    ),
                                  ),
                                  // The text inside
                                  const CustomText(
                                    'English',
                                    style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyEnglishName,
                                      fontWeight: FontWeight.w900,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


              Stack(
                children:[
                  Container(
                    height: Get.height*0.25,
                    width:Get.width,
                    child:const Padding(padding: EdgeInsets.all(0),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.025,
                    bottom:Get.height*0.17,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/4.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.13,
                    bottom:Get.height*0.12,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/3.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.27,
                    bottom:Get.height*0.09,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/1.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.42,
                    bottom:Get.height*0.07,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/2.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.56,
                    bottom:Get.height*0.045,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/5.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Positioned(
                    right: Get.width*0.7,
                    bottom:Get.height*0.01,
                    child:  SizedBox(
                      height: Get.height*0.08,
                      width: Get.width*0.14,
                      child: Image.asset("assets/icons/6.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
