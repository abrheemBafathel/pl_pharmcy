import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pharmacyversiontow/core/firebase_db.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';
class SupplierLoginFirebaseController extends GetxController {
  final Databasemethods firebaseDb = Databasemethods();
  final GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> regestarGlobalKey = GlobalKey<FormState>();
  final MyServices myServices = Get.find();
  final SqlDb sqlDb = SqlDb();
  String? selectedUserType;
  String? selectedPharmacey;
  bool isPharmacise = false;
  bool isWorker = false;
  bool isSupplier = false;

  UserCredential? userCredential;

  /////////////////////////////////// regester user mothed ////////////////////////////
  final TextEditingController regesterUserEmail = TextEditingController();
  final TextEditingController regesterUserPassword = TextEditingController();

  String? isUserNameRegesterValide(String? value) {
    if (value!.isEmpty ||
        /* !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;*/
        !RegExp(r'(^(?:[+0]9)?[a-z" "A-Z]{1,50}$)').hasMatch(value)) {
      return 'Name can only letters ';
    }

    return null;
  }

  String? isUserPassworRegesterValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9a-z@#$&_]{1,12}$)').hasMatch(value)) {
      return 'the password can be only\n numbers and letters and @#\$&';
    }
    return null;
  }

  void goToCreatUserAcount() {
    Get.offNamed("/CreateSupplierAccount");
  }

  void insertData(String userNam, String pass) async {
    int randomUserId = Random().nextInt(10000000);
    int response = await sqlDb.insertData('''
   INSERT INTO users(uId,uName,uPass) VALUES($randomUserId,"$userNam","$pass")

    ''');
    if (response > 0) {
      Get.snackbar("Succesful", "create account $userNam done");
    } else {
      Get.snackbar("Failed", "create account $userNam failed");
    }
    update();
  }

  getusers() async {
    QuerySnapshot<Map<String, dynamic>> usersAaccount =
        await firebaseDb.getMedicinData("users");
    if (usersAaccount.size > 0) {
      final List<QueryDocumentSnapshot> data = usersAaccount.docs;
      for (QueryDocumentSnapshot i in data) {
        if (i["useremail"] == regesterUserEmail.text &&
            i["usertype"] == "worker") {
          print("==================================");
          myServices.sharedPreferences!
              .setString("userType", "${i["usertype"]}");
          myServices.sharedPreferences!
              .setString("userName", "${i["username"]}");
          myServices.sharedPreferences!
              .setString("userEmail", "${i["useremail"]}");
          myServices.sharedPreferences!
              .setString("userpassword", "${i["userpassword"]}");
          myServices.sharedPreferences!
              .setString("PharmacyName", "${i["Workin"]}");
          insertData(i["username"], i["userpassword"]);
          Get.offAllNamed("/MainWorker");
        }
        if (i["useremail"] == regesterUserEmail.text &&
            i["usertype"] == "pharmacise") {
          print("==================================");
          myServices.sharedPreferences!
              .setString("userType", "${i["usertype"]}");
          myServices.sharedPreferences!
              .setString("userName", "${i["username"]}");
          myServices.sharedPreferences!
              .setString("userEmail", "${i["useremail"]}");
          myServices.sharedPreferences!
              .setString("userpassword", "${i["userpassword"]}");
          myServices.sharedPreferences!
              .setString("PharmacyName", "${i["Workin"]}");
          insertData(i["username"], i["userpassword"]);
          Get.offAllNamed("/homepage");
        }
        if (i["useremail"] == regesterUserEmail.text &&
            i["usertype"] == "supplier") {
          print("==================================");
          myServices.sharedPreferences!
              .setString("userType", "${i["usertype"]}");
          myServices.sharedPreferences!
              .setString("userName", "${i["username"]}");
          myServices.sharedPreferences!
              .setString("userEmail", "${i["useremail"]}");
          myServices.sharedPreferences!
              .setString("userpassword", "${i["userpassword"]}");
          myServices.sharedPreferences!
              .setString("PharmacyName", "${i["Workin"]}");

          Get.offAllNamed("/MainSupplier");
        }
      }
    }
  }

  void regesterSupplierUser() async {
    try {
      if (regestarGlobalKey.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: regesterUserEmail.text,
          password: regesterUserPassword.text,
        );

        print("===================================================");
        print("valid user : $userCredential");

        getusers();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: "ERROR",
          middleText: "user not found",
          onCancel: () {},
        );
        print("user not found");
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: "ERROR",
          middleText: "wrong password",
          onCancel: () {},
        );
        print("wrong password");
      }
    } catch (e) {
      Get.defaultDialog(
        title: "ERROR",
        middleText: "$e",
        onCancel: () {},
      );
      print(" ERROR : $e");
    }
  }

  //////////////////////////////////  create new user mothed  ////////////////////////////////////
  final TextEditingController userName = TextEditingController();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  final TextEditingController userPharmacy = TextEditingController();

  String? isUserNameValide(String? value) {
    if (value!.isEmpty ||
        /* !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;*/
        !RegExp(r'(^(?:[+0]9)?[a-z" "A-Z]{1,50}$)').hasMatch(value)) {
      return 'Name can only letters ';
    }

    return null;
  }

  String? isUserPharmacyValide(String? value) {
    if (value!.isEmpty ||
        /* !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;*/
        !RegExp(r'(^(?:[+0]9)?[a-z" "A-Z]{1,50}$)').hasMatch(value)) {
      return 'Name can only letters ';
    }

    return null;
  }

  String? isUserEmailValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return 'Enter a valid email!';
    }
    return null;
  }

  String? isUserPassworValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9a-z@#$&_]{1,12}$)').hasMatch(value)) {
      return 'the password can be only\n numbers and letters and @#\$&';
    }

    return null;
  }

  void createSupplierUser() async {
    try {
      if (loginGlobalKey.currentState!.validate()) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userEmail.text, password: userPassword.text

                /// "22223333kkkk",
                );
        print("===================================================");
        /* firebaseDb.addData({
          "username": userName.text,
          "useremail": userEmail.text,
          "userpassword": userPassword.text,
          "usertype": userPharmacy.text,
          "activite": userPharmacy.text,
          "Workin": userPharmacy.text,
        }, "${Random().nextInt(1000000)}", "users");
        print("valid user  : $userCredential");*/

        if (isPharmacise) {
          firebaseDb.addData({
            "userid": FirebaseAuth.instance.currentUser!.uid,
            "username": userName.text,
            "useremail": userEmail.text,
            "userpassword": userPassword.text,
            "usertype": "pharmacise",
            "activite": 1,
            "Workin": userPharmacy.text,
          }, "${Random().nextInt(1000000)}", "users");
          firebaseDb.addData({
            "pharmacyname": userPharmacy.text,
            "pharmacyowneremail": userEmail.text,
            "Workres": {},
          }, "${Random().nextInt(1000000)}", "pharmaces");
          myServices.sharedPreferences!.setString("userType", "pharmacise");
          myServices.sharedPreferences!.setString("userName", userName.text);
          myServices.sharedPreferences!.setString("userEmail", userEmail.text);
          myServices.sharedPreferences!
              .setString("PharmacyName", userPharmacy.text);
          print(
              "${myServices.sharedPreferences!.setString("PharmacyName", userPharmacy.text)}");
          myServices.sharedPreferences!
              .setString("userpassword", userPassword.text);
          insertData(userName.text, userPassword.text);

          Get.offAllNamed("/homepage");
        } else if (isWorker) {
          firebaseDb.addData({
            "username": userName.text,
            "useremail": userEmail.text,
            "userpassword": userPassword.text,
            "userid":FirebaseAuth.instance.currentUser!.uid,
            "usertype": "worker",
            "activite": 0,
            "Workin": selectedPharmacey,
          }, "${Random().nextInt(1000000)}", "users");
          myServices.sharedPreferences!.setString("userType", "worker");
          myServices.sharedPreferences!.setString("userName", userName.text);
          myServices.sharedPreferences!.setString("userEmail", userEmail.text);
          myServices.sharedPreferences!
              .setString("PharmacyName", selectedPharmacey!);
          myServices.sharedPreferences!
              .setString("userpassword", userPassword.text);
          insertData(userName.text, userPassword.text);

          Get.offNamed("/ActivateWorkerAccuntePage");

          // Get.offAllNamed("/MainWorker");
        } else if (isSupplier) {
          firebaseDb.addData({
            "username": userName.text,
            "useremail": userEmail.text,
            "userpassword": userPassword.text,
            "usertype": "supplier",
            "userid":FirebaseAuth.instance.currentUser!.uid,
            "activite": 1,
            "Workin": userPharmacy.text,
          }, "${Random().nextInt(1000000)}", "users");
          myServices.sharedPreferences!.setString("userType", "supplier");
          myServices.sharedPreferences!.setString("userName", userName.text);
          myServices.sharedPreferences!.setString("userEmail", userEmail.text);
          myServices.sharedPreferences!
              .setString("userpassword", userPassword.text);
          insertData(userName.text, userPassword.text);

          Get.offNamed("/MainSupplier");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-passowrd') {
        print("weak password");
      } else if (e.code == 'email-already-in-use') {
        print("email already exists");
        Get.defaultDialog(
            title: "ERROR",
            middleText: "email already exists",
            onCancel: () {});
      }
    } catch (e) {
      print(" ERROR : $e");
      Get.defaultDialog(
        title: "ERROR",
        middleText: "$e",
        onCancel: () {},
      );
    }
  }

  void goToRegestr() {
    Get.offNamed("/supplierloginview");
  }

  void chanSelectedUserType({String? value}) async {
    selectedUserType = value;
//'Supplier', 'Pharmacist', 'worker'
    if (selectedUserType == 'Pharmacist') {
      isPharmacise = true;
      isWorker = false;
      isSupplier = false;
    } else if (selectedUserType == 'worker') {
      await getpharmaciesNames();
      isPharmacise = false;
      isWorker = true;
      isSupplier = false;
    } else if (selectedUserType == 'Supplier') {
      isPharmacise = false;
      isWorker = false;
      isSupplier = true;
    }
    update();
  }

  void chaneSelectedPharmacy({String? value}) {
    selectedPharmacey = value;
    update();
  }

  QuerySnapshot? pharmacesNames;
  List listPharmciesName = [];

  getpharmaciesNames() async {
    print("================= 1 =====================");
    pharmacesNames = await firebaseDb.getMedicinData("pharmaces");
    for (var i in pharmacesNames!.docs) {
      listPharmciesName.addAll(["${i["pharmacyname"]}"]);
      print("=================== 2 ===================");
    }

    print(listPharmciesName);
    print("=================== 3 ===================");
  }
}
