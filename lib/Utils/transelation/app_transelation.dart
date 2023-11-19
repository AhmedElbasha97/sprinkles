// ignore_for_file: equal_keys_in_map

import 'package:get/get.dart';
import 'package:sprinkles/Utils/translation_key.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en": {
      requiredFiled:"This field is required",
      invalidEmail:"This e-mail is invalid",
      invalidPassword:"This password is invalid",
      tryAgain:"Please try again later",
      noInternet:"There's no internet connection",
      openInternet:"Please open your internet and try again",
      error:"There's error happen please try again later",
      phoneNumberError:"This phone number is not valid",
      invalidReTypePassword:"passwords does not match",
      enterPasswordFirst:"You must enter the password first",
      refreshKey:"Refresh",
      signInBTN:"Login",
      welcomeBTN2:"Register Now",
      signUpTitle: "Sign Up",
      signUpTitleName: "Enter Your Full Name",
      signUpTitlePhone: "Enter Your Phone Number",
      signUpTextPhone: "123-4567-8",
      signUpTextPhoneKey:"+974",
      signUpTitleEmail: "Enter Your Email",
      signUpTitlePass: "Enter Your Password",
      signUpTitleConfirmPass: "Confirm Your Password",
      signUpBTN: "Sign Up",
      signUpText1: "Already have an account?",
      signUpText2: "Sign In",
      goBack:"Back",
      errorKey: "An error occurred",
      nameKey:"Name",
      phoneKey:"Mobile Number",
      currencyKey: "riyal",
      signInProfile: "Login",
      signUpProfile: "Create Account",
      drawerTag1: "Home",
      drawerTag2: "Shop Display",
      drawerTag3: "Display Products",
      drawerTag4: "Personal Account",
      drawerTag5: "Log in",
      drawerTag6: "Log out",
      drawerTag7: "Create an account",
      drawerTag8: "Privacy Policy",
      drawerTag9: "Terms and Conditions",
      drawerTag10: "App Rating",
      drawerTag11: "Share the app",
      signInTitle:  "Sign In",
      signInText1:  "Hello",
      signInText2: "Sign into your account",
      signInTextEmail: "Email",
      signInTextPass: "Password",
      signInTextForgetPass: "Forget Your Password",
      signInTextBTN: "Login",
      addToFavoriteBTN: "Add to Favourites",
      removeToFavoriteBTN: "Remove from Favourites",
      forgetPassTitle:"Forgot Password",
      favTitle: 'Favorites list',
      favTap1: 'Products',
      noFavDataProductList:'There are no products currently available in your favorites list',
      noFavDataStoreList: 'There are no stores currently available in your favorites list',
      favTap2: 'Shops',
      searchRateTitle: "Choose the rating level:",
      searchRateText1: "Select level you want to search",
      searchRateText2: "Rate Level:",
      editProfileTitle:"Update Profile",
      loadingKey: "loading",
      doctorInformation: "Doctor Information",
      noReviews: "There are no comments",
      doctorReviewsTitle: "Visitor Reviews",
      changePassScreenTitle: "Change Password",
      changePassScreenText1: "New Password",
      changePassScreenText2: "Retype your new password",
      changePassScreenText3: "The password must contain an uppercase letter, a lowercase letter, and special characters such as :(@,#,!,&,*,~) and a number and not less than 8 characters long",
      deleteAcc: 'Delete account',
      logOut: 'Log out of account',
      contDeleteAcc:"Complete Deleting",
      orderNow:"Order Now",
      noOfPeople:"Number of People",
      translateButton:'عربي',
      showProduct: 'Show Products',
      productTitle: "Products",
      showStore: "Show Stores",
      storeTitle: "Shops",
      searchKey: "Search",
      removeFilterTitle: "Remove sort order",
      removeFilterValue: "Sort by",
      nameFilterAscTitle: "Sort by name from A to Z",
      nameFilterDescTitle: "Sort by name from Z to A",
      priceFilterAscTitle: "Price from highest to lowest",
      priceFilterDescTitle: "Price from lowest to highest",
      moreButtonTitle:'More',
      addToFavoriteTitle: 'You cannot add it to your favorites list',
      addToFavoriteValue: 'You can only add it to your favorites list when you log in to your account',
      detailsTitle: "Details:",
      otherProductTitle: "Other related products:",
      noDataSearchStore: "'There is no store with this name'",
      noStoreData: "'There are no stores available now'",
      noDataSearchProduct: "'There is no store with this name'",
      noProductData: "'There are no products available now'",
      orderNowBTN:"Order Now",
      greetingText:"hello",
      logOutWarning: 'Do you want to log out of the application? You can also clear your data as well',
      priceKey:"Price:",
      whatsAppText1Key:"I saw this",
      whatsAppText2Key:"In the Sprinkles app and I want to make an order",
      whatsAppTextInfoKey:"In the Sprinkles app and I want to inquire about it",
      storeLocation:"Store Location:",
   whatsAppInfoText: "I saw your store in the Sprinkles app and I want to inquire about something",
      profileBtn1:"Edit Password",
      profileBtn2:"Edit Profile",
      mostSelling:"Best Selling",
      mostRating: "Most Rated",
      sendingReport:"Send the report",
      reportTitle:"Report a problem",
      reportStoreText:"If you encounter a problem with this store, you can report it",
      reportProductText:"If you encounter a problem with this product, you can report it",
      reasonForReport:"Reason for the report",
      moreInfo:"More details",
      drawerTag12:"Orders",
      orderStatus1: "Orders in progress",
      orderStatus2: "Orders completed successfully",
      orderStatus3: "Orders have been cancelled",
      orderStatusWarning1: "There are no orders in progress",
      orderStatusWarning2: "No order has been completed yet",
      orderStatusWarning3: "No orders have been canceled yet",
      commentsTitle: "Comments",
      commentTitle:"Add a comment",
      ratingProduct:"Product Rating",
      ratingStore:"Rate the store",
      reviewVisitBTN: "Review",
      reviewHaasBeenSend:"The review has been sent successfully",
      oneStarRat: "1 Star and More",
      twoStarRat: "2 Stars, One or More",
      threeStarRat: "3 Stars and More",
      fourStarRat: "4 Stars and More",
      fiveStarRat: "5 Stars",
      advancedSearchTitle: "Advanced Search",
      advancedSearchBTN: "Start Search",
      searchPriceTitle: "Select a price range of The Product:",
      searchPriceText1: "Start Price",
      searchPriceText2: "Final Price",
      mainCategoryTitle: "Choose the main section:",
      mainCategoryText1: "Choose the main section you want to search for",
      mainCategoryText2: "Main Category:",
      locationTitle: "Choose the region:",
      locationText1: "Choose the region you want to search for",
      locationText2: "Section Region:",
      subCategoryTitle: "Choose the subcategory:",
      subCategoryText1: "Choose the subcategory you want to search for",
      subCategoryText2: "SubCategory:",
      advancedSearchNoProductData:"There is no product with this description",
      advancedSearchNoStoreData:"There is no store with these specifications",
      orderingText1:"Select",
      orderingText2:"Selected",
      storeDetailedError1:"There are no products available in this category yet",
      storeDetailedError2:"There are no products available in this store",
      readMoreKey:' ...read more',
      readLessKey:' read less',
    },
    "ar": {
      requiredFiled:"هذه الخانة مطلوبه",
      invalidEmail:"هذا البريد الإلكتروني غير صالح",
      invalidPassword:"كلمة السر هذه غير صالحة",
      tryAgain:"الرجاء معاودة المحاولة في وقت لاحق",
      noInternet:"لا يوجد اتصال بالإنترنت",
      openInternet:"الرجاء فتح الإنترنت الخاص بك وحاول مرة أخرى",
      error:"حدث خطأ ، يرجى المحاولة مرة أخرى لاحقًا",
      phoneNumberError:"رقم التلفون هذا غير صالح",
      invalidReTypePassword:"كلمه السر غير متطابقة",
      enterPasswordFirst:"يجب إدخال كلمه السر اولآ",
      refreshKey:"المحاوله مره اخرى",
      signInBTN: "تسجيل الدخول",
      welcomeBTN2: "سجل الآن",
      signUpTitle: "تسجيل" ,
      signUpTitleName: "أدخل اسمك الكامل" ,
      signUpTitlePhone: "أدخل رقم هاتفك" ,
      signUpTextPhone: "123-4567-8" ,
      signUpTextPhoneKey: "+974" ,
      signUpTitleEmail: "أدخل بريدك الإلكتروني" ,
      signUpTitlePass: "أدخل كلمة المرور الخاصة بك" ,
      signUpTitleConfirmPass: "تأكيد كلمة المرور الخاصة بك" ,
      signUpBTN: "تسجيل",
      signUpText1: "هل لديك حساب بالفعل؟",
      signUpText2: "تسجيل الدخول" ,
      goBack:"الرجوع",
      errorKey:"حدث خطأ",
      nameKey:"الاسم",
      phoneKey:"رقم الجوال",
      currencyKey: " ريال",
      signInProfile: "تسجيل الدخول",
      signUpProfile:  "إنشاء حساب",
      drawerTag1: "الرئيسيّة",
      drawerTag2: "عرض المحلات",
      drawerTag3: "عرض المنتجات ",
      drawerTag4: "الحساب الشخصى",
      drawerTag5: "تسجيل دخول",
      drawerTag6: "تسجيل الخروج",
      drawerTag7: "انشاء حساب",
      drawerTag8:  "سياسة الخصوصية",
      drawerTag9:  "الأحكام والشروط",
      drawerTag10:  "تقييم التطبيق",
      drawerTag11:  "شارك التطبيق",
      signInTitle: "تسجيل الدخول" ,
      signInText1: "مرحبًا" ,
      signInText2: "تسجيل الدخول إلى حسابك" ,
      signInTextEmail: "البريد الإلكتروني" ,
      signInTextPass: "كلمة المرور" ,
      signInTextForgetPass: "نسيت كلمة المرور" ,
      signInTextBTN: "تسجيل الدخول" ,
      addToFavoriteBTN: "أضف إلى المفضلة",
      removeToFavoriteBTN: "مسح من المفضله",
      forgetPassTitle:"نسيت كلمه المرور",
      favTitle: 'قائمة المفضلة',
      favTap1: 'المنتجات',
      noFavDataProductList:'ليس هناك منتجات متوفره الأن فى قائمه المفضلة لديك' ,
      noFavDataStoreList: ' ليس هناك محلات متوفره الأن فى قائمه المفضلة لديك',
      favTap2: 'المحلات',
      editProfileTitle:"تحديث الملف الشخصي",
      loadingKey:"تحميل",
      changePassScreenTitle: "تغير كلمه السر",
      changePassScreenText1: "كلمه السر الجديدة",
      changePassScreenText2: "أعد كتابة كلمة السر الجديدة",
      changePassScreenText3:  "يجب أن يكون كلمه السر تحتوى على حرف كبير و حرف صغير ورموز خاصه مثل :(@,#,!,&,*,~)و رقم وليس أقل من ٨أحرف",
      deleteAcc:  'مسح الحساب',
      logOut:  'الخروج من الحساب',
      contDeleteAcc:"استكمال المسح",
      orderNow:"أطلب الأن",
      noOfPeople:"عدد الافراد",
      translateButton:"English",
      showProduct: 'عرض المنتجات',
      productTitle: "المنتجات",
      showStore: "عرض المحلات ",
      storeTitle: "محلات",
      searchKey: "بحث",
      removeFilterTitle: "ازاله ترتيب حسب",
      removeFilterValue: "ترتيب حسب",
      nameFilterAscTitle: "ترتيب حسب الاسم من أ إلى ى",
      nameFilterDescTitle: "ترتيب حسب الاسم من ى إلى أ",
      priceFilterAscTitle: "السعر من الأعلى  إلى الأقل",
      priceFilterDescTitle: "السعر من الأقل  إلى الأعلى",
      moreButtonTitle:'المزيد',
      addToFavoriteTitle: 'لايمكنك اضافه إلى قائمه المفضله',
      addToFavoriteValue: 'لا تستطيع اضافه إلى قائمه المفضله إلا عند تسجيل دخول الحساب',
      detailsTitle: "التفاصيل:",
      otherProductTitle: "منتجات اخرى ذات صله:",
      noDataSearchStore: "'ليس هناك محل بهذا الأسم'",
      noStoreData: "'ليس هناك محلات متوفره الأن'",
      noDataSearchProduct: "'ليس هناك محل بهذا الأسم'",
      noProductData: "'ليس هناك منتجات متوفره الأن'",
      orderNowBTN:"أطلب الأن",
      greetingText:'مرحبًا',
      logOutWarning: 'هل تريد تسجيل الخروج من التطبيق يمكنك أيضآ مسح بيناتك أيضآ',
      priceKey:"السعر:",
      whatsAppText1Key:"رأيت هذا ال",
      whatsAppText2Key:"في تطبيق سبرينكلس وأريد عمل اوردر",
      whatsAppTextInfoKey:"في تطبيق سبرينكلس و وأريد الاستفسار عنه",
      storeLocation:"موقع المحل:",
      whatsAppInfoText:"رأيت متجرك فى تطبيق سبرينكلس وأريد الاستفسار عن شئ",
      profileBtn1:"تعديل كلمه السر",
      profileBtn2:"تعديل الحساب",
      mostSelling:"الأكثر مبيعًا",
      mostRating: "الأكثر تقيماً",
      sendingReport:"ارسل البلاغ",
      reportTitle:"الإبلاغ عن مشكلة",
      reportStoreText:"اذا واجهتك مشكله مع هذا المحل يمكنك الإبلاغ عنها",
      reportProductText:"اذا واجهتك مشكله مع هذا المنتج يمكنك الإبلاغ عنها",
      reasonForReport:"سبب البلاغ",
      moreInfo:"مزيد من التفاصيل",
      drawerTag12:"الطلبات",
      orderStatus1: "الطلبات قيد التنفيذ",
      orderStatus2: "الطلبات تمت بنجاح",
      orderStatus3: "الطلبات تم إلغائها",
      orderStatusWarning1: "ليس هناك طلبات قيد التنفيذ",
      orderStatusWarning2: "لم يكتمل إى طلب حتى الأن",
      orderStatusWarning3: "لم يتم إلغاء إى طلب حتى الأن",
      commentsTitle: "التعليقــات",
      commentTitle:"أضف تعليق",
      ratingProduct:"تقيم المنتج",
      ratingStore:"تقيم المحل",
      reviewVisitBTN: "تقيم",
      reviewHaasBeenSend:"تم ارسال التقيم بنجاح",
      oneStarRat: "نجمة واحده واكثر",
      twoStarRat: "نجمتين واحده واكثر",
      threeStarRat: "ثلاث نجوم واكثر",
      fourStarRat: "اربع نجوم واكثر",
      fiveStarRat: "خمس نجوم",
      advancedSearchTitle: "البحث المتقدم",
      advancedSearchBTN: "ابداء البحث",
      searchPriceTitle: "إختر مدي سعر المنتج :",
      searchPriceText1: "السعر المبدئي",
      searchPriceText2: "السعر النهائي",
      searchRateTitle: "إختر مستوى التقيم :",
      searchRateText1: "إختر مستوى الذى تريد البحث عنه",
      searchRateText2: "مستوى التقيم :",
      mainCategoryTitle: "اختر القسم الأساسي :",
      mainCategoryText1: "إختر القسم الأساسي الذى تريد البحث عنه",
      mainCategoryText2: "القسم الأساسي :",
      locationTitle: "اختر المنطقه:",
      locationText1: "إختر المنطقه الذى تريد البحث عنه",
     locationText2: "القسم المنطقه :",
      subCategoryTitle: "اختر القسم الفرعى :",
      subCategoryText1: "إختر القسم الفرعى الذى تريد البحث عنه",
      subCategoryText2: "القسم الفرعى :",
      advancedSearchNoProductData:"ليس هناك منتج بهذه الموصفات",
      advancedSearchNoStoreData:"ليس هناك محل بهذه الموصفات",
      orderingText1:"إختر",
      orderingText2:"الذى تم إختيار",
      storeDetailedError1:"ليس هناك منتجات متوفره فى هذه فئة حتى الأن",
      storeDetailedError2:"ليس هناك منتجات متوفره فى هذا المحل",
      readMoreKey:' ...اقرأ أكثر',
      readLessKey:' أقرأ أقل',
    }
  };
}