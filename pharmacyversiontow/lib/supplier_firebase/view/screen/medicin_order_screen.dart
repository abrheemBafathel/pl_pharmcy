import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/supplier_firebase/controller/main_supplier_controller.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/wideg/medicin_order_widget.dart';

class MedicinOrderScreen extends StatelessWidget {
  const MedicinOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<MainSupplierController>(
        init: MainSupplierController(),
        builder: (controller) => FutureBuilder<QuerySnapshot>(
            future: controller.getOrdersMedicin(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot qDS = snapshot.data!.docs[index];
                    print(
                        "========================================================");
                    print(qDS.id);
                    return MedicinOrderWidget(
                      customerName: "${qDS["customerName"]}",
                      nameMedicinOrder: "${qDS["medicinName"]}",
                      quantityOrder: "${qDS["medicinQuantity"]}",
                      priceQuantity: "${qDS["unitprice"]}",
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
/* MedicinOrderWidget(
          customerName: "Abrheem Ahmed bafadel",
          nameMedicinOrder: "basrtmol",
          quantityOrder: "100",
          priceQuantity: "100000",
        ),
        
         FivertWidget(
                        medicinTitle: "${qDS["medicinName"]}",
                        price: "${qDS["unitprice"]}",
                        quantity: "${qDS["medicinQuantity"]}",
                        leadingImge: null,
                        supplierName: "${qDS["suppliername"]}",
                        onStar: () {
                          controller.deleteFivertMedicin(qDS.id, "jjjjj");
                        });
        */