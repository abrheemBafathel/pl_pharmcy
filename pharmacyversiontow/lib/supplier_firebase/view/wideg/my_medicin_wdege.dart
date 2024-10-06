import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class MyMedicinWidget extends StatelessWidget {
  const MyMedicinWidget(
      {super.key,
      this.leadingImge,
      this.medicinTitle,
      this.supplierName,
      this.price,
      this.quantity,
      this.onEdite,
      this.onDelete});
  final Widget? leadingImge;
  final String? medicinTitle;
  final void Function()? onEdite;
  final void Function()? onDelete;

  final String? supplierName;
  final String? price;
  final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!*1.5),
       // height: 180,
        child: ListTile(
          leading: leadingImge ?? const Icon(Icons.person),
          title: Text("$medicinTitle"),
          subtitle: SizedBox(
            height: 150,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                       Expanded(child: Text("130".tr)),
                      Expanded(child: Text("$supplierName")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("131".tr)),
                      Expanded(child: Text("$price")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("132".tr)),
                      Expanded(child: Text("$quantity")),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       const Spacer(
                          flex: 3,
                        ),
                        Expanded(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: onEdite,
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    )),
                                IconButton(
                                    onPressed: onDelete,
                                    icon:const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
