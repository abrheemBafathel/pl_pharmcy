import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/fivert_widage.dart';

class FivertScreen extends StatelessWidget {
  const FivertScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeiht! * 0.6,
      width: double.infinity,
      child: GetBuilder<MainSupplierController>(
        init: MainSupplierController(),
        builder: (controller) => FutureBuilder<QuerySnapshot>(
            future: controller.getFivertMedicin(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
                    print(
                        "========================================================");
                    print(qDS.id);
                    return FivertWidget(
                        medicinTitle: "${qDS["medicinName"]}",
                        price: "${qDS["unitprice"]}",
                        quantity: "${qDS["medicinQuantity"]}",
                        leadingImge: null,
                        supplierName: "${qDS["suppliername"]}",
                        onStar: () {
                          controller.deleteFivertMedicin(qDS.id, "jjjjj");
                        });
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
                  child: Text("133".tr),
                );
              }
             
              return Center(
                child: Text("134".tr),
              );
            })),
      ),
    );
  }
}/*FivertWidget(
            medicinTitle:  "${qDS["medicinName"]}",
            price: "${qDS["unitprice"]}",
            quantity: "${qDS["medicinQuantity"]}",
            leadingImge: null,
            supplierName: "${qDS["suppliername"]}",
            onStar: () {
              
            },
          ),*/