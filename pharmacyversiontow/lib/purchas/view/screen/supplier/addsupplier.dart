import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/purchas/controller/supplier_controller.dart';

class AddSupplier extends StatelessWidget {
  AddSupplier({super.key});

 final SupplierController addsupplierController = Get.put(SupplierController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("94".tr)),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: addsupplierController.suppliername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                  label: Text("95".tr),
                  hintText: "96".tr,
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              TextFormField(
                controller: addsupplierController.suppliercompany,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                  label:  Text("97".tr),
                  hintText: "98".tr,
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              TextFormField(
                controller: addsupplierController.supplierphone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                  label:  Text("99".tr),
                  hintText: "100".tr,
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              MaterialButton(
                onPressed: () {
                  addsupplierController.addsupplier();
                },
                shape: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                color: Colors.blue,
                child:  Text(
                  "101".tr,
                  style:const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
