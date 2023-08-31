// ignore_for_file: avoid_print, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/models/advertisment_model.dart';
import 'package:sprinkles/models/category_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/services/advrtisment_services.dart';
import 'package:sprinkles/services/category_services.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {
  bool productIsLoading = true;
  bool categoryIsLoading = true;
  bool advertisementsIsLoading = true;
  final int mainCategoryId;

  ProductController(this.mainCategoryId);

  List<String> governmentData = ["ترتيب حسب السعر","ترتيب حسب الاسم","ترتيب حسب التصنيف"];
  ScrollController scrollController = ScrollController();
  int selectedSubCategoryId = 0;
  late List<ProductsModel>? productList;
  late List<CategoryModel>? subCategoryList;
  late List<AdvertisementModel>? advertList;
  List<Widget> products = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    await getSubCategoryData();
    await  getAdvertisementsData();

  }
  getProductData() async {
    productIsLoading = true;
    update();
    productList = await ProductServices.getProducts(mainCategoryId,selectedSubCategoryId);
    if(productList?.length != 0){
      fillingData();
    }

    print("the length of widget list iS ${products.length}");
    productIsLoading = false;
    update();
  }
  getSubCategoryData() async {
    subCategoryList = await CategoryServices.getSupCategory(mainCategoryId);
    categoryIsLoading = false;
    update();
  }
  getAdvertisementsData() async {
    advertList = await AdvertisementServices.getAdvertisements(mainCategoryId);
    await  getProductData();
    advertisementsIsLoading = false;
    update();
  }
  selectingAnotherSubCategory(int subCategoryId){
    selectedSubCategoryId = subCategoryId;
    getProductData();
  }
  selectingAdvertisements(String link,int advertisementsId) async {
    await AdvertisementServices.advertisementsHasBeenViewed("$advertisementsId");
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url,mode:LaunchMode.externalNonBrowserApplication)) {
    throw Exception('Could not launch $url');
    }
  }
  fillingData(){
    products = [];
print("hi from fill data${productList?.length}");


      for (int i = 0; i <= productList!.length-1; i=i+2) {
        if(i<productList!.length-1){

          print("hi from fill data${productList?.length}");
          products.add(
            Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
              children:[
                ProductWidget(product:productList?[i]),
                ProductWidget(product:productList?[i+1])
              ]
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
                          child: ProductWidget(product:productList?[i]),
                        ),

                      ]
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
              )
          );
        }
        if(i%4==0&&i!=0||productList!.length == 2){
          print(i);
          products.add(
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

                    items: advertList?.map(
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
          );
        }
      }
    }
  }
