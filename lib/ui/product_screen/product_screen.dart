// ignore_for_file: avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/ui/store_cake%20_screen/store_cake_screen.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 List<String> governmentData = ["ترتيب حسب السعر","ترتيب حسب الاسم","ترتيب حسب التصنيف"];
 ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  SingleChildScrollView(
          controller: scrollController,
          child: Container(
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
                                child: InkWell(
                                  onTap:(){
                                    Get.to(()=>const CakeStoreScreen());
                                  },
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
                                        'عرض محلات الكيك',
                                        style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: const Offset(1.0, 1.0),
                                                blurRadius: 3.0,

                                                color: Colors.black.withOpacity(0.5)
                                            ),
                                          ],
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontFamily: fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:Get.height*0.01,
                              ),
                              PopupMenuButton<String>(
                                itemBuilder: (context) =>
                                    governmentData.map((e){
                                      return   PopupMenuItem(
                                        value:"${e}",
                                        textStyle: const TextStyle(
                                            color: kDarkPinkColor,
                                            fontFamily: fontFamilyArabicName,
                                            fontWeight: FontWeight.w700),
                                        onTap: (){

                                        },
                                        child: SizedBox(
                                          width: Get.width,
                                          child: Column(
                                            children: [
                                              CustomText(
                                                e,
                                                style: const TextStyle(
                                                    color: kDarkPinkColor,
                                                    fontFamily: fontFamilyArabicName,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                color: kDarkPinkColor,
                                                height: 1,
                                                thickness: 1,
                                                endIndent: 0,
                                                indent: 0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),

                                child: Padding(
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
                                      child:  Padding(
                                        padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            CustomText(
                                              'ترتيب حسب',
                                              style: TextStyle(
                                                shadows: <Shadow>[
                                                  Shadow(
                                                      offset: const Offset(1.0, 1.0),
                                                      blurRadius: 3.0,

                                                      color: Colors.black.withOpacity(0.5)
                                                  ),
                                                ],
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontFamily: fontFamilyArabicName,
                                                color: kDarkPinkColor,
                                              ),
                                            ),
                                            const Icon( Icons.arrow_downward_sharp ,color:kDarkPinkColor,size:20),
                                          ],
                                        ),
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
                                  child:TextField(

                                    textAlign:TextAlign.center,
                                    cursorColor: kDarkPinkColor,
                                    textInputAction: TextInputAction.search,
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                    decoration:  InputDecoration(
                                      isDense: true,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide: const BorderSide(width: 1, color: kDarkPinkColor,),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:   const BorderSide(color: kDarkPinkColor,width: 1.0),
                                            borderRadius: BorderRadius.circular(15)),

                                        hintText: "بحث",
                                        hintStyle: TextStyle(

                                          shadows: <Shadow>[
                                            Shadow(
                                                offset: const Offset(1.0, 1.0),
                                                blurRadius: 3.0,

                                                color: Colors.black.withOpacity(0.5)
                                            ),
                                          ],
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          fontFamily: fontFamilyArabicName,
                                          color: kDarkPinkColor,
                                        ),

                                        suffixIcon:   const Icon(
                                          Icons.search_outlined,
                                          color: kDarkPinkColor,
                                          size: 20,),
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
                        Container(
                        height: Get.height*0.235,
                          width: Get.width*0.6,
                        ),
                          Positioned(
                              top:0,
                              child: SizedBox(
                                height: Get.height*0.235,
                                width: Get.width*0.6,
                                child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                              )),
                            Positioned(
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
                                              offset: const Offset(2.0, 2.0),
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
                  ),

              Container(
                width:Get.width*0.95,
                height: Get.height*0.15,
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection:Axis.horizontal,
                  shrinkWrap:true,
                    itemCount:20,
                  itemBuilder: (BuildContext context, int index) { return
                    Container(
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
                                      color:kLightPinkColor,
                                      borderRadius: BorderRadius.circular(50), //
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:5,
                                  child: SizedBox(
                                    height: Get.height*0.14,
                                    width:Get.width*0.22,
                                    child: Image.asset("assets/images/Untitled-1.png",fit: BoxFit.fitHeight,),
                                  ),
                                ),
                              ]
                          ),
                        ),
                        const Center(
                          child: CustomText(
                            'كيك',
                            style: TextStyle(

                              fontSize: 15,
                              letterSpacing: 0,
                              fontFamily: fontFamilyArabicName,
                              color: kLightPinkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ); },

                ),
              ),
                  Container(

                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width:Get.width*0.44,
                                  height:Get.height*0.3,
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
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: SizedBox(
                                                  width:Get.width*0.4,
                                                  height:Get.height*0.16,
                                                  child: Image.asset("assets/images/WhatsApp Image 2023-07-27 at 04.44.29.jpg",fit: BoxFit.cover,),
                                                ),
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
                                                    const CustomText(
                                                      'كلاسيك',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'كيك شيكولاته',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'عدد الافراد 8',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    RatingBar.builder(
                                                      initialRating: 3,
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
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
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
                                                  child: const Center(
                                                    child: CustomText(
                                                      '180 ريال',
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

                              Container(
                                width:Get.width*0.44,
                                height:Get.height*0.3,
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
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: SizedBox(
                                              width:Get.width*0.4,
                                              height:Get.height*0.16,
                                              child: Image.asset("assets/images/WhatsApp Image 2023-07-27 at 04.44.29.jpg",fit: BoxFit.cover,),
                                            ),
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
                                                const CustomText(
                                                  'كلاسيك',
                                                  style: TextStyle(
                                                    height: 1.3,
                                                    fontSize: 12,
                                                    letterSpacing: 0,
                                                    fontFamily: fontFamilyArabicName,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const CustomText(
                                                  'كيك شيكولاته',
                                                  style: TextStyle(
                                                    height: 1.3,
                                                    fontSize: 12,
                                                    letterSpacing: 0,
                                                    fontFamily: fontFamilyArabicName,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const CustomText(
                                                  'عدد الافراد 8',
                                                  style: TextStyle(
                                                    height: 1.3,
                                                    fontSize: 12,
                                                    letterSpacing: 0,
                                                    fontFamily: fontFamilyArabicName,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: 3,
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
                                                SizedBox(
                                                  height: Get.height*0.03,
                                                  width: Get.width*0.09,
                                                  child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                                ),
                                                SizedBox(
                                                  height: Get.height*0.03,
                                                  width: Get.width*0.09,
                                                  child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
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
                                            child: const Center(
                                              child: CustomText(
                                                '180 ريال',
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  width:Get.width*0.44,
                                  height:Get.height*0.3,
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
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: SizedBox(
                                                  width:Get.width*0.4,
                                                  height:Get.height*0.16,
                                                  child: Image.asset("assets/images/WhatsApp Image 2023-07-27 at 04.44.29.jpg",fit: BoxFit.cover,),
                                                ),
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
                                                    const CustomText(
                                                      'كلاسيك',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'كيك شيكولاته',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'عدد الافراد 8',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    RatingBar.builder(
                                                      initialRating: 3,
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
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
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
                                                  child: const Center(
                                                    child: CustomText(
                                                      '180 ريال',
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

                              Container(
                                  width:Get.width*0.44,
                                  height:Get.height*0.3,
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
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: SizedBox(
                                                  width:Get.width*0.4,
                                                  height:Get.height*0.16,
                                                  child: Image.asset("assets/images/WhatsApp Image 2023-07-27 at 04.44.29.jpg",fit: BoxFit.cover,),
                                                ),
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
                                                    const CustomText(
                                                      'كلاسيك',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'كيك شيكولاته',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const CustomText(
                                                      'عدد الافراد 8',
                                                      style: TextStyle(
                                                        height: 1.3,
                                                        fontSize: 12,
                                                        letterSpacing: 0,
                                                        fontFamily: fontFamilyArabicName,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    RatingBar.builder(
                                                      initialRating: 3,
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
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/c.png",fit: BoxFit.cover,),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height*0.03,
                                                      width: Get.width*0.09,
                                                      child: Image.asset("assets/icons/w.png",fit: BoxFit.cover,),
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
                                                  child: const Center(
                                                    child: CustomText(
                                                      '180 ريال',
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0,5.0,15.0,5.0),
                          child: Container(
                            height: Get.height*0.2,
                            width:Get.width,
                            color:Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CarouselSlider(
                                options:  CarouselOptions(
                                    height: Get.height*0.19,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: false,
                                    viewportFraction: 1,
                                    autoPlay: true),

                                items: [
                                  SizedBox(
                                    width:Get.width,
                                    height:Get.height*0.16,
                                    child: Image.asset("assets/images/hospitalImage.jpg",fit: BoxFit.cover,),
                                  ),
                                  SizedBox(
                                    width:Get.width,
                                    height:Get.height*0.16,
                                    child: Image.asset("assets/images/hospitalImage.jpg",fit: BoxFit.cover,),
                                  ),
                                  SizedBox(
                                    width:Get.width,
                                    height:Get.height*0.16,
                                    child: Image.asset("assets/images/hospitalImage.jpg",fit: BoxFit.cover,),
                                  ),],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}