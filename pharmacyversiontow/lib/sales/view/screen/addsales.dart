import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/customformfield.dart';
import 'package:pharmacyversiontow/sales/view/widge/saleprodect.dart';

class AddSalse extends StatelessWidget {
  AddSalse({super.key});
  final GlobalKey globalKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("106".tr)),
      body: GetBuilder<SalesController>(
        init: SalesController(),
        builder: (controller) => ListView(
          children: [
            Form(
                key: globalKey,
                child: Container(
                  height: SizeConfig.screenHeiht! * 0.85,
                  child: ListView(
                    children: [
                      CustomSalseFormField(
                        controller: controller.salseSreach,
                      ),
                      Expanded(
                        child: Container(
                          height: SizeConfig.screenHeiht! * .8,
                          child: GetBuilder<SalesController>(
                            builder: (contrller) => contrller.sreach == ""
                                ?  Center(
                                    child: Text("107".tr),
                                  )
                                : contrller.SalseSreachList.isEmpty
                                    ?  Center(
                                        child: Text("108".tr),
                                      )
                                    : ListView.builder(
                                        itemCount: contrller.SalseSreachList.length,
                                        itemBuilder: (context, index) {
                                          return SaleProdect(
                                            quantaty: contrller.quantaty,
                                            price: contrller.price,
                                            dropdownname: "customerName",
                                            medcicinName:
                                                contrller.SalseSreachList[index]
                                                    ["medicineName"],
                                            totalPrice:
                                                "${contrller.totalPrice}",
                                            onSale: () {
                                              contrller.setupdateQuantity(index);
                                            },
                                          );
                                        }),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
