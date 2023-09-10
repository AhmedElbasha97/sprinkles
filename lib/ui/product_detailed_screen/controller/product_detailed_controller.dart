// ignore_for_file: empty_catches

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/models/product_detailed_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/colors.dart';

class ProductDetailedController extends GetxController{
  CarouselController carouselController = CarouselController();
  ScrollController scrollController = ScrollController();
  int activeIndex = 0;
  bool productIsLoading = true;
  late ProductDetailedModel? productData;
  late List<ProductsModel>? productsList;
  final String productId;

  List<Widget> dotsList = [];

  ProductDetailedController(this.productId);
  @override
  Future<void> onInit() async {
    super.onInit();
    getProductData();

  }

  getProductData() async {
    productIsLoading = true;
    update();
    productData =
    await ProductServices.getProductDetails( productId);
    productsList = await ProductServices.getProducts(1,4);
    makingDotsForCarouselSlider();
    productIsLoading = false;
    update();
  }
  showWarningFavorite(context){
    showDialog(context: context,
        builder: (context) {
      return YesOrNoDialogue(alertText: 'لا تستطيع اضافه إلى قائمه المفضله إلا عند تسجيل دخول الحساب', alertTitle: 'لايمكنك اضافه إلى قائمه المفضله', alertYesButtonTitle: 'أنشاء حساب', alertNoButtonTitle: 'تسجيل حساب', alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
        Get.to(()=>const SignupScreen());
      }, alertNoButtonFunction: (){
        Get.to(()=>LoginScreen());
      }, alertYesButtonIcon: 'assets/icons/signUpIconDrawer.png', alertNoButtonIcon: 'assets/icons/loginIcon.png', alertIcon: 'assets/icons/favoriteIcon.png',containerHeight:Get.height*0.6);
    });
  }
  makingDotsForCarouselSlider(){
   int productLength = productData?.images?.length??0;
    dotsList = [];
    for(int i=0;i<productLength;i++){
      dotsList.add(
          InkWell(
            onTap:(){
              onImageChange(i);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width:10,
                  height:10,
                  decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    color:i==activeIndex?kDarkPinkColor:kBackGroundColor,
                  )


              ),
            ),
          )
      );
    }
  }
  onImageChange(int index){
    activeIndex = index;
    carouselController.jumpToPage(index);
    makingDotsForCarouselSlider();
    update();
  }
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  whatsapp(String contact) async{

    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help about this product which i saw in sprinkles app";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help about this product which i saw in sprinkles app')}";

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
}