
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/fivert_screen.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/medicin_order_screen.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/my_medicin_view.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/cutom_profile_info.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final MainSupplierController mainSupplierController= Get.find();
              final MyServices myServices = Get.find();

    return DefaultTabController(
        length: 3,
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomProfileInfo(
                  widgetChild: Icon(
                    Icons.person,
                    size: 60,
                  ),
                  textChild:myServices.sharedPreferences!.getString("userName") ,
                ),
                CustomProfileInfo(
                  widgetChild: Text(
                    "140".tr,
                    textAlign: TextAlign.center,
                  ),
                  textChild: myServices.sharedPreferences!.getString("userPhone") ?? "enter your Phone number",
                  controller: mainSupplierController.validNumber,
                  isPhoneNumberValide: mainSupplierController.isPhoneNumberValide,
                  onPressed: (){
                     myServices.sharedPreferences!.setString("userPhone", mainSupplierController.validNumber.text);
                  },
                  updat: true,
                  note: "enter your phone number",
                  
                ),
                CustomProfileInfo(
                  textChild: myServices.sharedPreferences!.getString("userEmail") ?? "enter your Address",
                  widgetChild: Text(
                    "143".tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomProfileInfo(
                  widgetChild: Text(
                    "144".tr,
                    textAlign: TextAlign.center,
                  ),
                  textChild: myServices.sharedPreferences!.getString("userAddress") ?? "enter your Address",
                  note: "enter your Address",
                  onPressed: (){
                    myServices.sharedPreferences!.setString("userAddress" , mainSupplierController.validAddress.text);
                  },
                  controller: mainSupplierController.validAddress,
                  isPhoneNumberValide: mainSupplierController.isAddressValide,
                  updat: true,

                ),
                
                TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text("147".tr),
                  ),
                  Tab(
                    child: Text("148".tr),
                  ),
                  Tab(
                    child: Text("149".tr),
                  ),
                ]),
                Container(
                  height: SizeConfig.screenHeiht! * 0.65,
                  child: TabBarView(
                    children: [
                      MyMedicinView(),
                      FivertScreen(),
                      MedicinOrderScreen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
