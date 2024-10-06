import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class MedicinOrderWidget extends StatelessWidget {
  const MedicinOrderWidget(
      {super.key,
      this.customerName,
      this.nameMedicinOrder,
      this.quantityOrder,
      this.priceQuantity, this.received});
  final String? customerName;
  final String? nameMedicinOrder;
  final String? quantityOrder;
  final String? priceQuantity;
  final bool? received;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!*0.9),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("158".tr)),
                      Expanded(flex: 6, child: Text("$customerName")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("159".tr)),
                      Expanded(flex: 6, child: Text("$nameMedicinOrder")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("160".tr)),
                      Expanded(flex: 6, child: Text("$quantityOrder")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 4, child: Text("161".tr)),
                      Expanded(flex: 6, child: Text("$priceQuantity")),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(children: [
                IconButton(onPressed: (){}, icon: received != null ? received! 
                ? const Icon(Icons.fmd_good, color: Colors.blue,) 
                :const Icon(Icons.question_mark, color: Colors.red,)
                :const Text("null")
                )
                
              ],),
            )
          ],
        ),
      ),
    );
  }
}
