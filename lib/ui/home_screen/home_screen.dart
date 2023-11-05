// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/filter/controller/filter_controller.dart';
import 'package:sprinkles/ui/filter/filter_screen.dart';
import 'package:sprinkles/ui/home_screen/controller/home_controller.dart';
import 'package:sprinkles/ui/home_screen/widget/home_loading_widget.dart';
import 'package:sprinkles/ui/home_screen/widget/home_widget.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import '../../Utils/constant.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  HomeController(),
      builder: (HomeController controller) =>  SafeArea(
        child: Scaffold(
          key: controller.scaffoldState,
          drawer: AppDrawers(scaffoldKey: controller.scaffoldState,),
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
                        InkWell(
                          onTap:(){
                            controller.scaffoldState.currentState!.openDrawer();
                          },
                            child: const Icon( Icons.subject_rounded ,color:Colors.white,size:30)),
                        Row(
                          children:[
                            InkWell(
                              onTap: (){
                                bool test4 = Get.isRegistered<FilterController>();
                                if(test4){
                                  Get.delete<FilterController>();
                                }
                                Get.to(() => const FilterScreen(),
                                    transition: Transition.upToDown);


                              },
                                child: const Icon( Icons.search ,color:Colors.white,size:30)),


                            SizedBox(
                              width:Get.width*0.05,
                            ),
                            InkWell(
                              onTap: (){
                                final Locale newLocale =
                                Get.find<StorageService>().activeLocale == SupportedLocales.arabic
                                    ? SupportedLocales.english
                                    : SupportedLocales.arabic;
                                //in storage
                                Get.find<StorageService>().activeLocale = newLocale;
                                //in Getx
                                Get.updateLocale(newLocale);
                              },
                              child: CustomText(
                                translateButton.tr,
                                style:  TextStyle(
                                  fontSize:15,
                                  fontFamily: Get
                                      .find<StorageService>()
                                      .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                  fontWeight: FontWeight.w600,
                                  color: kBackGroundColor,
                                ),
                              ),
                            ),
                          ]
                        )
                      ]
                    ),
                  ),
                  const SizedBox(height:40),
                  Container(
                    height:Get.height*0.73,
                    width:Get.width*0.8,
                    child:controller.isLoading?const HomeLoadingWidget():ListView.builder(
                      physics: const BouncingScrollPhysics(),

                      itemCount:controller.dataHomeCategory?.length,
                      itemBuilder: (_, index) {
                        return HomeWidget(category:controller.dataHomeCategory?[index]);
                      },
                  )

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
