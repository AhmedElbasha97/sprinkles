// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/ui/home_screen/controller/home_controller.dart';
import 'package:sprinkles/ui/home_screen/widget/home_loading_widget.dart';
import 'package:sprinkles/ui/home_screen/widget/home_widget.dart';
import 'package:sprinkles/widgets/DrawerWidget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../Utils/constant.dart';
import '../product_screen/product_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init:  HomeController(),
      builder: (HomeController controller) =>  SafeArea(
        child: Scaffold(
          key: _scaffoldState,
          drawer:const AppDrawers(),
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
                            _scaffoldState.currentState!.openDrawer();
                          },
                            child: const Icon( Icons.subject_rounded ,color:Colors.white,size:30)),
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
