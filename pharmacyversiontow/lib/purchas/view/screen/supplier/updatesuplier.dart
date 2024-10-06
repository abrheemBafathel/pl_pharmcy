import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/purchas/controller/supplier_controller.dart';

class UpdateSupplier extends StatelessWidget {
  UpdateSupplier({super.key});

 final SupplierController updatesupplierController = Get.put(SupplierController());


  @override
  Widget build(BuildContext context) {
    updatesupplierController.getargument();
    
    return Scaffold(
      appBar: AppBar(title:  Text("102".tr)),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: updatesupplierController.updatesuppliername,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                  label:  Text("95".tr),
                  hintText: "96".tr,
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize,
              ),
              TextFormField(
                controller: updatesupplierController.updatesuppliercompany,
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
                controller: updatesupplierController.updatesupplierphone,
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
                  updatesupplierController.updateSupplier();
                  Get.back();
                },
                shape: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                color: Colors.blue,
                child:  Text(
                  "54".tr,
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
