import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomeSupplier extends StatelessWidget {
  final String? suppliername;
  final String? suppliercompany;
  final String? supplierID;
  final String? supplierAccounteID;
  final String? supplierphone;
  final void Function()? deletesupplier;
  final void Function()? updatesupplier;
  const CustomeSupplier(
      {super.key,
      this.suppliername,
      this.suppliercompany,
      this.supplierphone,
      this.supplierID,
      this.deletesupplier,
      this.updatesupplier,
      this.supplierAccounteID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        width: SizeConfig.screenWidth,
        child: Column(children: [
          Row(
            children: [
              Expanded(flex: 5, child: Text("95".tr)),
              Expanded(flex: 5, child: Text("$suppliername")),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 5, child: Text("97".tr)),
              Expanded(flex: 5, child: Text("$suppliercompany")),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 5, child: Text("999".tr)),
              Expanded(flex: 5, child: Text("$supplierphone")),
            ],
          ),
          Row(
            children: [
              Expanded(flex: 5, child: Text("104".tr)),
              Expanded(flex: 5, child: Text("$supplierID")),
            ],
          ),
          Row(
            children: [
              Text("105".tr),
              Text("$supplierAccounteID"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: deletesupplier,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: updatesupplier,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
