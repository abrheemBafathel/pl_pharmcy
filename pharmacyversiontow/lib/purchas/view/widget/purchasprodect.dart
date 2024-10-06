import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchasProdect extends StatelessWidget {
  final String? medicamentName;
  final String? quantity;
  final int? unitprice;
  final String? totalprice;
  final String? suppliername;
  final String? made;
  final String? madedate;
  final String? exparedate;
  final String? workername;
  final String? medicingroup;
  final String? dateOFBuy;
  final String? companyname;
  final String? quantityprice;
  final String? row;
  final String? barcodenum;

  final String? column;
  final void Function()? onDelete;
  final void Function()? onEdite;

  const PurchasProdect(
      {super.key,
      this.medicamentName,
      this.quantity,
      this.unitprice,
      this.totalprice,
      this.suppliername,
      this.made,
      this.madedate,
      this.exparedate,
      this.onDelete,
      this.onEdite,
      this.workername,
      this.medicingroup,
      this.dateOFBuy,
      this.companyname,
      this.quantityprice,
      this.row,
      this.column,
      this.barcodenum});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Expanded(flex: 5, child: Text("77".tr)),
                Expanded(flex: 5, child: Text("$suppliername")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("78".tr)),
                Expanded(flex: 5, child: Text("$workername")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("79".tr)),
                Expanded(flex: 5, child: Text("$medicamentName")),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 4, child: Text("80".tr)),
                Expanded(flex: 1, child: Text("$medicingroup")),
                Expanded(flex: 2, child: Text("59".tr)),
                Expanded(flex: 3, child: Text("$quantity")),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: Text("81".tr)),
                Expanded(flex: 3, child: Text("$quantityprice")),
                Expanded(flex: 2, child: Text("197".tr)),
                Expanded(flex: 3, child: Text("$barcodenum")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: Text("82".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$made",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                Expanded(flex: 2, child: Text("83".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$companyname",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 5, child: Text("84".tr)),
                Expanded(
                  flex: 5,
                  child: Text(
                    "$dateOFBuy",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: Text("85".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$madedate",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                Expanded(flex: 2, child: Text("86".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$exparedate",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: Text("44".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$row",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
                Expanded(flex: 2, child: Text("47".tr)),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$column",
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
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
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
