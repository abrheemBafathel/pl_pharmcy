import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/co_medicin.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/coustom_textformviled_vildetion.dart';

class ViewMedicin extends StatelessWidget {
 const ViewMedicin({super.key});

  @override
  Widget build(BuildContext context) {
    final MainSupplierController mainSupplierController =
        Get.put(MainSupplierController());
    mainSupplierController.getDataFirebase();
         SizeConfig.init(context);

    // return Text("filed");
    return Container(
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * 3,
            right: SizeConfig.defaultSize! * 3),
        child: GetBuilder<MainSupplierController>(
          builder: (controller) => FutureBuilder<QuerySnapshot>(
              future: mainSupplierController.getDataFirebase(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
                      return CoMedicin(
                        medicinName: "${qDS["medicinName"]}",
                        supplierName: "${qDS["suppliername"]}",
                        price: "${qDS["unitprice"]}",
                        quantity: "${qDS["medicinQuantity"]}",
                        orderNumber: "${qDS["ordernumber"]}",
                        imagepath: "${qDS["imagUrl"]}",
                        addTofavirt: () {
                          mainSupplierController.addToFavirt(
                              "${qDS["medicinName"]}",
                              "${qDS["medicinQuantity"]}",
                              "${qDS["unitprice"]}",
                              "${qDS["imagUrl"]}",
                              "${qDS["medicinDecription"]}",
                              "${qDS["suppliername"]}",
                              qDS["ordernumber"],
                              "${qDS["userId"]}");
                        },
                        orderMedicin: () {
                          Get.defaultDialog(
                              title: "maged",
                              middleText: "my name is maged",
                              content: Column(
                                children: [
                                  CoustomTextFormFiledVildtion(
                                    validator: controller.isQuantityValide,
                                    name: "132".tr,
                                    hintText:
                                        "155".tr,
                                    myController: controller.validQantity,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    ElevatedButton(onPressed: (){
                                      controller.addMedicinOrder("${qDS["medicinName"]}",
                                       "${qDS["unitprice"]}","${qDS["userId"]}" );
                                       Get.back();
                                    }, child: Text("62".tr)),
                                    ElevatedButton(onPressed: (){
                                      Get.back();
                                    }, child:  Text("156".tr)),
                                  ],)
                                ],
                              ));
                        },
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("157".tr),
                  );
                }
                return Center(
                  child: Text("134".tr),
                );
              })),
        ));
  }
}

/*mainSupplierController.listMedicin==null 
        ? Center(child: Text("Loading ...."),)
        : ListView.builder(

          itemBuilder: (context, index){
            QueryDocumentSnapshot qDS = mainSupplierController.listMedicin!.docs[index];
            return  CoMedicin(medicinName: "${qDS["medicinName"]}",
           // supplierName: "${qDS["suppliername"]}",
            price: "${qDS["unitprice"]}",
            quantity: "${qDS["medicinQuantity"]}",
           //s orderNumber: "${qDS["ordernumber"]}",
            imagepath: "images/error_at_first_run_for_firebaseapp.PNG");
          },
         itemCount: mainSupplierController.listMedicin!.docs.length,
        ), */


        /*child:FutureBuilder(future: mainSupplierController.listMedicin!, builder: ((context, snapshot) {
          if(snapshot.hasData){
           return  ListView.builder(

          itemBuilder: (context, index){
            QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
            return  CoMedicin(medicinName: "${qDS["medicinName"]}",
           // supplierName: "${qDS["suppliername"]}",
            price: "${qDS["unitprice"]}",
            quantity: "${qDS["medicinQuantity"]}",
           //s orderNumber: "${qDS["ordernumber"]}",
            imagepath: "images/error_at_first_run_for_firebaseapp.PNG");
          },
         itemCount: snapshot.data!.docs.length,
        ); 
          }
           if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator(),);
          }
           if(snapshot.connectionState== ConnectionState.none){
            return Center(child: Text("you are not conncting to internet"),);
          }
          return Center(child: Text("Loding..."),);
        })) */
