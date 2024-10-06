import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/cus_btn_nevgation.dart';

class MainSupplier extends StatelessWidget {
  MainSupplier({super.key});
  final MainSupplierController mainSupplierController =
      Get.put(MainSupplierController());

  @override
  Widget build(BuildContext context) {
    final MyServices myServices = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("135".tr),
        actions: [
          //"userType", "userType"
          if (myServices.sharedPreferences!.getString("userType") == "supplier")
            IconButton(
                onPressed: () {
                  myServices.sharedPreferences!.clear();
                  Get.offAllNamed("/supplierloginview");
                },
                icon: Icon(Icons.logout_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/AddSupplierMedicin");
        },
        child: Icon(Icons.add),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<MainSupplierController>(
        builder: (controller) => mainSupplierController.getPages
            .elementAt(mainSupplierController.selectedIndex),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.blue,
          child: GetBuilder<MainSupplierController>(
            builder: (controller) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: CusBtnNevgation(
                    iconBtn: Icons.shopping_basket,
                    iconColor: controller.selectedIndex == 0
                        ? Colors.white
                        : Colors.black,
                    iconsize: SizeConfig.defaultSize,
                    textBtn: "136".tr,
                    txtstylebtn: controller.selectedIndex == 0
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.defaultSize! * 2)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.defaultSize! * 1.5),
                    margin: EdgeInsets.only(left: 20, right: 10),
                    onCustomTap: () => controller.chaingePage(0),
                  ),
                ),
                Spacer(),
                CusBtnNevgation(
                  iconBtn: Icons.person,
                  iconColor: controller.selectedIndex == 1
                      ? Colors.white
                      : Colors.black,
                  iconsize: SizeConfig.defaultSize,
                  textBtn: "137".tr,
                  txtstylebtn: controller.selectedIndex == 1
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.defaultSize! * 2)
                      : TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.defaultSize! * 1.5),
                  margin: EdgeInsets.only(right: 30, left: 30),
                  onCustomTap: () => controller.chaingePage(1),
                ),
              ],
            ),
          )),
    );
  }
}
