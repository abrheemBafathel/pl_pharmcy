import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class FivertWidget extends StatelessWidget {
  const FivertWidget({
    super.key,
    this.leadingImge,
    this.medicinTitle,
    this.supplierName,
    this.price,
    this.quantity,
    this.onStar,
  });
  final Widget? leadingImge;
  final String? medicinTitle;
  final void Function()? onStar;

  final String? supplierName;
  final String? price;
  final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(
            left: SizeConfig.defaultSize! * 2,
            right: SizeConfig.defaultSize! * 2,
            bottom: SizeConfig.defaultSize! * 2),
        height: SizeConfig.screenHeiht! * 0.23,
        child: ListTile(
          leading: leadingImge ?? const Icon(Icons.person),
          title: Text("$medicinTitle"),
          subtitle: SizedBox(
            height: SizeConfig.screenHeiht! * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("130".tr)),
                    Expanded(
                      flex: 6,
                      child: Text("$supplierName")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("131".tr)),
                    Expanded(
                      flex: 6,
                      child: Text("$price")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("132".tr)),
                    Expanded(
                      flex: 6,
                      child: Text("$quantity")),
                  ],
                ),
              ],
            ),
          ),
          trailing: IconButton(
            onPressed: onStar,
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
