// ignore_for_file: empty_catches

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/product_detailed_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Utils/colors.dart';

class ProductDetailedController extends GetxController{
  bool productAreAddedOrNot = false;
  bool checker =false;
  CarouselController carouselController = CarouselController();
  ScrollController scrollController = ScrollController();
  int activeIndex = 0;
  bool productIsLoading = true;
  late ProductDetailedModel? productData;
  late List<ProductsModel>? productsList;
  final String productId;
  List<Widget> dotsList = [];
  String messageTextWhatsApp = "";
  ProductDetailedController(this.productId, this.mainCategoryId, this.branchCategoryId,);
  final int mainCategoryId;
  final int branchCategoryId;
  int selectedProductId = 24543;
  @override
  Future<void> onInit() async {
    super.onInit();

    getProductData();
  }
   checkProductsAddedOrNet(String productId) async {
     if(Get.find<StorageService>().checkUserIsSignedIn) {
       FavoriteStatusModel? data = await FavoriteServices
           .getProductIsInFavoriteOrNot(productId);
       if (data == 1) {
         checker = true;
       } else {
         checker = false;
       }
     }else{
       checker = false;
     }
  }
   checkerProductsAddedOrNet(String productId) async {
     if(Get.find<StorageService>().checkUserIsSignedIn) {
       FavoriteStatusModel? data = await FavoriteServices
           .getProductIsInFavoriteOrNot(productId);
       if (data == 1) {
         return true;
       } else {
         return false;
       }
     }else{
       return false;
     }
  }
  addingOrRemovingProductsToFavorite(context,String productId) async {
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if( await checkProductsAddedOrNet(productId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: 'حدث خطأ', alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }

      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: 'حدث خطأ', alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }

      }
    }else{
      showWarningFavorite(context);
    }
  }
  checkProductAddedOrNet() async {
    FavoriteStatusModel? data= await  FavoriteServices.getProductIsInFavoriteOrNot(productId);
    if(data?.status == 1){
      productAreAddedOrNot = true;
    }else{
      productAreAddedOrNot = false;
    }
  }
  addingOrRemovingProductToFavorite(context) async {
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if(productAreAddedOrNot){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: 'حدث خطأ', alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }
        await checkProductAddedOrNet();
        update();
      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: 'حدث خطأ', alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }
        await checkProductAddedOrNet();
        update();
      }
    }else{
      showWarningFavorite(context);
    }
  }
  selectingAnotherItem(int itemId ){
    selectedProductId = itemId;
    update();
    getProductData();
  }
  getProductData() async {
    productIsLoading = true;
    update();
    if(selectedProductId != 24543){
      productData =
      await ProductServices.getProductDetails("$selectedProductId");
      productsList =
      await ProductServices.getProducts(mainCategoryId, productData?.ctg?.id??0, "0");
      productsList?.removeWhere((element)=>
      element.id == selectedProductId
      );
    }else {
      productData =
      await ProductServices.getProductDetails(productId);
      productsList =
      await ProductServices.getProducts(mainCategoryId, productData?.ctg?.id??0, "0");
      productsList?.removeWhere((element)=>
        "${element.id}" == productId
      );
    }

    makingDotsForCarouselSlider();
    if(Get.find<StorageService>().checkUserIsSignedIn) {
      checkProductAddedOrNet();
    }
    messageTextWhatsApp = " في تطبيق sprinkles وأريد عمل اوردر ${Get.find<StorageService>().activeLocale == SupportedLocales.english?productData?.nameEn??"":productData?.name??""}رأيت هذا ال";
    productIsLoading = false;
    update();
  }
  showWarningFavorite(context){
    showDialog(context: context,
        builder: (context) {
      return YesOrNoDialogue(alertText: 'لا تستطيع اضافه إلى قائمه المفضله إلا عند تسجيل دخول الحساب', alertTitle: 'لايمكنك اضافه إلى قائمه المفضله', alertYesButtonTitle: 'إنشاء حساب', alertNoButtonTitle: 'تسجيل دخول', alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
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

    var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse(messageTextWhatsApp)}";

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