import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/homepage/controller/homemainecontroller.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customehomemainprodect.dart';

class ViewDayBuy extends StatelessWidget {
  const ViewDayBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("67".tr)),
      body: Container(
        child: GetBuilder<HomeMainController>(
          builder: (controller) => controller.salseOfDay.isEmpty
              ? Center(
                  child: Text("68".tr),
                )
              : ListView.builder(
                  itemCount: controller.salseOfDay.length,
                  itemBuilder: (_, index) {
                    return CustomHomeMainProdect(
                      name: controller.salseOfDay[index]["medicineName"],
                      quantity: controller.salseOfDay[index]["quantaty"],
                      expiredare: controller.salseOfDay[index]["expriyDate"],
                      madedate: controller.salseOfDay[index]["date"],
                    );
                  }),
        ),
      ),
    );
  }
}
