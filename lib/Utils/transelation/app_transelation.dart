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
      removeDocFromFav1: "Doctor Removed",
      removeDocFromFav2: "From Favourites",
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
      mostRating: "Most Rated"
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
      showStore: "عرض محلات ",
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
   mostRating: "الأكثر تقيماً"

}
  };
}