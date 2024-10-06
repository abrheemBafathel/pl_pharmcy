import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/purchas/controller/purchas_controller.dart';
import 'package:pharmacyversiontow/purchas/view/widget/purchasprodect.dart';

class ViewPurchas extends StatelessWidget {
  ViewPurchas({super.key});

 final PurchasController purchasController = Get.put(PurchasController());
  @override
  Widget build(BuildContext context) {
    purchasController.readMedicin();
    return Scaffold(
      appBar: AppBar(
        title:  Text("75".tr),
        actions: [
          MaterialButton(
            onPressed: () {
              Get.toNamed("/ViewCountry");
            },
            child:  Text("51".tr), /*color: Colors.green,*/
          ),
          MaterialButton(
            onPressed: () {
              Get.toNamed("/ViewSuppliers");
            },
            child:  Text("50".tr), /*color: Colors.green*/
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        //  await purchasController.readcountries();
        //  await purchasController.readsupplier();
         // purchasController.setdrobdownvalue();
        //  if (purchasController.selectedSupplier != null &&
         //     purchasController.selectedcountry != null) {
            Get.toNamed("/AddNewPurchase");
         // } else {
         //   Get.snackbar("Note",
          //      "you have to add country and supplier before add medicin");
         // }
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<PurchasController>(
        builder: (contrler) => contrler.purchasprodect.isEmpty
            ?  Center(child: Text("76".tr))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return PurchasProdect(
                    barcodenum: "${contrler.purchasprodect[index]["parCodeNum"]}",
                    workername: contrler.purchasprodect[index]["uName"],
                    dateOFBuy: contrler.purchasprodect[index]["dateOFBuy"],
                    companyname: contrler.purchasprodect[index]["companyName"],
                    medicingroup:
                        "${contrler.purchasprodect[index]["GroubNumber"]}",
                    medicamentName: contrler.purchasprodect[index]
                        ["medicineName"],
                    quantity: "${contrler.purchasprodect[index]["Quantity"]}",
                    quantityprice: "${contrler.purchasprodect[index]["price"]}",
                    suppliername: contrler.purchasprodect[index]["supName"],
                    made: contrler.purchasprodect[index]["countryName"],
                    madedate: contrler.purchasprodect[index]
                        ["dateOFProduction"],
                    exparedate: contrler.purchasprodect[index]["expriyDate"],
                    row:"${contrler.purchasprodect[index]["row"]}" ,
                    column: "${contrler.purchasprodect[index]["column"]}",
                    onDelete: () {
                      contrler.delet(index);
                      //contrler. purchasprodect.removeAt(index);
                      // print("${contrler. purchasprodect[index]}");
                      debugPrint("deleted");
                    },
                    onEdite: () {
                      Get.toNamed("/UpdatePurchas", arguments: {
                        "ID": "${contrler.purchasprodect[index]["medicineID"]}",
                        "medicineName":
                            "${contrler.purchasprodect[index]["medicineName"]}",
                        "uName": "${contrler.purchasprodect[index]["uName"]}",
                        "dateOFBuy":
                            "${contrler.purchasprodect[index]["dateOFBuy"]}",
                        "companyname":
                            "${contrler.purchasprodect[index]["countryName"]}",
                        "GroubNumber":
                            "${contrler.purchasprodect[index]["GroubNumber"]}",
                        "Quantity":
                            "${contrler.purchasprodect[index]["Quantity"]}",
                        "price": "${contrler.purchasprodect[index]["price"]}",
                        "supName":
                            "${contrler.purchasprodect[index]["supName"]}",
                        "countryName":
                            "${contrler.purchasprodect[index]["countryName"]}",
                        "dateOFProduction":
                            "${contrler.purchasprodect[index]["dateOFProduction"]}",
                        "expriyDate":
                            "${contrler.purchasprodect[index]["expriyDate"]}",
                            "row":
                            "${contrler.purchasprodect[index]["row"]}",
                        "column":
                            "${contrler.purchasprodect[index]["column"]}",
                             "supplierID":
                            "${contrler.purchasprodect[index]["supplierID"]}"
                      });
                    },
                  );
                },
                itemCount: contrler.purchasprodect.length,
              ),
      ),
    );
  }
}
