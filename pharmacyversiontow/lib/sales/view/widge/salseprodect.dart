import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesProdect extends StatelessWidget {
  final String? medicamentName;
  final String? quantity;
  final String? unitprice;
  final String? totalprice;
  final String? customer;
  final String? made;
  final String? saledate;
  final void Function()? onDelete;
  final void Function()? onEdite;

  const SalesProdect(
      {super.key,
      this.medicamentName,
      this.quantity,
      this.unitprice,
      this.totalprice,
      this.customer,
      this.made,
      this.saledate,
      this.onDelete,
      this.onEdite});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(children: [
              Expanded(flex: 5, child: Text("10".tr)),
              Expanded(
                flex: 5,
                child: Text("$medicamentName"),
              )
            ]),
            Row(
              children: [
                Expanded(flex: 5, child: Text("59".tr)),
                Expanded(flex: 5, child: Text("$quantity")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("11".tr)),
                Expanded(flex: 5, child: Text("$unitprice")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("12".tr)),
                Expanded(flex: 5, child: Text("$totalprice")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("13".tr)),
                Expanded(flex: 5, child: Text(" $customer")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("14".tr)),
                Expanded(flex: 5, child: Text("$made")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("15".tr)),
                Expanded(flex: 5, child: Text("$saledate")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                IconButton(
                  onPressed: onEdite,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
