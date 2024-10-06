import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/widge/updatesalseprodect.dart';
class UpdateSalse extends StatelessWidget {
  UpdateSalse({super.key});
  final GlobalKey globalKey = GlobalKey();
  final TextEditingController textEditingController = TextEditingController();
  final SalesController controller =Get.find(); 

  @override
  Widget build(BuildContext context) {
    controller.getarguments();

    return Scaffold(
      appBar: AppBar(title: Text("113".tr)),
      body: GetBuilder<SalesController>(
        init: SalesController(),
        builder: (controller) =>  UdateSaleProdect(
          
          quantaty: controller.updateQuantaty,
                price: controller.updateprice,
               dropdownname: "customerName",
                medcicinName:"banadol",
                // controller.SalseSreachList[0]["medicineName"],
                totalPrice: controller.updateTotalPrice.toString(),
                //"${controller.totalPrice}",
                onSale: () {
                  controller.updateSales();
                },
              ),
            
      ),
    );
  }
}
