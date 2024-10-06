import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/purchas/controller/supplier_controller.dart';
import 'package:pharmacyversiontow/purchas/view/widget/customsupplier.dart';

class ViewSuppliers extends StatelessWidget {
   ViewSuppliers({super.key});
  final SupplierController supplierController=Get.put(SupplierController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(
        "103".tr,
        style:const TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          Get.toNamed("/AddSupplier");
        },
        child:const Icon(Icons.add),
      ),
      body: GetBuilder<SupplierController>(
       builder: (controller) => ListView.builder(
           
          itemCount: supplierController.supplierlist.length,
      
          itemBuilder: (context, index){
            return CustomeSupplier(
              supplierAccounteID: "${controller.supplierlist[index]["fksuaccNom"]}",
              supplierID: "${controller.supplierlist[index]["supID"]}",
              suppliername: "${controller.supplierlist[index]["supName"]}",
              suppliercompany: "${controller.supplierlist[index]["supCompany"]}",
              supplierphone: "${controller.supplierlist[index]["supPhone"]}",
              deletesupplier: () => controller.deletesupplier(index),
              updatesupplier: ()=> Get.toNamed("/UpdateSupplier", arguments: {
                "supID":'''${controller.supplierlist[index]["supID"]}''',
                "supName":'''${controller.supplierlist[index]["supName"]}''',
                "supCompany":'''${controller.supplierlist[index]["supCompany"]}''',
                "supPhone":'''${controller.supplierlist[index]["supPhone"]}''',
              }),
      
             );
            }
            
          
        ),
      ),
    );
  }
}
