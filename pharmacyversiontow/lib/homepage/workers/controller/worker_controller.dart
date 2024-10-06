import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/firebase_db.dart';
import 'package:pharmacyversiontow/core/services/services.dart';

class WorkerController extends GetxController {
  Databasemethods databasemethods = Databasemethods();
  MyServices myServices = Get.find();
  Future<QuerySnapshot<Map<String, dynamic>>>? searching() async {
    debugPrint("===================== current usr===================");
    debugPrint(FirebaseAuth.instance.currentUser!.uid);
    return await databasemethods.sreachWorker(
        "users",
        "Workin",
        "${myServices.sharedPreferences!.getString("PharmacyName")}",
        "useremail",
        "${myServices.sharedPreferences!.getString("userEmail")}"
       );
  }

  updateActiviting(String userId, int activite, String note) async {
    await databasemethods
        .updateRecord("users", userId, {"activite": activite}).then((value) {
      Fluttertoast.showToast(
          msg: note, //"user have been activite successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    update();
  }
}
