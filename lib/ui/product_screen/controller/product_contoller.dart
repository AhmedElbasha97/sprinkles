// ignore_for_file: avoid_print, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/advertisment_model.dart';
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/main_category_data.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/services/advrtisment_services.dart';
import 'package:sprinkles/services/category_services.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:sprinkles/services/seaarch_and_filters_services.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/alert_dialogue.dart';

class ProductController extends GetxController {
  bool productIsLoading = true;
  bool categoryIsLoading = true;
  bool advertisementsIsLoading = true;
  late MainCategoryTapModel? data;
  final int mainCategoryId;
   final BuildContext context;
   final bool selectingFromDrawer;
  ProductController(this.mainCategoryId, this.context, this.selectingFromDrawer);
  late TextEditingController searchController;
  bool hasBeenSelectedFromDrawer = false;
  List<String> governmentData = [removeFilterTitle.tr,priceFilterDescTitle.tr,priceFilterDescTitle.tr,nameFilterDescTitle.tr,nameFilterAscTitle.tr,];
  ScrollController scrollController = ScrollController();
  int selectedSubCategoryId = 0;
  String selectingFilterTag = "0";
  String selectingFilterTagName = removeFilterValue.tr;
  late List<ProductsModel>? productList;
  late List<CategoryModel>? subCategoryList;
  late List<CategoryModel>? mainCategoryList;
  late List<AdvertisementModel>? advertList;
 bool activateSearching = false;
 int selectedMainCategoryId = 240;
  bool mainCategoryIsLoading = true;
  List<Widget> products = [];
 final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Future<void> onInit() async {
    super.onInit();
    hasBeenSelectedFromDrawer = selectingFromDrawer;
    searchController = TextEditingController();
    if(selectingFromDrawer){
      await getMainCategoryData();
    }else{
      await getSubCategoryData();
    }
    await  getAdvertisementsData();
  }
  getMainCategoryData() async {
    mainCategoryList = await CategoryServices.getHomeCategory();

    mainCategoryIsLoading = false;
    update();
  }
  selectingFilter(String filterName){
    switch(filterName){
      case "Remove sort order":{
        selectingFilterTag = "0";
        selectingFilterTagName = removeFilterValue.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case "Price from lowest price to highest price":{
        selectingFilterTag = Filters.price_desc.name;
        selectingFilterTagName = priceFilterDescTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case "Price from highest price to lowest price":{
        selectingFilterTag = Filters. price_asc.name;
        selectingFilterTagName = priceFilterAscTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case "Sort by name from Z to A":{
        selectingFilterTag =  Get.find<StorageService>().activeLocale == SupportedLocales.english?Filters.name_en_desc.name:Filters.name_desc.name;
        selectingFilterTagName = nameFilterDescTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case "Sort by name from A to Z":{
        selectingFilterTag =  Get.find<StorageService>().activeLocale == SupportedLocales.english?Filters.name_en_asc.name:Filters.name_asc.name;
        selectingFilterTagName = priceFilterAscTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case"ازاله ترتيب حسب":{
        selectingFilterTag = "0";
        selectingFilterTagName = removeFilterValue.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case"السعر من الأقل سعر إلى أعلى السعر":{
        selectingFilterTag = Filters.price_desc.name;
        selectingFilterTagName = priceFilterDescTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case"السعر من أعلى سعر إلى الأقل السعر":{
        selectingFilterTag = Filters. price_asc.name;
        selectingFilterTagName = priceFilterAscTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case"ترتيب حسب الاسم من ى إلى أ":{
        selectingFilterTag =  Get.find<StorageService>().activeLocale == SupportedLocales.english?Filters.name_en_desc.name:Filters.name_desc.name;
        selectingFilterTagName = nameFilterDescTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
      case"ترتيب حسب الاسم من أ إلى ى":{
        selectingFilterTag =  Get.find<StorageService>().activeLocale == SupportedLocales.english?Filters.name_en_asc.name:Filters.name_asc.name;
        selectingFilterTagName = priceFilterAscTitle.tr;
        update();
        if(activateSearching){
          searchingForKeyword();
        }else{
          getProductData(true);
        }
      }
      break;
    }
  }
  String removeAllWhitespaces(String string) {
    return string.replaceAll(' ', '');
  }
  selectingCategoryFromMainCategory(int mainCategoryId){
    selectedMainCategoryId = mainCategoryId;
    getSubCategoryData();
    getAdvertisementsData();
  }
  searchingForKeyword() async {

    if(removeAllWhitespaces(searchController.text)==""){
      activateSearching = false;
      getProductData(true);
    }else{
      productIsLoading = true;
      activateSearching = true;
      update();
      if(selectingFromDrawer)
      {
        if(selectedMainCategoryId==240){
          productList = await SearchAndFilterServices.searchForProducts(searchController.text,selectingFilterTag);
        }else{
          productList = await SearchAndFilterServices.searchForProductsInMainCategory(selectedMainCategoryId,searchController.text,selectingFilterTag);
        }
        productList = await SearchAndFilterServices.searchForProductsInMainCategory(selectedMainCategoryId,searchController.text,selectingFilterTag);
      }else{
        productList = await SearchAndFilterServices.searchForProducts(searchController.text,selectingFilterTag);
      }

      if(productList?.length != 0){
        await fillingData();
      }
      productIsLoading = false;
      update();
    }

  }
  getProductData(bool changingTap) async {

    if(changingTap) {
      productIsLoading = true;
      update();
    }
    if(selectingFromDrawer) {
      if (selectedMainCategoryId == 240) {

        productList = await ProductServices.getAllProduct(selectingFilterTag);
      } else {
        productList = await ProductServices.getProducts(
            selectedMainCategoryId, selectedSubCategoryId, selectingFilterTag);
      }
    }else{
      productList = await ProductServices.getProducts(
          mainCategoryId, selectedSubCategoryId, selectingFilterTag);
    }
    if(productList?.length != 0){
     await fillingData();
    }

    print("the length of widget list iS ${products.length}");
    productIsLoading = false;
    update();
  }

  Future<bool> checkProductAddedOrNet(String productId) async {
    FavoriteStatusModel? data= await  FavoriteServices.getProductIsInFavoriteOrNot(productId);
    if(data?.status == 1){
      return true;
    }else{
      return false;
    }
  }
  addingOrRemovingProductToFavorite(context,String productId,int index,bool doubleProductOrNot) async {
    var i = 0;
    if(index != 0){
      i = index - 1;
    }
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if( await checkProductAddedOrNet(productId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }
      if(doubleProductOrNot){
        var checker =await checkProductAddedOrNet("${productList?[index].id}");
        var checker1 =await checkProductAddedOrNet("${productList?[index+1].id}");
        products[i]=Padding(
          padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
          child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children:[
                ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                  addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                }, mainCategoryId: mainCategoryId, comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true, branchCategoryId: selectedSubCategoryId,),

                ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                  addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
              ]
          ),
        );
        update();
      }else{
        var checker =await checkProductAddedOrNet("${productList?[index].id}");
        products[i]=Column(
          children: [
            Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children:[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                        addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                      }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                  ),

                ]
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
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

                    items: advertList!.map(
                            (e){
                          return InkWell(
                            onTap:(){
                              selectingAdvertisements(e.link??"",e.id??0);
                            },
                            child:CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: "https://cake.syncqatar.com${e.img??""}",
                              imageBuilder: ((context, image){
                                return  ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      width:Get.width,
                                      height:Get.height*0.16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: image,
                                          fit:  BoxFit.cover,
                                        ),
                                      )
                                  ),
                                );
                              }),
                              placeholder: (context, image){
                                return   Container(

                                  width:Get.width,
                                  height:Get.height*0.16,
                                  decoration:BoxDecoration(
                                    color:  const Color(0xFFDFDDDF),
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate(); // this wraps the previous Animate in another Animate


                              },
                              errorWidget: (context, url, error){
                                return SizedBox(
                                  width:Get.width,
                                  height:Get.height*0.16,
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.contain,),
                                );
                              },
                            ),
                          );

                        }
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
        update();
      }

      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }else{
          if(doubleProductOrNot){
            var checker =await checkProductAddedOrNet("${productList?[index].id}");
            var checker1 =await checkProductAddedOrNet("${productList?[index+1].id}");
            products[i]=Padding(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId),

                    ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                  ]
              ),
            );
            update();
          }else{
            var checker =await checkProductAddedOrNet("${productList?[index].id}");
            products[i]=Column(
              children: [
                Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children:[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                            addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                          }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                      ),

                    ]
                ),
                Padding(
                  padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
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

                        items: advertList!.map(
                                (e){
                              return InkWell(
                                onTap:(){
                                  selectingAdvertisements(e.link??"",e.id??0);
                                },
                                child:CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://cake.syncqatar.com${e.img??""}",
                                  imageBuilder: ((context, image){
                                    return  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                          width:Get.width,
                                          height:Get.height*0.16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image,
                                              fit:  BoxFit.cover,
                                            ),
                                          )
                                      ),
                                    );
                                  }),
                                  placeholder: (context, image){
                                    return   Container(

                                      width:Get.width,
                                      height:Get.height*0.16,
                                      decoration:BoxDecoration(
                                        color:  const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate(); // this wraps the previous Animate in another Animate


                                  },
                                  errorWidget: (context, url, error){
                                    return SizedBox(
                                      width:Get.width,
                                      height:Get.height*0.16,
                                      child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.contain,),
                                    );
                                  },
                                ),
                              );

                            }
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            );
            update();
          }
        }
      }

    }else{
      showWarningFavorite(context);
    }
  }
  showWarningFavorite(context){
    showDialog(context: context,
        builder: (context) {
          return YesOrNoDialogue(alertText: addToFavoriteValue.tr, alertTitle: addToFavoriteTitle.tr, alertYesButtonTitle: signUpProfile.tr, alertNoButtonTitle: signInProfile.tr, alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
            Get.to(()=>const SignupScreen());
          }, alertNoButtonFunction: (){
            Get.to(()=>LoginScreen());
          }, alertYesButtonIcon: 'assets/icons/signUpIconDrawer.png', alertNoButtonIcon: 'assets/icons/loginIcon.png', alertIcon: 'assets/icons/favoriteIcon.png',containerHeight:Get.height*0.6);
        });
  }
  getSubCategoryData() async {
    if(selectedMainCategoryId!=240){
      subCategoryList = await CategoryServices.getSupCategory(selectedMainCategoryId);
      data = await ProductServices.getMainProductData("$selectedMainCategoryId");
      categoryIsLoading = false;
      update();
    }else{
      subCategoryList = await CategoryServices.getSupCategory(mainCategoryId);
      data = await ProductServices.getMainProductData("$mainCategoryId");
      categoryIsLoading = false;
      update();
    }

  }
  getAdvertisementsData() async {
    if(selectingFromDrawer){
      advertList = await AdvertisementServices.getAdvertisements(selectedMainCategoryId);
      await  getProductData(true);
      advertisementsIsLoading = false;
      update();
    }else{
      advertList = await AdvertisementServices.getAdvertisements(mainCategoryId);
      await  getProductData(true);
      advertisementsIsLoading = false;
      update();
    }

  }
  selectingAnotherSubCategory(int subCategoryId){
    selectedSubCategoryId = subCategoryId;

    getAdvertisementsData();
  }
  selectingAdvertisements(String link,int advertisementsId) async {
    await AdvertisementServices.advertisementsHasBeenViewed("$advertisementsId");
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url,mode:LaunchMode.externalNonBrowserApplication)) {
    throw Exception('Could not launch $url');
    }
  }
  fillingData()  async {
    products = [];
print("hi from fill data${productList?.length}");
      for (int i = 0; i <= productList!.length-1; i=i+2) {
        if(i<productList!.length-1){

          print("hi from fill data${i} hi 2product");
          var checker =await checkProductAddedOrNet("${productList?[i].id}");
          var checker1 =await checkProductAddedOrNet("${productList?[i+1].id}");
          products.add(
            Padding(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
             ProductWidget(product:productList?[i], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,true);
                  }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId),

                 ProductWidget(product:productList?[i+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productList?[i+1].id}",i,true);
                  }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                ]
              ),
            )
          );
          if(i%2==0&&i!=0||productList!.length == 2){
            print(i);
            if(advertList?.length !=0) {
              products.add(
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  child: Container(
                    height: Get.height * 0.2,
                    width: Get.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: Get.height * 0.19,
                            aspectRatio: 2.0,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlay: true),

                        items: advertList?.map(
                                (e) {
                              return InkWell(
                                onTap: () {
                                  selectingAdvertisements(
                                      e.link ?? "", e.id ?? 0);
                                },
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://cake.syncqatar.com${e.img ??
                                      ""}",
                                  imageBuilder: ((context, image) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                          width: Get.width,
                                          height: Get.height * 0.16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                      ),
                                    );
                                  }),
                                  placeholder: (context, image) {
                                    return Container(

                                      width: Get.width,
                                      height: Get.height * 0.16,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                    ).animate(onPlay: (controller) =>
                                        controller.repeat())
                                        .shimmer(duration: 1200.ms,
                                        color: kDarkPinkColor.withAlpha(10))
                                        .animate(); // this wraps the previous Animate in another Animate


                                  },
                                  errorWidget: (context, url, error) {
                                    return SizedBox(
                                      width: Get.width,
                                      height: Get.height * 0.16,
                                      child: Image.asset(
                                        "assets/images/logo sprinkles.png",
                                        fit: BoxFit.contain,),
                                    );
                                  },
                                ),
                              );
                            }
                        ).toList(),
                      ),
                    ),
                  ),
                ),
              );
            }
          }
        }
        else{
          print("hi from fill data${i} hi 1product");
          var checker =await checkProductAddedOrNet("${productList?[i].id}");
          products.add(
              Column(
                children: [
                  Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:productList?[i], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                            addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,false);
                          }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                        ),

                      ]
                  ),
                  advertList?.length !=0?Padding(
                    padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
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

                          items: advertList!.map(
                              (e){
                                return InkWell(
                                  onTap:(){
                                    selectingAdvertisements(e.link??"",e.id??0);
                                  },
                                child:CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://cake.syncqatar.com${e.img??""}",
                                  imageBuilder: ((context, image){
                                    return  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                          width:Get.width,
                                          height:Get.height*0.16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: image,
                                              fit:  BoxFit.cover,
                                            ),
                                          )
                                      ),
                                    );
                                  }),
                                  placeholder: (context, image){
                                    return   Container(

                                      width:Get.width,
                                      height:Get.height*0.16,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate(); // this wraps the previous Animate in another Animate


                                  },
                                  errorWidget: (context, url, error){
                                    return SizedBox(
                                      width:Get.width,
                                      height:Get.height*0.16,
                                      child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.contain,),
                                    );
                                  },
                                ),
                                );

                              }
                          ).toList(),
                        ),
                      ),
                    ),
                  ):const SizedBox(),
                ],
              )
          );
        }

      }
    }
  }
