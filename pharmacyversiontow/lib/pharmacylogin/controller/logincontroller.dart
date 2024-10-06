import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> creataccountglobalKey = GlobalKey<FormState>();

  String? userName ;
  int? userpassword ;

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  SqlDb sqlDb = SqlDb();

  List<Map> listlogin = [];

  @override
  void onInit() {
    readData();
    super.onInit();
  }

  void insertData() async {
    int randomUserId=Random().nextInt(10000000);
    int response = await sqlDb.insertData('''
   INSERT INTO users(uId,uName,uPass) VALUES($randomUserId,"${name.text}",${password.text})

    ''');
    if (response > 0) {
      userName=name.text;
      Get.snackbar("Succesful", "create account ${name.text} done");
    } else {
      Get.snackbar("Failed", "create account ${name.text} failed");
    }
    update();
    
  }

  void readData() async {
    listlogin = await sqlDb.readData('''
   SELECT * FROM users

    ''');
    update();
    print("$listlogin");
  }

  void chackuser() {
    print("chackuser========================================");
    print("${password.text}========================================");
    for (int i = 0; i < listlogin.length; i++) {
      print("$i========================================");
      if (name.text == listlogin[i]["uName"] &&
          password.text == listlogin[i]["uPass"].toString()) {
        print("if========================================");
        Get.snackbar("succesful", "Regestor ${name.text} done");
        userpassword=int.parse(password.text);
        userName=name.text;
        Get.offAllNamed("/homepage");
        update();
      } else if (i == listlogin.length - 1 &&
          name.text != listlogin[i]["uName"]) {
        Get.snackbar("notFound", "you must have account before regestor");
      }
    }
  }
}
