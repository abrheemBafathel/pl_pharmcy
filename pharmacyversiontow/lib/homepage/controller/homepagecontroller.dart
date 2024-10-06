import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pharmacyversiontow/homepage/view/screens/buypage.dart';
import 'package:pharmacyversiontow/homepage/view/screens/homemain.dart';
import 'package:pharmacyversiontow/homepage/view/screens/sellpage.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';
import 'package:pharmacyversiontow/sales/view/screen/barcode_salse.dart';

class HomePageController extends GetxController{
    static  var itemswlected =0;
    String? finalScandCode;
    SalesController salesController = Get.put(SalesController());

    final List<Widget> navigtionpage = [
    HomeMain(),
     Buypage(),
    SellPage(),
    BarcodeSalse()
        

   
  ];
      void funselectedicrem(int a)async{
        itemswlected=a;
        if(itemswlected==3){
         await  barcodeScanee();
        }
        update();
      }

      singout() async{
        await FirebaseAuth.instance.signOut();

      }

  Future<void> barcodeScanee()async{
    String scandCode;
   try{ 
    scandCode= await FlutterBarcodeScanner.scanBarcode("", "تم", true, ScanMode.DEFAULT);
    debugPrint(scandCode);}
    on PlatformException{
      scandCode= 'failed to get platform version.';
    }
  // if(!mounted){return null;};
  finalScandCode=scandCode;
  if(scandCode.isEmpty ){
    salesController.updatSreachwithBarCode(finalScandCode!);

  }
  

  }    

}