import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CoMedicin extends StatelessWidget {
  const CoMedicin(
      {super.key,
      this.medicinName,
      this.supplierName,
      this.price,
      this.quantity,
      this.orderNumber,
      this.imagepath,
      this.addTofavirt,
      this.orderMedicin});
  final String? medicinName;
  final String? supplierName;
  final String? price;
  final String? quantity;
  final String? orderNumber;
  final String? imagepath;
  final void Function()? addTofavirt;
  final void Function()? orderMedicin;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        //height: SizeConfig.screenHeiht! * .40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagepath == null
                ? Container(
                    color: Colors.black87,
                    width: double.infinity,
                    height: SizeConfig.screenHeiht! * .19,
                    child: Center(
                        child: Text(
                      "151".tr,
                      style:const TextStyle(color: Colors.white),
                    )),
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("$imagepath"))),
                    height: SizeConfig.screenHeiht! * .19,
                    // color: Color.fromARGB(255, 160, 87, 87),
                  ),
            Row(
              children: [
                Expanded(flex: 4,
                  child: Text(
                    "121".tr,
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                ),
                Expanded(flex: 6,
                  child: Text(
                    "$medicinName",
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.5),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 4,
                  child: Text(
                    "130".tr,
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(flex: 6,
                  child: Text(
                    "$supplierName",
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "131".tr,
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$price",
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "132".tr,
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
                 Expanded(
                  flex: 3,
                  child: Text(
                    "$quantity",
                    style:const TextStyle(fontSize: 10),
                  ),
                ),
                
              ],
            ),
            Row(
              children: [
                const Spacer(
                  flex: 4,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "152".tr,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "$orderNumber",
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: orderMedicin, child: Text("153".tr)),
                ElevatedButton(
                    onPressed: addTofavirt, child: Text("154".tr)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
