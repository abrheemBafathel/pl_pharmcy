import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/salseprodect.dart';

class ViewSles extends StatelessWidget {
  ViewSles({super.key});
  final SalesController salesController = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("109".tr)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/AddSalse");
        },
        child: Icon(Icons.add),
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
                child: Text("110".tr),
              ),
              ElevatedButton(
                onPressed: () {
                  salesController.readDataSalesWithoutCustomer();
                },
                child: Text("111".tr),
              ),
            ],
          ),
          Container(
            height: SizeConfig.screenHeiht! * 0.7,
            child: GetBuilder<SalesController>(
              builder: (contrler) => contrler.saleprodect.isEmpty
                  ? Center(
                      child: Text("112".tr),
                    )
                  : ListView.builder(
                      itemBuilder: (Context, index) {
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
                            print("deleted");
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
