import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customformfiled.dart';
import 'package:pharmacyversiontow/pharmacylogin/controller/logincontroller.dart';
import 'package:pharmacyversiontow/purchas/controller/purchas_controller.dart';

class Buypage extends StatelessWidget {
  Buypage({super.key});
  final PurchasController purchasController = Get.put(PurchasController());
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    purchasController.readcountries();
    purchasController.readsupplier();
    purchasController.setdrobdownvalue();

    SizeConfig.init(context);
    GlobalKey buyformkey = GlobalKey();
    return Scaffold(
      body: GetBuilder<PurchasController>(
        builder: (controller) => Container(
          //height: SizeConfig.screenHeiht!*,
          padding: EdgeInsets.all(
            SizeConfig.screenHeiht! * 0.02,
          ),
          child: Form(
            key: buyformkey,
            child: ListView(
              children: [
                CustomFormField(
                    controlerlName: controller.medciname,
                    hinttext: "33".tr,
                    name: "34".tr),
                CustomFormField(
                    controlerlName: controller.prIce,
                    hinttext: "35".tr,
                    name: "36".tr),
                CustomFormField(
                    controlerlName: controller.quantIty,
                    hinttext: "37".tr,
                    name: "38".tr),
                CustomFormField(
                    controlerlName: controller.medicineGroup,
                    hinttext: "39".tr,
                    name: "40".tr),
                CustomFormField(
                    controlerlName: controller.medicineCompany,
                    hinttext: "41".tr,
                    name: "42".tr),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text("43".tr),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          child: Column(
                            children: [
                              Text("44".tr),
                              CustomFormField(
                                  controlerlName: controller.row,
                                  hinttext: "45".tr,
                                  name: "46".tr),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            children: [
                              Text("47".tr),
                              CustomFormField(
                                  controlerlName: controller.column,
                                  hinttext: "48".tr,
                                  name: "49".tr ),
                            ],
                          ),
                        ),
                      ],
                    ),
                   
                    Divider(),
                    Text("50".tr),
                    SizedBox(
                      width: 200,

                      //width: SizeConfig.screenWidth!*0.25,
                      child: DropdownButton(
                        isExpanded: true,
                        items: controller.supplierlist
                            .map((e) => DropdownMenuItem(
                                  child: Text('''${e["supName"]}'''),
                                  value: "${e["supName"]}",
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
                                  child: Text('''${e["countryName"]}'''),
                                  value: "${e["countryName"]}",
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
                  controller: controller.dateOfExt,
                  decoration:  InputDecoration(
                      label: Text("52".tr),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedExpireDate(context,controller.dateOfExt);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //حقل اضافه تاريخ صنع المنتج
                TextFormField(
                  controller: controller.dateOFProduction,
                  decoration:  InputDecoration(
                      label: Text("54".tr),
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedMadeDate(context, controller.dateOFProduction);
                  },
                ),
                  SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                MaterialButton(
                  onPressed: ()async {
                   await controller.scanbCode();
                  },
                  color: Colors.blue,
                  minWidth: SizeConfig.defaultSize! * 15,
                  height: SizeConfig.defaultSize! * 6,
                 
                  shape: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 5)),
                           child: Text(
                    "scan barcode",
                    style:const TextStyle(fontSize: 23),
                  ),
                  
                  
                ),
              
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                MaterialButton(
                  onPressed: () {
                    controller.addMedicin();
                    
                    Get.snackbar("title",
                        "${controller.dateOfExt.text} ${controller.selectedSupplier} ${controller.selectedcountry}  ${loginController.userName} ");
                  },
                  color: Colors.blue,
                  minWidth: SizeConfig.defaultSize! * 15,
                  height: SizeConfig.defaultSize! * 6,
                  child: Text(
                    "54".tr,
                    style: TextStyle(fontSize: 23),
                  ),
                  shape: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 5)),
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
