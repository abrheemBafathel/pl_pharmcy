import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/customformfield.dart';
import 'package:pharmacyversiontow/sales/view/widge/saleprodect.dart';

class SellPage extends StatelessWidget {
  SellPage({super.key});
  final GlobalKey globalKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  final SalesController contro = Get.put(SalesController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      // height: SizeConfig.screenHeiht!*0.9,
      child: GetBuilder<SalesController>(
          init: SalesController(),
          builder: (controller) => ListView(
            children: [
              
                 Expanded(
                  child: Container(
                    height: SizeConfig.screenHeiht! * 0.8,
                    child: ListView(
                      children: [
                        CustomSalseFormField(
                          controller: controller.salseSreach,
                        ),
                        Expanded(
                          child: GetBuilder<SalesController>(
                            builder: (contrller) => contrller.sreach == ""
                                ? Center(
                                    child: Text("55".tr),
                                  )
                                : contrller.SalseSreachList.isEmpty
                                    ? Center(
                                        child: Text("56".tr),
                                      )
                                    : Container(
                                        height: SizeConfig.screenHeiht! * 0.7,
                                        child: ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return SaleProdect(
                                                quantaty: contrller.quantaty,
                                                price: contrller.price,
                                                dropdownname: "customerName",
                                                medcicinName: contrller
                                                        .SalseSreachList[index]
                                                    ["medicineName"],
                                                totalPrice:
                                                    "${contrller.totalPrice}",
                                                onSale: () {
                                                  contrller
                                                      .setupdateQuantity(index);
                                                },
                                              );
                                            }),
                                      ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
             
            ],
          ),
        ),
      
    );
  }
}
