import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomerAccount extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? accountnumber;
  final String? amount;
  final String? customernumber;
  final String? limit;
  final void Function()? delete;
  final void Function()? edit;
  const CustomerAccount(
      {super.key,
      this.name,
      this.accountnumber,
      this.amount,
      this.delete,
      this.edit,
      this.phone,
      this.customernumber,
      this.limit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2,  child: Text("189".tr)),
                Expanded(flex: 3,  child: Text("$name")),
                 Expanded(flex: 2, child: Text("190".tr)),
                Expanded(flex: 3, child: Text("$phone")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: Text("191".tr)),
                Expanded(flex: 3, child: Text("$customernumber")),
                Expanded(flex: 2, child: Text("192".tr)),
                Expanded(flex: 3, child: Text("$accountnumber")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Expanded(flex: 2, child: Text("193".tr)),
                Expanded(flex: 3, child: Text("$limit")),
                Expanded(flex: 2, child: Text("194".tr)),
                Expanded(flex: 3, child: Text("$amount")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: delete,
                    icon:const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: edit,
                    icon:const Icon(
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
