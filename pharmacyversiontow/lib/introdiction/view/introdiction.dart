import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class Introdiction extends StatelessWidget {
  const Introdiction({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLPharmacy",
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 5),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC5FFF8),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: SizeConfig.screenHeiht! * .10,
                minWidth: SizeConfig.screenWidth! * .60,
                onPressed: () {
                  Get.toNamed("/pharmacyloginview");
                },
                child: Text(
                  "صيدليه",
                  style: TextStyle(fontSize: SizeConfig.defaultSize! * 5),
                ),
                color: Color(0xff5FBDFF),
              ),
              SizedBox(
                height: SizeConfig.screenHeiht! * 0.09,
              ),
              MaterialButton(
                
                height: SizeConfig.screenHeiht! * .10,
                minWidth: SizeConfig.screenWidth! * .60,
                onPressed: () {
                  Get.toNamed("/supplierloginview");
                },
                child: Text("مورد",
                    style: TextStyle(fontSize: SizeConfig.defaultSize! * 5)),
                color: Color(0xff5FBDFF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
