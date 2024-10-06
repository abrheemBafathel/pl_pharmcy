import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/homepage/controller/homemainecontroller.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customehomemainprodect.dart';

class ViewAlmostExpireMedicin extends StatelessWidget {
  const ViewAlmostExpireMedicin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("64".tr)),
      body: Container(
        child: GetBuilder<HomeMainController>(
          builder: (controller) => controller.AlmostexpierProdectListInformation.isEmpty
              ? Center(
                  child: Text("65".tr),
                )
              : ListView.builder(
                  itemCount: controller.AlmostexpierProdectListInformation.length,
                  itemBuilder: (_, index) {
                    return CustomHomeMainProdect(
                      name: controller.AlmostexpierProdectListInformation[index]["medicineName"],
                      quantity: controller.AlmostexpierProdectListInformation[index]["Quantity"],
                      expiredare: controller.AlmostexpierProdectListInformation[index]["expriyDate"],
                      madedate: controller.AlmostexpierProdectListInformation[index]["dateOFProduction"],
                    );
                  }),
        ),
      ),
    );
  }
}
