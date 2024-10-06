import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/salseprodect.dart';

class MainWorkerViewSles extends StatelessWidget {
  MainWorkerViewSles({super.key});
  final SalesController salesController = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
     SizeConfig.init(context);
    
    return Scaffold(
      appBar: AppBar(title: Text("6".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/AddSalse");
        },
        child:const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  salesController.readDataSalesWithCustomer();
                },
                child: Text("7".tr),
              ),
              ElevatedButton(
                onPressed: () {
                  salesController.readDataSalesWithoutCustomer();
                },
                child: Text("8".tr),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.screenHeiht! * 0.7,
            child: GetBuilder<SalesController>(
              builder: (contrler) => contrler.saleprodect.isEmpty
                  ? Center(
                      child: Text("9".tr),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return SalesProdect(
                          medicamentName: contrler.saleprodect[index]
                              ["medicineName"],
                          quantity:
                              "${contrler.saleprodect[index]["quantaty"]}",
                          unitprice:
                              "${contrler.saleprodect[index]["UnitePrice"]}",
                          totalprice:
                              "${contrler.saleprodect[index]["totalPrice"]}",
                          customer: contrler.saleprodect[index]["customerName"],
                          made: contrler.saleprodect[index]["countryName"],
                          saledate: contrler.saleprodect[index]["date"],
                          onDelete: () {
                            contrler.deleteDataSales(index);
                            // contrler.delet(index);
                            //contrler.purchasprodect.removeAt(index);
                            //  print("${contrler.purchasprodect[index]}");
                          },
                          onEdite: () {
                            Get.toNamed("/UpdateSalse", arguments: {
                              "medicineID": contrler.saleprodect[index]["medicineID"],
                              "id": contrler.saleprodect[index]["id"],
                              "medicineName": contrler.saleprodect[index]
                                  ["medicineName"],
                              "quantaty": contrler.saleprodect[index]
                                  ["quantaty"],
                              "UnitePrice": contrler.saleprodect[index]
                                  ["UnitePrice"],
                              "totalPrice": contrler.saleprodect[index]
                                  ["totalPrice"],
                              "customerName": contrler.saleprodect[index]
                                  ["customerName"],
                              "countryName": contrler.saleprodect[index]
                                  ["countryName"],
                            });
                          },
                        );
                      },
                      itemCount: contrler.saleprodect.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
