import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/saleprodect.dart';
class BarcodeSalse extends StatelessWidget {
 const BarcodeSalse({super.key});


  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SalesController>(
        init: SalesController(),
        builder: (controller) => ListView(
          children: [
            Container(
              height: SizeConfig.screenHeiht! * 0.85,
              child: ListView(
                children: [
                
                  Expanded(
                    child: Container(
                      height: SizeConfig.screenHeiht! * .8,
                      child: GetBuilder<SalesController>(
                        builder: (contrller) =>  contrller.salseSreachListbybarcod.isEmpty
                                ?  Center(
                                    child: Text("108".tr),
                                  )
                                : ListView.builder(
                                    itemCount: contrller.salseSreachListbybarcod.length,
                                    itemBuilder: (context, index) {
                                      return SaleProdect(
                                        quantaty: contrller.quantaty,
                                        price: contrller.price,
                                        dropdownname: "customerName",
                                        medcicinName:
                                            contrller.salseSreachListbybarcod[index]
                                                ["medicineName"],
                                        totalPrice:
                                            "${contrller.totalPrice}",
                                        onSale: () {
                                          contrller.setupdateQuantityByBarcode(index);
                                        },
                                      );
                                    }),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
