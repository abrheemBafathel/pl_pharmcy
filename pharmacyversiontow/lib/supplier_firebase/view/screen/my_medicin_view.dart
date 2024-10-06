import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/my_medicin_wdege.dart';

class MyMedicinView extends StatelessWidget {
  MyMedicinView({super.key});
  final MainSupplierController mainSupplierController =
      Get.put(MainSupplierController());
//final MainSupplierController mainSupplierController=Get.find();

  @override
  Widget build(BuildContext context) {
    mainSupplierController.getDataFirebase();
    return Container(
      child:      GetBuilder<MainSupplierController>(
        builder:(controller) =>FutureBuilder<QuerySnapshot>(
            future: controller.getMyMedicin(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
                    print(
                        "========================================================");
                    print(qDS.id);
                    return MyMedicinWidget(
                      leadingImge: Icon(Icons.access_time_filled_rounded),
                      medicinTitle: "${qDS["medicinName"]}",
                      price: "${qDS["unitprice"]}",
                      quantity: "${qDS["medicinQuantity"]}",
                      supplierName: "${qDS["suppliername"]}",
                      onDelete: () async {
                        try {
                          await mainSupplierController.deleteMedicin(qDS.id, "${qDS["imagUrl"]}");
                          print(
                              "=====================================================");
                          print("Deleted");
                        } catch (e) {
                          Get.snackbar("Error", "Error body : $e");
                        }
                      },
                      onEdite: (){
                        Get.toNamed("/UpdateSupplierMedicin", arguments: {
                          "medicinName":"${qDS["medicinName"]}",
                          "unitprice":"${qDS["unitprice"]}",
                          "medicinQuantity": "${qDS["medicinQuantity"]}",
                          "medicinDecription": "${qDS["medicinDecription"]}",
                          "imagUrl":"${qDS["imagUrl"]}",
                          "recoredId":qDS.id,
                        } );
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
                  child: Text("138".tr),
                );
              }
              return Center(
                child: Text("134".tr),
              );
            })),
      ),
    );
  }
} 

/*MyMedicinWidget(
          leadingImge: Icon(Icons.access_time_filled_rounded),
          medicinTitle: "banadol",
          price: "2000",
          quantity: "60",
          supplierName: "maged ahmed",
        ),*/