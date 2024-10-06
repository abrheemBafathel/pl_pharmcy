import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customformfiled.dart';
import 'package:pharmacyversiontow/pharmacylogin/controller/logincontroller.dart';
import 'package:pharmacyversiontow/purchas/controller/purchas_controller.dart';

class UpdatePurchas extends StatelessWidget {
  UpdatePurchas({super.key});
  final PurchasController purchasController = Get.find();
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    purchasController.readcountries();
    purchasController.readsupplier();
    purchasController.setdrobdownvalue();
    purchasController.gremant();

    SizeConfig.init(context);
    GlobalKey updatebuyformkey = GlobalKey();
    return Scaffold(
      appBar: AppBar(title: Text("74".tr)),
      body: GetBuilder<PurchasController>(
        builder: (controller) => Container(
          //height: SizeConfig.screenHeiht!*,
          padding: EdgeInsets.all(
            SizeConfig.screenHeiht! * 0.02,
          ),
          child: Form(
            key: updatebuyformkey,
            child: ListView(
              children: [
                CustomFormField(
                    controlerlName: controller.updatemedciname,
                    hinttext: "33".tr,
                    name: "34".tr),
                CustomFormField(
                    controlerlName: controller.updateprIce,
                    hinttext: "35".tr,
                    name: "36".tr),
                CustomFormField(
                    controlerlName: controller.updatequantIty,
                    hinttext: "37".tr,
                    name: "38".tr),
                CustomFormField(
                    controlerlName: controller.updatemedicineGroup,
                    hinttext: "39".tr,
                    name: "40".tr),
                CustomFormField(
                    controlerlName: controller.updatemedicineCompany,
                    hinttext:"41".tr,
                    name: "42".tr),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Divider(),
                    Text("43".tr),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Text("44".tr),
                              CustomFormField(
                                  controlerlName: controller.updaterow,
                                  hinttext: "45".tr,
                                  name: "46".tr),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              Text("47".tr),
                              CustomFormField(
                                  controlerlName: controller.updatecolumn,
                                  hinttext: "48".tr,
                                  name: "49".tr),
                            ],
                          ),
                        ),
                      ],
                    ),
                   const Divider(),
                    Text("50".tr),
                    SizedBox(
                      width: 200,

                      //width: SizeConfig.screenWidth!*0.25,
                      child: DropdownButton(
                        isExpanded: true,
                        items: controller.supplierlist
                            .map((e) => DropdownMenuItem(
                                  
                                  value: "${e["supName"]}",
                                  child: Text('''${e["supName"]}'''),
                                ))
                            .toList(),
                        onChanged: (val) {
                          controller.valuessupplier(val!);
                        },
                        value: controller.selectedSupplier,
                      ),
                    ),
                    Text("51".tr),
                    SizedBox(
                      width: 200,

                      // width: SizeConfig.screenWidth!*0.29,
                      // height: SizeConfig.screenHeiht!*0.25,
                      child: DropdownButton(
                        items: controller.countryList
                            .map((e) => DropdownMenuItem(
                                  
                                  value: "${e["countryName"]}",
                                  child: Text('''${e["countryName"]}'''),
                                ))
                            .toList(),
                        onChanged: (val) {
                          controller.valuescountry(val!);
                        },
                        value: controller.selectedcountry,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.updatedateOfExt,
                  decoration:  InputDecoration(
                      label: Text("52".tr),
                      filled: true,
                      prefixIcon:const Icon(Icons.calendar_today),
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedExpireDate(context,controller.updatedateOfExt);
                  },
                ),
              const  SizedBox(
                  height: 10,
                ),
                //حقل اضافه تاريخ صنع المنتج
                TextFormField(
                  controller: controller.updatedateOFProduction,
                  decoration:  InputDecoration(
                      label: Text("53".tr),
                      filled: true,
                      prefixIcon:const Icon(Icons.calendar_today),
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedMadeDate(context, controller.updatedateOFProduction);
                  },
                ),

                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                MaterialButton(
                  onPressed: () async{
                    controller.updatePurchas();
                    
                    Get.snackbar("title",
                        "${controller.dateOfExt.text} ${controller.selectedSupplier} ${controller.selectedcountry}  ${loginController.userName} ");
                    Get.back();
                        
                  },
                  color: Colors.blue,
                  minWidth: SizeConfig.defaultSize! * 15,
                  height: SizeConfig.defaultSize! * 6,
                 
                  shape: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 5)),
                   child: Text(
                    "54".tr,
                    style:const TextStyle(fontSize: 23),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
