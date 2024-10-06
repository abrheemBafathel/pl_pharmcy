import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomHomeMainProdect extends StatelessWidget {
  final String? name;
  final int? quantity;
  final String? expiredare;
  final String? madedate;

  const CustomHomeMainProdect(
      {super.key, this.name, this.quantity, this.expiredare, this.madedate});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(width: SizeConfig.defaultSize! * 0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        // width: SizeConfig.screenWidth! * 0.3,
        //height: SizeConfig.screenWidth! * 0.3,
        child: SizedBox(
          width: SizeConfig.screenWidth! * 0.6,
          child: Row(
            children: [
              SizedBox(
                height: SizeConfig.screenHeiht! * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: Row(
                        children: [
                          Expanded(child: Text("57".tr)),
                          Expanded(child: Text("$name")),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: Row(
                        children: [
                          Expanded(child: Text("66".tr)),
                          Expanded(child: Text("$quantity")),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: Row(
                        children: [
                          Expanded(child: Text("52".tr)),
                          Expanded(child: Text("$expiredare")),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: Row(
                        children: [
                          Expanded(child: Text("53".tr)),
                          Expanded(child: Text("$madedate")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /* Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*5),
                  color: Color.fromARGB(255, 184, 50, 50),
                ),
                margin: EdgeInsets.only(left: SizeConfig.defaultSize!*2),
                height: SizeConfig.screenHeiht! * 0.15,
                width: SizeConfig.screenWidth! * 0.15,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
