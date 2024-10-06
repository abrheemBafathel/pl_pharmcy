import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/purchas/controller/country_controller.dart';

class AddCountry extends StatelessWidget {
  AddCountry({super.key});
  final CountryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "87".tr,
        style: const TextStyle(fontSize: 30),
      )),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
        child: Form(
          key: controller.globalKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.countrnameeditingcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                      label: Text("88".tr),
                      hintText: "89".tr),
                ),
                SizedBox(
                  height: SizeConfig.screenHeiht! * 0.2,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.insertData();
                    Get.back();
                  },
                  color: Colors.blue,
                  child: Text("54".tr),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
