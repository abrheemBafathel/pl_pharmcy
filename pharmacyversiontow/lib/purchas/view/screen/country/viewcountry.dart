import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/purchas/controller/country_controller.dart';
import 'package:pharmacyversiontow/purchas/view/widget/customcountry.dart';

class ViewCountry extends StatelessWidget {
  ViewCountry({super.key});
  final CountryController countryController =
      Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(
        "92".tr,
        style:const TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Get.toNamed("/AddCountry");
        },
        child:const Icon(Icons.add),
      ),
      body: GetBuilder<CountryController>(
        builder: (controller) => countryController.countrslist.isEmpty
            ?  Center(
                child: Text("93".tr))
            : GridView.builder(
                itemCount: controller.countrslist.length,
                scrollDirection: Axis.vertical,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Expanded(
                    child: CustomCountry(
                      countryname: controller.countrslist[index]["countryName"],
                      delete: () {
                        controller.deleteCountry(index);
                      },
                      edite: () {
                        Get.toNamed("/UpdateCountry", arguments: {
                          "id":
                              '''${controller.countrslist[index]["countryId"]}''',
                          "name":
                              '''${controller.countrslist[index]["countryName"]}''',
                        });
                        controller.readData();
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
