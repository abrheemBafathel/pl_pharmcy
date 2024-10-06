import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/homepage/view/widget/customformfiled.dart';
import 'package:pharmacyversiontow/purchas/controller/purchas_controller.dart';

class AddNewPurchase extends StatelessWidget {
  AddNewPurchase({super.key});
  final PurchasController purchasController = Get.put(PurchasController());

  @override
  Widget build(BuildContext context) {
     purchasController.readcountries();
    purchasController.readsupplier();
    purchasController.setdrobdownvalue();
    GlobalKey buyformkey = GlobalKey();
    return Scaffold(
      appBar: AppBar(title: Text("73".tr)),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!*1.5),
        child: GetBuilder<PurchasController>(
          builder: (controller) => Form(
            key: buyformkey,
            child: SingleChildScrollView(
              child: Column(children: [
                CustomFormField(
                    controlerlName: purchasController.medciname,
                    hinttext: "33".tr,
                    name: "34".tr),
                CustomFormField(
                    controlerlName: purchasController.prIce,
                    hinttext: "35".tr,
                    name: "36".tr),
                CustomFormField(
                    controlerlName: purchasController.quantIty,
                    hinttext: "37".tr,
                    name: "38".tr),
                CustomFormField(
                    controlerlName: purchasController.medicineGroup,
                    hinttext: "39".tr,
                    name: "40".tr),
                CustomFormField(
                    controlerlName: purchasController.medicineCompany,
                    hinttext: "41".tr,
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
                         width: SizeConfig.screenWidth!*0.3,
                          child: Column(
                            children: [
                              Text("44".tr),
                              CustomFormField(
                                  controlerlName: purchasController.row,
                                  hinttext: "45".tr,
                                  name: "46".tr),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth!*0.3,
                          child: Column(
                            children: [
                              Text("47".tr),
                              CustomFormField(
                                  controlerlName: purchasController.column,
                                  hinttext: "48".tr,
                                  name: "49".tr),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
               const Divider(),
                Text("50".tr),
                SizedBox(
                  width: SizeConfig.screenWidth!*0.7,
      
                  //width: SizeConfig.screenWidth!*0.25,
                  child: DropdownButton(
                    isExpanded: true,
                    items: purchasController.supplierlist
                        .map((e) => DropdownMenuItem(
                             
                              value: "${e["supName"]}",
                               child: Text('''${e["supName"]}'''),
                            ))
                        .toList(),
                    onChanged: (val) {
                      purchasController.valuessupplier(val!);
                    },
                    value: purchasController.selectedSupplier,
                  ),
                ),
                Text("51".tr),
                SizedBox(
                 
      
                   width: SizeConfig.screenWidth!*0.7,
                  // height: SizeConfig.screenHeiht!*0.25,
                  child: DropdownButton(
                    items: purchasController.countryList
                        .map((e) => DropdownMenuItem(
                              
                              value: "${e["countryName"]}",
                              child: Text('''${e["countryName"]}'''),
                            ))
                        .toList(),
                    onChanged: (val) {
                      purchasController.valuescountry(val!);
                    },
                    value: purchasController.selectedcountry,
                  ),
                ),
                //حقل اضافه تاريخ صنع المنتج
                TextFormField(
                  controller: controller.dateOFProduction,
                  decoration: InputDecoration(
                      label: Text("53".tr),
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedMadeDate(
                        context, controller.dateOFProduction);
                  },
                ),
                SizedBox(
                  height: SizeConfig.defaultSize!,
                ),
                TextFormField(
                  controller: controller.dateOfExt,
                  decoration: InputDecoration(
                      label: Text("52".tr),
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue))),
                  readOnly: true,
                  onTap: () {
                    controller.selectedExpireDate(context, controller.dateOfExt);
                  },
                ),
      
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                MaterialButton(
                  onPressed: () async {
                    await controller.scanbCode();
                  },
                  color: Colors.blue,
                  minWidth: SizeConfig.screenWidth! * 0.6,
                  height: SizeConfig.defaultSize! * 6,
                  shape: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 5)),
                  child: Text(
                    "200".tr,
                    style:  TextStyle(fontSize: SizeConfig.defaultSize!*2),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
                MaterialButton(
                  
                  onPressed: () {
                    controller.addMedicin();
                  },
                  color: Colors.blue,
                  minWidth: SizeConfig.screenWidth! * 0.6,
                  height: SizeConfig.defaultSize! * 6,
                 
                  shape: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.defaultSize! * 5)),
                           child: Text(
                    "54".tr,
                    style: TextStyle(fontSize: SizeConfig.defaultSize!*2),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
