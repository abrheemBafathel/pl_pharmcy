import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';

class UdateSaleProdect extends StatelessWidget {
  UdateSaleProdect(
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
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Text("114".tr)),
                Expanded(
                  flex: 4,
                  child: Text(" $medcicinName")),
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            SizedBox(
              width: 200,

              //width: SizeConfig.screenWidth!*0.25,
              child: DropdownButton(
                isExpanded: true,
                items: controller.customerNames
                    .map((e) => DropdownMenuItem(
                          child: Text('''${e["$dropdownname"]}'''),
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
                      controller.updateInputQuantity(text);
                    },
                    decoration: InputDecoration(
                      label: Text("115".tr),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.defaultSize! * 3),
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
                      controller.updateUnitePrice(text);
                    },
                    decoration: InputDecoration(
                        label: Text("116".tr),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.defaultSize! * 3))),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text("117".tr)),
                Expanded(
                  flex: 6,
                  child: Text("$totalPrice")),
              ],
            ),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: onSale, child:  Text("63".tr)))
          ],
        ),
      ),
    );
  }
}
