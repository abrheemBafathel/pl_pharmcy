import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/homepage/controller/homemainecontroller.dart';
import 'package:pharmacyversiontow/homepage/view/widget/custom_home_main_button.dart';
import 'package:pharmacyversiontow/pharmacylogin/controller/logincontroller.dart';

class HomeMain extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final HomeMainController homeMainController = Get.put(HomeMainController());

  HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    homeMainController.exepierProdect();
    homeMainController.almostExepierProdect();
    homeMainController.purchOfDay();
    homeMainController.salsOfDayMothed();
     SizeConfig.init(context);
    return Stack(
      children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.defaultSize!),
              height: SizeConfig.screenHeiht! * 0.3,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.defaultSize! * 2),
                    bottomRight: Radius.circular(SizeConfig.defaultSize! * 2)),
                color: Color.fromARGB(200, 11, 74, 192),
                //Color.fromRGBO(9, 207, 174, 0.6),
              ),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.defaultSize!),
                  topRight: Radius.circular(SizeConfig.defaultSize!),
                )),
                height: SizeConfig.screenHeiht! * 0.55,
                margin: EdgeInsets.all(SizeConfig.defaultSize!),
                child: GetBuilder<HomeMainController>(
                  builder: (controller) => SingleChildScrollView(
                    child: Column(
                      children: [
                        /*MaterialButton(onPressed: () async {
                          await controller.deleteDataBase();
                          print(
                              "==============================deleteDatabase===================");
                        },child: Text("deleteDB"),),*/
                        CustomHomeMainButton(
                          title: "18".tr,
                          subtitle: "19".tr,
                          numberofmedicin:
                              "${controller.expierProdectList.length}",
                          onPressed: () async {
                            await controller.getEXpireMedicinInformation();
                            Get.toNamed("/ViewExpireMedicin");
                          },
                        ),
                        CustomHomeMainButton(
                          title: "20".tr,
                          subtitle: "21".tr,
                          numberofmedicin:
                              "${controller.almostExpierProdectList.length}",
                          onPressed: () async {
                            await controller
                                .getAlmostEXpireMedicinInformation();
                            Get.toNamed("/ViewAlmostExpireMedicin");
                          },
                        ),
                        CustomHomeMainButton(
                          title: "22".tr,
                          subtitle: "23".tr,
                          onPressed: () {
                            Get.toNamed("/ViewDayBuy");
                          },
                          numberofmedicin: "${controller.salseOfDay.length}",
                        ),
                        CustomHomeMainButton(
                          title: "24".tr,
                          subtitle: "25".tr,
                          onPressed: () async {
                            await controller.salsOfDayMothed();
                            Get.toNamed("/ViewDayPurchas");
                          },
                          numberofmedicin: "${controller.buyofday.length}",
                        ),

                        /* Container(
                          height: SizeConfig.screenHeiht!*0.55,
                          child:  GetBuilder<HomeMainController>(
                            builder:(controller)=> controller.buyofday.isEmpty? Center(child: Text("no element "),)
                            : ListView.builder(
                              itemCount: homeMainController.buyofday.length,
                              itemBuilder: (_, index){
                                return CustomHomeMainProdect(name: controller.buyofday[index]["medicineName"],);
                              
                            }),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                               
                                ElevatedButton(onPressed: () {}, child: Text("الادويه المشارفه على الانتهاء ")),
                                 ElevatedButton(onPressed: () {
                                  homeMainController.exepierProdect();
                                 }, child: Text("الادويه المنتهيه "))
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(onPressed: () {
                                  homeMainController.salsOfDay();
                                 
                                }, child: Text(" مبيعات اليوم")),
                                ElevatedButton(onPressed: () {
                                   homeMainController.purchOfDay();
                                }, child: Text(" مشتريات اليوم")),
                                
                               
                              ],
                                         ),
                        
                          ],
                        )*/
                      ],
                    ),
                  ),
                ),
              ),
            
        ),
      ],
    );
  }
}
