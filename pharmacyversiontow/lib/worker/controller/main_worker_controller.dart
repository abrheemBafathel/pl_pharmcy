import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/firebase_db.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/homepage/view/screens/sellpage.dart';

class MainWorkerController extends GetxController {
    final MyServices myServices = Get.find();

  int selectedPage = 0;
  Databasemethods firebaseDb = Get.put(Databasemethods());
  var usersIforma;
  int userinfomation =0;
  List<Widget> mainWorkerList = [
    SellPage(),
    Center(child: Text("qr_code")),
  ];

  @override
  void onInit() {
    checkActivateAccunte();
    super.onInit();
  }

  void changeMainWorkerPage(int i) {
    selectedPage = i;
    update();
  }

  gobacke(){
    Get.offAllNamed("/CreateSupplierAccount");
    
  }

  checkActivateAccunte() async {
    List l=[];
    print("================= 1 =====================");
   if(FirebaseAuth.instance.currentUser !=null){
     usersIforma = await firebaseDb.sreachData(
        "users", "useremail", FirebaseAuth.instance.currentUser!.email);
          print("================= ${usersIforma.docs} ====================");
    print("====================i==============");
    for (var i in usersIforma!.docs) {
      print("========== $i ====================");
      l.addAll([i.data()]);
            print("========== $l ====================");

      
       myServices.sharedPreferences!.setString("activate", "${i["activite"]}");
      print("=================== 2 ===================");
    }
    if(myServices.sharedPreferences!.getString("activate")=="1"){
      if(myServices.sharedPreferences!.getString("userType")=='worker'){
         Get.offAllNamed("/MainWorker");

      }
     
    }

    print(userinfomation);
    print("=================== 3 ===================");
    Get.defaultDialog(title: "error",middleText: "${myServices.sharedPreferences!.getString("activate")}",onCancel: () {},);
   }
   
  
    update();
  }
}
