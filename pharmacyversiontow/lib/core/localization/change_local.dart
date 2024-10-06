import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';

class LocalController extends GetxController{
  Locale? language;

  MyServices myServices = Get.put(MyServices());

  changeLanguage(String languageCode){
    Locale locale= Locale(languageCode);
    myServices.sharedPreferences!.setString("languageCode", languageCode);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
   
   String? sharedPerfLang=myServices.sharedPreferences!.getString("languageCode");
   if(sharedPerfLang=="ar"){
    language= const Locale("ar");
   }else if(sharedPerfLang=="en"){
    language= const Locale("en");
   }else{
    language=Locale(Get.deviceLocale!.languageCode);
   }
    super.onInit();
  }


}