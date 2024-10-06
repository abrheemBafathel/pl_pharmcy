import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';


class CountryController extends GetxController {
  final GlobalKey globalKey = GlobalKey();
  SqlDb sqlDb = SqlDb();

  TextEditingController countrnameeditingcontroller = TextEditingController();

  TextEditingController updatecountrnameeditingcontroller =
      TextEditingController();
  int? idcountry;

  List<Map> countrslist = [];

  @override
  void onInit() {
    readData();

    super.onInit();
  }

  void insertData() async {
  try {
    debugPrint("=============== 1 ============");
     int randomCountryNumber= Random().nextInt(100000000);
        debugPrint("=============== 2 ============");

     int respones = await sqlDb.insertData('''
      INSERT INTO countries(countryId,countryName)
      VALUES($randomCountryNumber ,"${countrnameeditingcontroller.text}")
  
  ''');
      debugPrint("=============== 3 ============");

    if (respones > 0) {
      Get.snackbar("Succesful",
          "name country ${countrnameeditingcontroller.text} is inserted ");
    } else {
      Get.snackbar("Failde",
          "name country ${countrnameeditingcontroller.text} is not inserted ");
    }
    countrnameeditingcontroller.text = "";
    update();
    readData();}catch(e){
      Get.defaultDialog(title: "ERROR", middleText: "$e" ,onCancel: (){});
    }
  }

  void readData() async {
    countrslist = await sqlDb.readData('''
  
  SELECT *FROM countries
  
  ''');
    debugPrint("$countrslist");

    update();
    debugPrint("select response:=> $countrslist");
  }

  void deleteCountry(int index) async {
    int response = await sqlDb.deleteData('''
  DELETE FROM countries
  WHERE countryId=${countrslist[index]["countryId"]}
  
  ''');
    if (response > 0) {
      Get.snackbar(
          "Succesful", "${countrslist[index]["countryName"]}  deleted");
    } else {
      Get.snackbar(
          "failed", "${countrslist[index]["countryName"]} does not deleted");
    }
    readData();
    update();
  }

  void getargument(){
    updatecountrnameeditingcontroller.text=Get.arguments["name"];
    idcountry=int.parse(Get.arguments["id"]);

  }

  void updateCountry() async {
    try{
    int updaterespones = await sqlDb.insertData('''
  
  UPDATE countries 
  SET  countryName="${updatecountrnameeditingcontroller.text}" 
  WHERE countryId=$idcountry
  
  ''');
    if (updaterespones > 0) {
      Get.snackbar("Succesful", "Succesful update");
    } else {
       Get.defaultDialog(
      title: "ERROR",
      middleText: "$updaterespones",
      onCancel: (){}
    );
    }
   readData();
    update();
  }catch(e){
    Get.defaultDialog(
      title: "ERROR",
      middleText: "$e",
      onCancel: (){}
    );
  }
  
  }
}
