import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class AccountController extends GetxController {
  SqlDb sqlDb = SqlDb();

  final TextEditingController? name = TextEditingController();
  final TextEditingController? phonenumber = TextEditingController();
  final TextEditingController? amount = TextEditingController();
  final TextEditingController? limit = TextEditingController();
  int? accNom;
  int? customerId;

  List<Map> accountList = [];

  void deletIist(int index) async {
    try {
      int aconrseponse = 0;
      int response = await sqlDb.deleteData(
          "DELETE  FROM Customer WHERE fkaccNom=${accountList[index]["AccNom"]}");
      print(
          "======================================================================");
      print("$response");

      print(
          "======================================================================");

      if (response > 0) {
        aconrseponse = await sqlDb.deleteData(
            "DELETE  FROM Accounts WHERE accNom=${accountList[index]["AccNom"]}");
        print(
            "======================================================================");
        print("$aconrseponse");

        print(
            "======================================================================");
      }
      if (response > 0 && aconrseponse > 0) {
        // accountList.removeWhere(
        //   (element) => element["AccNom"] == accountList[index]["AccNom"]);
      }
      readAccount();

      update();
    } catch (catcherror) {
      Get.snackbar("ERROR", " customer and account :$catcherror");
    }
  }

  @override
  void onInit() async {
    readAccount();
    super.onInit();
  }

  void addAccount(String name, int number, double limit, double amount) async {
    try {
      int randomAccountNumber=Random().nextInt(10000000);
      int randomCoustomer=Random().nextInt(100000000);
      int response = await sqlDb.insertData('''
        INSERT INTO
       "Accounts" (`AccNom`,`Amount` , `acoountlimit`)
        VALUES ( $randomAccountNumber,$amount , $limit )
      ''');
      print("$response");
      print(
          "====================================================================================");
      if (response > 0) {
        await sqlDb.insertData('''INSERT INTO 
           "Customer" (customerId,customerName , phoneNum, fkaccNom)
            VALUES ( $randomCoustomer , '$name' , $number , $randomAccountNumber)
          ''');
        print(
            "save name: $name number: $number amount: $amount limit: $limit in acount number $response");
        var ss = await sqlDb.readData("select * from Accounts");
        print(
            "====================================================================================");
        print("$ss");
        print(
            "====================================================================================");
        print("$accountList");
      }
      readAccount();
      update();
    } catch (error) {
      Get.snackbar("error", "amount can not be empity\n $error ",
          duration: Duration(minutes: 1));
      update();
    }
  }

  Future<List<Map>> readAccount() async {
    print("readData =========================================");
    accountList = await sqlDb.readData('''
                SELECT accNom,amount,acoountlimit, customerName ,customerId,phoneNum 
                FROM   Accounts, Customer 
                WHERE  Accounts.accNom=Customer.fkaccNom;
''');
    update();
    return accountList;
  }

  void getargument() {
    name!.text = Get.arguments["name"];
    phonenumber!.text = Get.arguments["phone"].toString();
    amount!.text = Get.arguments["amount"].toString();
    limit!.text = Get.arguments["limint"].toString();
    accNom = int.parse(Get.arguments["accNum"]!);
    customerId = Get.arguments["customerId"];
  }

  void updateAccount() async {
    int customerresponse = 0;
    int pphone = int.parse(phonenumber!.text);
    print("${customerId}");

    int response = await sqlDb.updateData('''
           UPDATE  Accounts SET Amount=${amount!.text}, acoountlimit=${limit!.text}
           WHERE AccNom=${accNom};  

    ''');
    print("$response");
    if (response > 0) {
      customerresponse = await sqlDb.updateData('''
          UPDATE  Customer SET customerName="${name!.text}", phoneNum=${pphone}
          WHERE customerId=${customerId};
       ''');
    }
    print("$customerresponse");

    update();
    readAccount();
    print("${accountList}");
  }

   void test(){
    Get.snackbar("test", '''name : ${name!.text} \n phone :${phonenumber!.text} \n
                   amount: ${amount!.text} \n
                   limite: ${limit!.text}
                             ''');
  }

}
