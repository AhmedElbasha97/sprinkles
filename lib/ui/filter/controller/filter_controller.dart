// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/models/government_model.dart';
import 'package:sprinkles/models/product_pagination_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/rating_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/models/shops_model.dart';
import 'package:sprinkles/services/advanced_search_services.dart';
import 'package:sprinkles/services/category_services.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/services/seaarch_and_filters_services.dart';
import 'package:sprinkles/ui/filter/advanced_search_screen.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_widget.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';


class FilterController extends GetxController{
  late List<ShopsModel>? shopList;
  late List<ProductsModel>? productList;
  late List<CategoryModel>? subCategoryList;
  late List<CategoryModel>? mainCategoryList;
  List<Widget> products = [];
  List<Widget> storeListWidget = [];
  String mainCategoryName = "";
  int mainCategoryId = 0;
  String locationName = "";
  int locationId = 0;
  String mainCategoryImageURl = "";
  String subCategoryName = "";
  int subCategoryId = 0;
  String subCategoryImageURl = "";
  String ratingName = "";
  String ratingId = "0";
  bool isLoading = true;
  bool categoryIsLoading = true;
  bool searchIsLoading = true;
  bool hasNoData = false;
  final ScrollController sController = ScrollController();
  late TextEditingController startPriceRange;
  late TextEditingController endPriceRange;
  List<GovernmentModel>? governmentData = [];
  String selectedTap = "p";
  ScrollController scrollController = ScrollController();
  bool isVisible = false;
  int pageNumber = 1;
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  List<RatingModel> ratingsListData = [RatingModel(title: oneStarRat.tr,id: "1"),RatingModel(title: twoStarRat.tr,id: "2"),RatingModel(title:threeStarRat.tr,id: "3"),RatingModel(title: fourStarRat.tr,id: "4"),RatingModel(title: fiveStarRat.tr,id: "5")];
  int sVal =0;
  int sFal =1000;
  RangeValues currentRangeValues = const RangeValues(0,1000);
  late ProductPaginationModel? pagenationData;
  final BuildContext context;
  bool isLoadingMoreData = false;

  FilterController(this.context);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startPriceRange = TextEditingController();
    endPriceRange = TextEditingController();
    startPriceRange.text = "0";
    endPriceRange.text = "1000";
    scrollController.addListener(() {
      if ((scrollController.position.pixels ) == (scrollController.position.maxScrollExtent)) {
        print(scrollController.position.pixels);
        print(scrollController.position.maxScrollExtent);
        getMoreData();
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible == true) {

          isVisible = false;
          update();
        }
      } else {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isVisible == false) {

            isVisible = true;
            update();
          }
        }
      }
    });
    getData();
  }
  goUpToTopOfSScreen(){
    scrollController.animateTo( //go to top of scroll
        0,  //scroll offset to go
        duration: const Duration(milliseconds: 500), //duration of scroll
        curve:Curves.fastOutSlowIn //scroll type
    );
    isVisible = false;
    update();
  }
  getMoreData() async {

    if(selectedTap == "p"){
      if(pagenationData!.totalPages! > pageNumber){
        isLoadingMoreData= true;
        update();
        pageNumber++;
      }
      if(pagenationData!.totalPages! >= pageNumber){
        pagenationData = await AdvancedSearchServices.searchingForProduct(selectedTap, "$mainCategoryId", "$subCategoryId", ratingId, "$sVal", "$sFal","$locationId",pageNumber);
        productList?.addAll(pagenationData?.items as Iterable<ProductsModel>) ;
        await fillingData(context);
        isLoadingMoreData= false;
        update();
      }


    }


  }
  selectingTap(String type){
    selectedTap = type;
    update();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<FilterController>();
  }

  getData() async{
    governmentData = await SearchAndFilterServices.getGovernments();
 await getMainCategoryData();
    isLoading = false;
    update();
  }
  getMainCategoryData() async {
    mainCategoryList = await CategoryServices.getHomeCategory();
  }
  getSubCategoryData() async {
    subCategoryList = [];
    categoryIsLoading =true;
    subCategoryName = "";
     subCategoryId = 0;
     subCategoryImageURl = "";
    update();
      subCategoryList = await CategoryServices.getSupCategory(mainCategoryId);
      categoryIsLoading = false;
      update();


  }
  choosingMainCategory(CategoryModel choosedMainCategory){
    mainCategoryName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?choosedMainCategory.nameEn:choosedMainCategory.name)!;
    mainCategoryId = choosedMainCategory.id??0;
    mainCategoryImageURl =  "${Services.baseEndPoint}${choosedMainCategory.img}";
    getSubCategoryData();
    update();
  }
  choosingGovernment(GovernmentModel choosedGovernment){
    locationName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?choosedGovernment.nameEn:choosedGovernment.name)!;
    locationId = choosedGovernment.id??0;
    update();
  }
  choosingSubCategory(CategoryModel choosedSubCategory){
    subCategoryName = (Get.find<StorageService>().activeLocale == SupportedLocales.english?choosedSubCategory.nameEn:choosedSubCategory.name)!;
    subCategoryId = choosedSubCategory.id??0;
    subCategoryImageURl =  "${Services.baseEndPoint}${choosedSubCategory.img}";
    update();
  }
  choosingRating(RatingModel chosenRating){
    ratingName = chosenRating.title??"";
    ratingId = chosenRating.id??"";
    update();
  }
  changeStartPrice(String value){
    if(double.parse(value) <= sFal && double.parse(value) >= 0 ) {
      startPriceRange.text = value;
      currentRangeValues = RangeValues(double.parse(value), sFal.toDouble());
      update();
    }else{
      startPriceRange.text = "0";
    }
  }
  changeEndPrice(String value){
    if(double.parse(value) <= 100 && double.parse(value) >= sVal.toDouble()) {
      endPriceRange.text = value;
      currentRangeValues = RangeValues(sVal.toDouble(), double.parse(value));
      update();
    }else{
      endPriceRange.text = "1000";
    }
  }
  addingOrRemovingProductsToFavorite(context,String productId,int index) async {
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if( await  checkAddedOrNotToFavorite(productId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          productList?.elementAt(index).favorite = 0;
          productList?[index].favorite = 0;
          update();


        }

      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          productList?.elementAt(index).favorite = 1;
          productList?[index].favorite = 1;
          update();

        }

      }
    }else{
      showWarningFavorite(context);
    }
  }
  addingOrRemovingProductToFavorite(context,String productId,int index,bool doubleProductOrNot) async {
    var i = 0;
    if(index != 0){
      i = index - 1;
    }
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if( await checkAddedOrNotToFavorite(productId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }
        if(doubleProductOrNot){
          var checker =await checkAddedOrNotToFavorite("${productList?[index].id}");
          var checker1 =await checkAddedOrNotToFavorite("${productList?[index+1].id}");
          products[i]=Padding(
            padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
            child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
                  ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                  }, mainCategoryId: mainCategoryId, comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true, branchCategoryId: subCategoryId, mainCategoryImg: '',),

                  ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                  }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                ]
            ),
          );
          update();
        }else{
          var checker =await checkAddedOrNotToFavorite("${productList?[index].id}");
          products[i]=Column(
            children: [
              Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children:[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                          addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                        }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                    ),

                  ]
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
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          if(doubleProductOrNot){
            var checker =await checkAddedOrNotToFavorite("${productList?[index].id}");
            var checker1 =await checkAddedOrNotToFavorite("${productList?[index+1].id}");
            products[i]=Padding(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',),

                    ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                  ]
              ),
            );
            update();
          }else{
            var checker =await checkAddedOrNotToFavorite("${productList?[index].id}");
            products[i]=Column(
              children: [
                Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children:[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                            addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                          }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                      ),

                    ]
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
  addingOrRemovingStoreToFavorite(context,String storeId,int index) async {
    await checkAddedOrNotToFavorite(storeId);
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if(  await checkAddedOrNotToFavorite(storeId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveShopFromFavorite(storeId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          var checker =  await checkAddedOrNotToFavorite( "${shopList?[index].id}");
          storeListWidget[index]=StoreWidget(store:shopList?[index], addingOrRemovingForFav: (){addingOrRemovingStoreToFavorite(context,"${shopList?[index].id}",index);}, shopAreAddedOrNot: checker, mainCategoryId: mainCategoryId, mainCategoryImg: '',);


          update();
        }


      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveShopFromFavorite(storeId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          var checker =  await checkAddedOrNotToFavorite( "${shopList?[index].id}");
          storeListWidget[index]=StoreWidget(store:shopList?[index], addingOrRemovingForFav: (){addingOrRemovingStoreToFavorite(context,"${shopList?[index].id}",index);}, shopAreAddedOrNot: checker, mainCategoryId: mainCategoryId, mainCategoryImg: '',);
          update();
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
          }, alertYesButtonIcon: 'assets/icons/signUpIconDrawer.png', alertNoButtonIcon: 'assets/icons/loginIcon.png', alertIcon: 'assets/icons/favoriteIcon.png',containerHeight:Get.height <= 800? Get.height*0.6: Get.height*0.5);
        });
  }

  fillingData(context)  async {
    if(selectedTap == "p"){
    products = [];
    for (int i = 0; i <= productList!.length-1; i=i+2) {
      if(i<productList!.length-1){
        products.add(
            Padding(
              padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    ProductWidget(product:productList?[i], productAreAddedOrNot:  productList?[i].favorite == 1 , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',),

                    ProductWidget(product:productList?[i+1], productAreAddedOrNot:  productList?[i+1].favorite == 1 , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productList?[i+1].id}",i,true);
                    }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                  ]
              ),
            )
        );

      }
      else{

        products.add(
            Column(
              children: [
                Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children:[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(product:productList?[i], productAreAddedOrNot: productList?[i].favorite == 1 , addingOrRemovingProductToFavorite: (){
                            addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,false);
                          }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: subCategoryId, mainCategoryImg: '',)
                      ),

                    ]
                ),

              ],
            )
        );
      }

    }
    }else{
      storeListWidget = [];
      for (int i = 0; i <= shopList!.length-1; i=i+1) {
        storeListWidget.add(
            StoreWidget(store:shopList?[i], addingOrRemovingForFav: (){addingOrRemovingStoreToFavorite(context,"${shopList?[i].id}",i);}, shopAreAddedOrNot: shopList?[i].favorite==1, mainCategoryId: mainCategoryId, mainCategoryImg: '',)
        );

      }

      update();

    }
  }
  Future<bool> checkAddedOrNotToFavorite(String objectId) async {
    var data = selectedTap == "p"? await  FavoriteServices.getProductIsInFavoriteOrNot(objectId):
    await  FavoriteServices.getShopIsInFavoriteOrNot(objectId);
    if(data?.status == 1){
      return true;
    }else{
      return false;
    }
  }
  choosingPriceRange(RangeValues value){
      sVal = value.start.round();
      sFal = value.end.round();
      startPriceRange.text = "${value.start.round()}";
      endPriceRange.text = "${value.end.round()}";
      currentRangeValues = value;
      update();

  }


  startSearching() async {
    if(selectedTap == "p"){
      pagenationData = await AdvancedSearchServices.searchingForProduct(selectedTap, "$mainCategoryId", "$subCategoryId", ratingId, "$sVal", "$sFal","$locationId",pageNumber);
      productList = pagenationData?.items;
      await fillingData(context);

    if(pagenationData?.items?.length == 0||pagenationData?.items == []){
      hasNoData = true;
      print("hiiiiiiiiii");
    }
    searchIsLoading = false;

    Get.to(()=>const AdvancedSearchScreen());
    update();
    }else{
     shopList =  await AdvancedSearchServices().searchingForStore("$mainCategoryId", ratingId,"$locationId");
     await fillingData(context);

     if(shopList?.length == 0||shopList == []){
       hasNoData = true;
     }
     searchIsLoading = false;

     Get.to(()=>const AdvancedSearchScreen());
     update();
    }
  }
}