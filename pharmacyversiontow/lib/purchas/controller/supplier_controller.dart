import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class SupplierController extends GetxController {
  SqlDb sqlDb = SqlDb();

  TextEditingController suppliername = TextEditingController();
  TextEditingController suppliercompany = TextEditingController();
  TextEditingController supplierphone = TextEditingController();

  TextEditingController updatesuppliername = TextEditingController();
  TextEditingController updatesuppliercompany = TextEditingController();
  TextEditingController updatesupplierphone = TextEditingController();

  int? updateSupplierId;
  List<Map> supplierlist = [];

  @override
  void onInit() {
    readsupplier();
    super.onInit();
  }

  void addsupplier() async {
    try {
      int accountNumber = Random().nextInt(1000000);
      int supplierNumber = Random().nextInt(1000000);

      int response = 0;
      int accontresponse = await sqlDb.insertData('''
        INSERT INTO
       "Accounts" ( `AccNom` , `Amount` , `acoountlimit`)
        VALUES ($accountNumber, 0 , 0 )
      ''');
      debugPrint("$accontresponse");
      if (accontresponse > 0) {
        response = await sqlDb.insertData('''
  
  INSERT INTO suppliers(supID , supName , supCompany,supPhone,fksuaccNom)
   VALUES( $supplierNumber,"${suppliername.text}","${suppliercompany.text}",${int.parse(supplierphone.text)},$accountNumber)

  ''');
      }
      suppliercompany.text = "";
      suppliername.text = "";
      supplierphone.text = "";

      if (response > 0) {
        Get.snackbar("seccesfull ", "one row inserted");
      } else {
        Get.snackbar("failde ", "please enter all fields");
      }
      print("supplierlist:=>$supplierlist");
      readsupplier();

      update();
    } catch (e) {
      Get.defaultDialog(
        title: "ERROR",
        middleText: "$e",
        onCancel: () {},
      );
    }
  }

  void readsupplier() async {
    supplierlist = await sqlDb.readData('''
  
   SELECT *FROM  suppliers

  ''');
    supplierlist.isEmpty
        ? Get.snackbar("Failde read", "data is not found ")
        : Get.snackbar("Succesful", "data founded ");
    update();
  }

  void deletesupplier(int index) async {
    int response = await sqlDb.deleteData('''
  
   DELETE FROM suppliers
   WHERE supID=${supplierlist[index]["supID"]}

  ''');
    if (response > 0) {
      Get.snackbar("Succesful", "supplier has been deleted");
    } else {
      Get.snackbar("failde", "supplier has not been deleted");
    }
    readsupplier();
    update();
  }

  void getargument() {
    updateSupplierId = int.parse(Get.arguments["supID"]);
    updatesuppliername.text = Get.arguments["supName"];
    updatesuppliercompany.text = Get.arguments["supCompany"];
    updatesupplierphone.text = Get.arguments["supPhone"];
  }

  void updateSupplier() async {
    int respones = await sqlDb.insertData('''
  
  UPDATE suppliers 
  SET  supName="${updatesuppliername.text}" ,
  supCompany="${updatesuppliercompany.text}",
  supPhone=${updatesupplierphone.text}
  WHERE supID=$updateSupplierId
  
  ''');
    if (respones > 0) {
      Get.snackbar("Succesful", "Succesful update");
    } else {
      Get.snackbar("Error", "Faild update");
    }
    readsupplier();
    update();
  }
}
