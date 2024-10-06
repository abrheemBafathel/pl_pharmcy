import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/theme/app_theme.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/homepage/controller/homepagecontroller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homecontroller = Get.put(HomePageController());
  final appThemeController= Get.put(AppTheme());
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "1".tr,
          style: TextStyle(fontSize: SizeConfig.defaultSize! *3, color: Color.fromARGB(255, 11, 74, 192), fontWeight: FontWeight.bold)
        ),
        //centerTitle: true,
       // backgroundColor: const Color(0xffC5FFF8),
        actions: [IconButton(onPressed: (){
          appThemeController.chaingMode();
        }, icon: appThemeController.themeIcon
        )],
      ),
      drawer: Card(
        margin: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.7,
          child: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text("26".tr),
                  leading:const Icon(Icons.add),
                  onTap: () {
                    Get.toNamed("/ViewPurchas");
                    debugPrint("ontap=======================");
                  },
                ),
                ListTile(
                  title: Text("27".tr),
                  leading:const Icon(Icons.add),
                  onTap: () {
                    debugPrint("ontap=======================");
                    Get.toNamed("/ViewSles");
                  },
                ),
                ListTile(
                  title: Text("28".tr),
                  leading:const Icon(Icons.add),
                  onTap: () {
                    Get.toNamed("/ViewAccount");
                    debugPrint("ontap=======================");
                  },
                ),
                //
                ListTile(
                  title: Text("198".tr),
                  leading:const Icon(Icons.store_outlined),
                  onTap: () {
                    Get.toNamed("/MainSupplier");
                    debugPrint("ontap=======================");
                  },
                ),
                ListTile(
                  title: Text("199".tr),
                  leading:const Icon(Icons.person_2_outlined),
                  onTap: () {
                    Get.toNamed("/ViewPharmacyWrkers");
                    debugPrint("ontap=======================");
                  },
                ),
                ListTile(
                  title: Text("29".tr),
                  leading: const Icon(Icons.backup_outlined),
                  onTap: () {
                    Get.toNamed("/HomeBackup");
                    debugPrint("ontap=======================");
                  },
                ),
                const Divider(),
                ListTile(
                  title: Text("5".tr),
                  leading: const Icon(Icons.logout_outlined),
                  onTap: () async {
                    await homecontroller.singout();
                    myServices.sharedPreferences!.clear();
                    Get.offAllNamed("/supplierloginview");
                    debugPrint("ontap=======================");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder(
          init: HomePageController(),
          builder: (controllr) {
            return Container(
               height: SizeConfig.screenHeiht,


                //color: Color.fromRGBO(26, 104, 91, 0.6),
                    
              child: homecontroller.navigtionpage
                .elementAt(HomePageController.itemswlected),
            );
          }),

      bottomNavigationBar: SizedBox(
        height: SizeConfig.screenHeiht!*0.140,
        child: Card(
          margin: EdgeInsets.all(SizeConfig.defaultSize!),
         // color: const Color(0xffC5FFF8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GetBuilder<HomePageController>(
                init: HomePageController(),
                builder: (controller) {
                  return Expanded(
                    child: BottomNavigationBar(
                        //backgroundColor: const Color(0xffC5FFF8),
                        useLegacyColorScheme: false,
                        onTap: (value) {
                          debugPrint("$value");
                          controller.funselectedicrem(value);
                          debugPrint("${HomePageController.itemswlected}");
                        },
                        currentIndex: HomePageController.itemswlected,
                       // selectedItemColor: Colors.black,
                       // unselectedItemColor: Colors.black38,
                        // backgroundColor: Color(0xff5FBDFf),
                        iconSize: SizeConfig.defaultSize! * 4,
                        items: [
                          BottomNavigationBarItem(
                           //   backgroundColor: const Color(0xffC5FFF8),
                              label: "30".tr,
                              icon: const Icon(Icons.home)),
                          BottomNavigationBarItem(
                            //  backgroundColor: const Color(0xffC5FFF8),
                              label: "31".tr,
                              icon: const Icon(Icons.add)),
                          BottomNavigationBarItem(
                            //  backgroundColor: const Color(0xffC5FFF8),
                              label: "27".tr,
                              icon: const Icon(Icons.sell)),
                          BottomNavigationBarItem(
                             // backgroundColor: const Color(0xffC5FFF8),
                              label: "32".tr,
                              icon: const Icon(Icons.qr_code)),
                        ]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
