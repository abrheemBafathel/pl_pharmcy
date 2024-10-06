import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
class SaleProdect extends StatelessWidget {
  SaleProdect(
      {super.key,
      this.medcicinName,
      this.totalPrice,
      this.onSale,
      required this.dropdownname,
      this.quantaty,
      this.price});
  final String? medcicinName;
  final String? totalPrice;
  final String dropdownname;
  final TextEditingController? quantaty;
  final TextEditingController? price;
  final void Function()? onSale;

  final SalesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:EdgeInsets.all(SizeConfig.defaultSize!) ,
              child: Row(
                children: [
                 // Expanded(flex: 3, child: Text("57".tr)),
                  Expanded(flex: 6, child: Text("  $medcicinName")),
                  Expanded(
                    flex: 4,
                    child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "58".tr,
                          content: Column(
                            children: [
                              SizedBox(
                                width: 200,
            
                                //width: SizeConfig.screenWidth!*0.25,
                                child: DropdownButton(
                                  isExpanded: true,
                                  items: controller.customerNames
                                      .map((e) => DropdownMenuItem(
                                            child:
                                                Text('''${e["$dropdownname"]}'''),
                                            value: "${e["$dropdownname"]}",
                                          ))
                                      .toList(),
                                  onChanged: (val) {
                                    controller.valuescustomer(val!);
                                  },
                                  value: controller.selectedCustomer,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth! * .3,
                                    child: TextFormField(
                                      controller: quantaty,
                                      onChanged: (text) {
                                        controller.addquantity(text);
                                      },
                                      decoration: InputDecoration(
                                        label: Text("59".tr),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.defaultSize! * 3),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.defaultSize,
                                  ),
                                  Container(
                                    width: SizeConfig.screenWidth! * .3,
                                    child: TextFormField(
                                      controller: price,
                                      onChanged: (text) {
                                        controller.addprice(text);
                                      },
                                      decoration: InputDecoration(
                                          label: Text("60".tr),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(
                                                  SizeConfig.defaultSize! * 3))),
                                    ),
                                  )
                                ],
                              ),
                              GetBuilder<SalesController>(
                                init: SalesController(),
                                builder: (controller) => Row(
                                  children: [
                                    Expanded(flex: 4, child: Text("61".tr)),
                                    Expanded(
                                        flex: 6,
                                        child: Text("${controller.totalPrice}")),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.defaultSize,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    onSale!();
                                  },
                                  child: Text("62".tr)),
                            ],
                          ),
                        );
                      },
                      child: Text("58".tr))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
           /* Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "58".tr,
                        content: Column(
                          children: [
                            SizedBox(
                              width: 200,

                              //width: SizeConfig.screenWidth!*0.25,
                              child: DropdownButton(
                                isExpanded: true,
                                items: controller.customerNames
                                    .map((e) => DropdownMenuItem(
                                          child:
                                              Text('''${e["$dropdownname"]}'''),
                                          value: "${e["$dropdownname"]}",
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  controller.valuescustomer(val!);
                                },
                                value: controller.selectedCustomer,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth! * .3,
                                  child: TextFormField(
                                    controller: quantaty,
                                    onChanged: (text) {
                                      controller.addquantity(text);
                                    },
                                    decoration: InputDecoration(
                                      label: Text("59".tr),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            SizeConfig.defaultSize! * 3),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.defaultSize,
                                ),
                                Container(
                                  width: SizeConfig.screenWidth! * .3,
                                  child: TextFormField(
                                    controller: price,
                                    onChanged: (text) {
                                      controller.addprice(text);
                                    },
                                    decoration: InputDecoration(
                                        label: Text("60".tr),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                SizeConfig.defaultSize! * 3))),
                                  ),
                                )
                              ],
                            ),
                            GetBuilder<SalesController>(
                              init: SalesController(),
                              builder: (controller) => Row(
                                children: [
                                  Expanded(flex: 4, child: Text("61".tr)),
                                  Expanded(
                                      flex: 6,
                                      child: Text("${controller.totalPrice}")),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.defaultSize,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  onSale!();
                                },
                                child: Text("62".tr)),
                          ],
                        ),
                      );
                    },
                    child: Text("58".tr))),*/
          ],
        ),
      ),
    );
  }
}
