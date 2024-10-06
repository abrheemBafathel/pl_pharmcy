import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/purchas/controller/country_controller.dart';

class UpdateCountry extends StatelessWidget {
  UpdateCountry({super.key});
  final CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    controller.getargument();
    return Scaffold(
      appBar: AppBar(
          title:  Text(
        "90".tr,
        style:const TextStyle(fontSize: 30),
      )),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 3),
        child: Form(
          key: controller.globalKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.updatecountrnameeditingcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(SizeConfig.defaultSize! * 3)),
                      label:  Text("88".tr),
                      hintText: "89".tr),
                ),
                SizedBox(
                  height: SizeConfig.screenHeiht! * 0.2,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.updateCountry( );
                    Get.back();
                  },
                  
                  color: Colors.blue,
                  child:   Text("91".tr),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
