import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/homepage/controller/homemainecontroller.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customehomemainprodect.dart';

class ViewDayPurchas extends StatelessWidget {
  const ViewDayPurchas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("69".tr)),
      body: Container(
        child: GetBuilder<HomeMainController>(
          builder: (controller) => controller.buyofday.isEmpty
              ? Center(
                  child: Text("70".tr),
                )
              : ListView.builder(
                  itemCount: controller.buyofday.length,
                  itemBuilder: (_, index) {
                    return CustomHomeMainProdect(
                      name: controller.buyofday[index]["medicineName"],
                      quantity: controller.buyofday[index]["Quantity"],
                      expiredare: controller.buyofday[index]["expriyDate"],
                      madedate: controller.buyofday[index]["dateOFProduction"],
                    );
                  }),
        ),
      ),
    );
  }
}
