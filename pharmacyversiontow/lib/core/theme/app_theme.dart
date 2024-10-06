import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';

class AppTheme extends GetxController {
  MyServices myServices = Get.find();
/*
  static ThemeData? lightTheme=ThemeData.light().copyWith(
   primaryColor:  Colors.green
  );
static   ThemeData? darkTheme=ThemeData.dark().copyWith(
   // primaryColor:  
  );*/
  ThemeData? appTheme;
  Colors? nevgationItemColor;

  @override
  void onInit() {
    appTheme = myServices.sharedPreferences!.getString("appTheme") != null
        ? myServices.sharedPreferences!.getString("appTheme") == "light"
            ? lightTheme
            : darkTheme
        : darkTheme;
    super.onInit();
  }

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(color: Colors.black45),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black45,
      selectedItemColor: Colors.white54,
      unselectedItemColor: Colors.white30,
      selectedIconTheme: IconThemeData(color: Colors.white54),
      unselectedIconTheme: IconThemeData(color: Colors.white30),
    ),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
     // appBarTheme: const AppBarTheme(color: Color(0xffC5FFF8)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black45,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.black38),
      ),
      //drawerTheme: const DrawerThemeData(backgroundColor: Colors.white30),
      navigationDrawerTheme: const NavigationDrawerThemeData(
          backgroundColor: Colors.white30, surfaceTintColor: Colors.amber,
          indicatorColor: Colors.amberAccent,
          ),
          
          );

  Icon themeIcon = const Icon(Icons.light_mode);

  chaingMode() {
    themeIcon = Get.isDarkMode
        ? const Icon(Icons.light_mode_outlined, color: Colors.black)
        : const Icon(Icons.light_mode_outlined);
    if (Get.isDarkMode) {
      myServices.sharedPreferences!.setString("appTheme", "light");
      Get.changeTheme(AppTheme.lightTheme);
    } else {
      myServices.sharedPreferences!.setString("appTheme", "dark");
      Get.changeTheme(AppTheme.darkTheme);
    }

    update();
  }
}
