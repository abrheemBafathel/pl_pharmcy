import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pharmacyversiontow/core/firebase_db.dart';
import 'package:pharmacyversiontow/core/firebase_storge.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/profile.dart';
import 'package:pharmacyversiontow/supplier_firebase/view/screen/view_medicin.dart';

class MainSupplierController extends GetxController {
  final Databasemethods databasemethods = Databasemethods();
  final FirebaseStorgeMothed firebaseStorgeMothed = FirebaseStorgeMothed();
  int selectedIndex = 0;

  List<Widget> getPages = [ViewMedicin(), Profile()];

  void chaingePage(int index) {
    selectedIndex = index;
    update();
  }

  //////////////////////////// add medicin to firebase  //////////////////////////////////////////
  final nameMedicin = TextEditingController();
  final priceMedicin = TextEditingController();
  final quantityMedicin = TextEditingController();
  final medicinDecription = TextEditingController();
  File? file;
  var imagePicker = ImagePicker();
  var pikedImage;

  Future<XFile?> uploadImage(
      var pikeImagee, File? imageFile, ImageSource imagesources) async {
    pikeImagee = await imagePicker.pickImage(source: imagesources);
    debugPrint("$pikeImagee");
    if (pikeImagee != null) {
      pikedImage = File(pikeImagee.path);
      print("==========================================================");
      print("pikeImage.path :${pikeImagee.path}");
      return pikeImagee;
    } else {
      print("chose image please");
    }
    return null;
  }

  void addMedicinToFierbase() async {
    try {
      QuerySnapshot supplierInformation = await getusername();

      List<QueryDocumentSnapshot> supplier = supplierInformation.docs;

      String? supplierName;
      supplier.forEach((element) {
        supplierName = element["username"];
        print("$supplierName");
      });

      String? imageUrl;
      debugPrint("================ 0 =================");
            debugPrint("================ $pikedImage =================");

      if (pikedImage != null) {
        print("=================1======================");
        var saveImageName = basename(pikedImage.path);
        print("=================2======  $saveImageName================");
        imageUrl =
            await firebaseStorgeMothed.addImage(pikedImage!, "images/$saveImageName");
        print("=================3======================");
      }

      databasemethods.addData({
        "medicinName": nameMedicin.text,
        "medicinQuantity": quantityMedicin.text,
        "unitprice": priceMedicin.text,
        "imagUrl": "$imageUrl",
        "medicinDecription": medicinDecription.text,
        "ordernumber": 0,
        "suppliername": supplierName,
        "userId": FirebaseAuth.instance.currentUser!.uid,
      }, "${Random().nextInt(10000000)}", "medicinTable").then((value) {
        Fluttertoast.showToast(
            msg: "medicin infor have been edit successfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      Get.snackbar("SUCSSAFULE", "storde medicin firebase done");

      update();
    } catch (e) {
      Get.defaultDialog(title: "ERROR",middleText: "$e");
    }
  }

  Future<QuerySnapshot> getusername() async {
    return await databasemethods.sreachData(
        "users", "userid", FirebaseAuth.instance.currentUser!.uid);
  }

  ///////////get my medicin///////////////////////
  Future<QuerySnapshot> getMyMedicin() async {
    return await databasemethods.sreachData(
        "medicinTable", "userId", FirebaseAuth.instance.currentUser!.uid);
  }

  ////////////////////////////get fivert medicin/////////////////////////////////////////////////////
  Future<QuerySnapshot> getFivertMedicin() async {
    return await databasemethods.sreachData(
        "favirtTable", "userId", FirebaseAuth.instance.currentUser!.uid);
  }

  /////////////////////////////////////////////////////  delete my medicin   //////////////////////////////
  Future<void> deleteMedicin(String medicinId, String imageUrl) async {
    await databasemethods.deleteRecord("medicinTable", medicinId).then((value) {
      Fluttertoast.showToast(
          msg: "medicin infor have been delete successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  /////////////////////////////////////////////////delete fivert medicin//////////////////////////////////
  Future<void> deleteFivertMedicin(String medicinId, String imageUrl) async {
    await databasemethods.deleteRecord("favirtTable", medicinId).then((value) {
      Fluttertoast.showToast(
          msg: "medicin infor have been delete successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    //await firebaseStorgeMothed.deleteImage(imageUrl);
    update();
  }

  ////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////
  //////////////////////update my medicin//////////////////////////////
  final updateNameMedicin = TextEditingController();
  final updatePriceMedicin = TextEditingController();
  final updateQuantityMedicin = TextEditingController();
  final updateMedicinDecription = TextEditingController();
  String? oldImageUr;
  String? recoredId;
  File? updateFile;
  var updateImagePicker = ImagePicker();
  var updatePikedImage;
  void getAgrument() {
    updateNameMedicin.text = Get.arguments["medicinName"];
    updatePriceMedicin.text = Get.arguments["unitprice"];
    updateQuantityMedicin.text = Get.arguments["medicinQuantity"];
    updateMedicinDecription.text = Get.arguments["medicinDecription"];
    oldImageUr = Get.arguments["imagUrl"];
    recoredId = Get.arguments["recoredId"];
  }

  Future<void> updateMedicin() async {
    String? imageUrl;

    if (updateFile == null) {
      await databasemethods.updateRecord("medicinTable", recoredId!, {
        "medicinName": updateNameMedicin.text,
        "unitprice": updatePriceMedicin.text,
        "medicinQuantity": updateQuantityMedicin.text,
        "medicinDecription": updateMedicinDecription.text,
      }).then((value) {
        Fluttertoast.showToast(
            msg: "medicin infor have been edit successfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } else {
      var saveImageName = basename(updatePikedImage.path);
      imageUrl =
          await firebaseStorgeMothed.addImage(file!, "images/$saveImageName");

      await databasemethods.updateRecord("medicinTable", recoredId!, {
        "medicinName": updateNameMedicin.text,
        "unitprice": updatePriceMedicin.text,
        "medicinQuantity": updateQuantityMedicin.text,
        "medicinDecription": updateMedicinDecription.text,
        "imagUrl": imageUrl,
      }).then((value) {
        Fluttertoast.showToast(
            msg: "medicin infor have been edit successfully ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });

      firebaseStorgeMothed.deleteImage(oldImageUr!);
    }
    update();
  }

  /////////////////     get data from firebase      //////////////////
  Future<QuerySnapshot>? listMedicin;
  //StreamBuilder<QuerySnapshot>? listMedicin;
  List<QueryDocumentSnapshot>? listDocs;
  Future<QuerySnapshot<Map<String, dynamic>>> getDataFirebase() async {
    print("==================== 2 ==================================");
    return await databasemethods.getMedicinData("medicinTable");
  }

  ///////////////////////////////////////////////  favirt screen  ///////////////////////////////////
  addToFavirt(
      String favirtMedicinName,
      String favirtMedicinQuantity,
      String favirtMedicinPrice,
      String favirtImageUrl,
      String favirtMedicinDecription,
      String favirtSupplierName,
      int favirtOrderNumber,
      String ownerId) {
    databasemethods.addData({
      "medicinName": favirtMedicinName,
      "medicinQuantity": favirtMedicinQuantity,
      "unitprice": favirtMedicinPrice,
      "imagUrl": favirtImageUrl,
      "medicinDecription": favirtMedicinDecription,
      "ordernumber": favirtOrderNumber,
      "suppliername": favirtSupplierName,
      "ownerId": ownerId,
      "userId": FirebaseAuth.instance.currentUser!.uid,
    }, "${Random().nextInt(10000000)}", "favirtTable").then((value) {
      Fluttertoast.showToast(
          msg: "medicin infor have been edit successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////// MEDICIN ORDER /////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  addMedicinOrder(
    String orderMedicinName,
    
    String orderMedicinPrice,
  
    String ownerId,
  ) async {
    QuerySnapshot customersInformation = await getusername();

    List<QueryDocumentSnapshot> customers = customersInformation.docs;

    String? customerName;
    customers.forEach((element) {
      customerName = element["username"];
      print("$customerName");
    });

   

    databasemethods.addData({
      "medicinName": orderMedicinName,
      "medicinQuantity": validQantity.text,
      "unitprice": orderMedicinPrice,
      "ordernumber": Random().nextInt(5000000),
      "ownerId": ownerId,
      "customerId": FirebaseAuth.instance.currentUser!.uid,
      "customerName": customerName,
       "orderType": "Not processed",
    }, "${Random().nextInt(10000000)}", "ordersTable").then((value) {
      Fluttertoast.showToast(
          msg: "medicin infor have been edit successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });

    update();
  }
   ////////////////////////////// valid Quantity  ///////////////////////////
   TextEditingController validQantity = TextEditingController();
   String? isQuantityValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9a-z@#$&_]{1,12}$)').hasMatch(value)) {
      return 'the password can be only\n numbers and letters and @#\$&';
    }

    return null;
  }

  TextEditingController validNumber = TextEditingController();
   String? isPhoneNumberValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9]{1,12}$)').hasMatch(value)) {
      return 'the phone number can be only numbers ';
    }

    return null;
  }

   TextEditingController validAddress = TextEditingController();
   String? isAddressValide(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'(^(?:[+0]9)?[0-9a-zA-Z/]{1,12}$)').hasMatch(value)) {
      return 'the phone number can be only numbers ';
    }

    return null;
  }


  //////////////////////  get medicin orders //////////////////////////
  Future<QuerySnapshot> getOrdersMedicin() async {
    return await databasemethods.sreachData(
        "ordersTable", "ownerId", FirebaseAuth.instance.currentUser!.uid);
  }

  /////////////////////////////  delete order medicin

    Future<void> deleteOrderMedicin(String orderId,{ String? imageUrl}) async {
    await databasemethods.deleteRecord("ordersTable", orderId).then((value) {
      Fluttertoast.showToast(
          msg: "order infor have been delete successfully ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    //await firebaseStorgeMothed.deleteImage(imageUrl);
    update();
  }
}
