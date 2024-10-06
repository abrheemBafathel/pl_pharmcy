import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/homepage/controller/homemainecontroller.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customehomemainprodect.dart';

class ViewExpireMedicin extends StatelessWidget {
  const ViewExpireMedicin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("71".tr)),
      body: Container(
        child: GetBuilder<HomeMainController>(
          builder: (controller) => controller.expierProdectListInformation.isEmpty
              ? Center(
                  child: Text("72".tr),
                )
              : ListView.builder(
                  itemCount: controller.expierProdectListInformation.length,
                  itemBuilder: (_, index) {
                    return CustomHomeMainProdect(
                      name: controller.expierProdectListInformation[index]["medicineName"],
                      quantity: controller.expierProdectListInformation[index]["Quantity"],
                      expiredare: controller.expierProdectListInformation[index]["expriyDate"],
                      madedate: controller.expierProdectListInformation[index]["dateOFProduction"],
                    );
                  }),
        ),
      ),
    );
  }
}
