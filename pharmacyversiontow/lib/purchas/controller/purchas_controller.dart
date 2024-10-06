import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class PurchasController extends GetxController {
  SqlDb sqldb = SqlDb();
  MyServices myServices=Get.find();
//حقول الضافه
  final TextEditingController medciname = TextEditingController();
  final TextEditingController quantIty = TextEditingController();
  final TextEditingController medicineGroup = TextEditingController();
  final TextEditingController medicineCompany = TextEditingController();
  final TextEditingController prIce = TextEditingController();
  final TextEditingController dateOFProduction = TextEditingController();
  final TextEditingController dateOfExt = TextEditingController();
  final TextEditingController numberOfFatora = TextEditingController();
  final TextEditingController suppelname = TextEditingController();
  final TextEditingController row = TextEditingController();
  final TextEditingController column = TextEditingController();
   String? barcodescn;

  //حقول التعديل
  final TextEditingController updatemedciname = TextEditingController();
  final TextEditingController updatequantIty = TextEditingController();
  final TextEditingController updatemedicineGroup = TextEditingController();
  final TextEditingController updatemedicineCompany = TextEditingController();
  final TextEditingController updateprIce = TextEditingController();
  final TextEditingController updatedateOFProduction = TextEditingController();
  final TextEditingController updatedateOfExt = TextEditingController();
  final TextEditingController updatenumberOfFatora = TextEditingController();
  final TextEditingController updatesuppelname = TextEditingController();
  final TextEditingController updaterow = TextEditingController();
  final TextEditingController updatecolumn = TextEditingController();
  DateTime? dateOfBuyd;

  int? updateMadicineID;
  String? supplierID;

  String? selectedcountry;
  List<Map> countryList = [];
  List<Map> supplierlist = [];
  String? selectedSupplier;

  List<Map> purchasprodect = [];

  scanbCode()async{ String scandCode;
   try{ 
    scandCode= await FlutterBarcodeScanner.scanBarcode("", "تم", false, ScanMode.DEFAULT);
    debugPrint(scandCode);}
    on PlatformException{
      scandCode= 'failed to get platform version.';
    }
  // if(!mounted){return null;};
  debugPrint("==========  $scandCode =======");
  barcodescn=scandCode;}

  void cleantextController() {
    medciname.clear();
    quantIty.clear();
    medicineGroup.clear();
    medicineCompany.clear();
    prIce.clear();
    dateOFProduction.clear();
    dateOfExt.clear();
    numberOfFatora.clear();
    suppelname.clear();
    row.clear();
    column.clear();

    updatemedciname.clear();
    updatequantIty.clear();
    updatemedicineGroup.clear();
    updatemedicineCompany.clear();
    updateprIce.clear();
    updatedateOFProduction.clear();
    updatedateOfExt.clear();
    updatenumberOfFatora.clear();
    updatesuppelname.clear();
    updaterow.clear();
    updatecolumn.clear();
  }

  void gremant() {
    updatemedciname.text = Get.arguments["medicineName"];
    updatequantIty.text = Get.arguments["Quantity"];
    updatemedicineGroup.text = Get.arguments["GroubNumber"];
    updatemedicineCompany.text = Get.arguments["companyname"];
    updateprIce.text = Get.arguments["price"];
    updatedateOFProduction.text = Get.arguments["dateOFProduction"];
    updatedateOfExt.text = Get.arguments["expriyDate"];
    updaterow.text = Get.arguments["row"];
    updatecolumn.text = Get.arguments["column"];
    //updatenumberOfFatora.text=Get.arguments[""];
    selectedcountry = Get.arguments["countryName"];
    selectedSupplier = Get.arguments["supName"];
    supplierID= Get.arguments["supplierID"];

    updateMadicineID = int.parse(Get.arguments["ID"]);
    debugPrint("${Get.arguments["ID"]}");
  }

  Future<List<Map>> getSupplierId(String name)async{
      List<Map> supplier = await sqldb.readData('''

 SELECT supID 
 FROM suppliers
 WHERE supName="$name"
 
 ''');
 return supplier;

  }
  Future<List<Map>> getCountryId(String name)async{
     List<Map> country = await sqldb.readData('''

SELECT  countryId 
FROM    countries
WHERE   countryName= "$selectedcountry"

''');
return country;
  }

  void updatePurchas() async {
    debugPrint("$updateMadicineID");
    List<Map> suplierid= await getSupplierId(selectedSupplier!);
     List<Map> countryid=await getCountryId(selectedcountry!);
     
    int? response = await sqldb.updateData('''
  
     UPDATE medicine 
     SET medicineName="${updatemedciname.text}",
     Quantity="${updatequantIty.text}",
     GroubNumber=${updatemedicineGroup.text},
     companyName="${updatemedicineCompany.text}",
     price=${updateprIce.text},
     supplierID=${suplierid[0]["supID"]},
     countryMade=${countryid[0]["countryId"]},
     dateOFProduction="${updatedateOFProduction.text}",
     expriyDate="${updatedateOfExt.text}"

     WHERE medicineID=$updateMadicineID
    
    ''');

   
    debugPrint(" ${updatesuppelname.text}");
    Get.back();
    readMedicin();
    debugPrint("$response");
    cleantextController();

    update();
  }

  delet(int index) async {
    int respones = await sqldb.deleteData('''
    
    DELETE FROM  medicine
    WHERE medicineID=${purchasprodect[index]["medicineID"]}
    
    ''');
    if (respones > 0) {
      Get.snackbar("siccesful ", "Deleted done");
    } else {
      Get.snackbar("Failed ", "Delete Failed");
    }
    readMedicin();
    update();
  }

  @override
  void onInit() {
    readcountries();
    readsupplier();
    readMedicin();
    super.onInit();
  }

// داله تاريخ انتها المنتج
  Future<void> selectedExpireDate(
      BuildContext ctx, TextEditingController date) async {
    DateTime? picked = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      date.text = picked.toString().split(" ")[0];
    }
    debugPrint("$picked");
    update();
  }

  // داله تحديد تاريخ انتاج الدواء
  Future<void> selectedMadeDate(
      BuildContext ctx, TextEditingController date) async {
    DateTime? picked = await showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      date.text = picked.toString().split(" ")[0];
    }
    debugPrint("$picked");
    update();
  }

  Future<void> readcountries() async {
    countryList = await sqldb.readData('''
      SELECT * FROM countries
          
      ''');
    update();
  }

  Future<void> readsupplier() async {
    supplierlist = await sqldb.readData('''

    SELECT * FROM  suppliers
   
 
  ''');
    update();
  }

  void setdrobdownvalue() async {
    await readsupplier();
    await readcountries();
    if (supplierlist.isNotEmpty && countryList.isNotEmpty) {
      if (selectedSupplier == null && selectedcountry == null) {
        selectedSupplier = supplierlist[0]["supName"].toString();
        selectedcountry = countryList[0]["countryName"];
      }
    }
  }

  void valuessupplier(String val) {
    selectedSupplier = val;
    update();
  }

  void valuescountry(String val) {
    selectedcountry = val;
    update();
  }

  void addMedicin() async {
   try {
    debugPrint("=============== 1 ================");
    String? userName = myServices.sharedPreferences!.getString("userName");
    int randommMedicinNumber= Random().nextInt(90000000);
    int randommMedicinLocationNumber= Random().nextInt(90000000);
    int randommPurchasNumber= Random().nextInt(90000000);
    
    debugPrint("=============== 2 ================");
    debugPrint("$userName");
    dateOfBuyd = DateTime.now();
  
    List<Map> userId = await sqldb.readData('''

SELECT  uId 
FROM    users
WHERE   uName= "$userName"

''');

  
    List<Map> suplierid= await getSupplierId(selectedSupplier!);
    List<Map> countryid=await getCountryId(selectedcountry!);

    int? responesAddMedicin = await sqldb.insertData('''

  INSERT INTO medicine(medicineID,medicineName,GroubNumber,Quantity,price,dateOFProduction,
                        dateOFBuy,expriyDate,parCodeNum,companyName,supplierID,userId,countryMade )
              VALUES( $randommMedicinNumber , "${medciname.text}",${medicineGroup.text},${quantIty.text},${prIce.text},"${dateOFProduction.text}",
                     "${dateOfBuyd.toString().split(" ")[0]}","${dateOfExt.text}",$barcodescn,"${medicineCompany.text}",${suplierid[0]["supID"]} ,
                       ${userId[0]["uId"]}, ${countryid[0]["countryId"]} )          

''');

    if (responesAddMedicin! > 0) {
      int? responesAddMedicinloction = await sqldb.insertData('''

  INSERT INTO medicinLocation(posID, fkmedicineID ,row , column )
              VALUES($randommMedicinLocationNumber , $randommMedicinNumber, ${row.text}, ${column.text} )          

''');

int? responesPurchas = await sqldb.insertData('''

  INSERT INTO purchase(ID, Quantity ,price , supplierId,medicineID )
              VALUES($randommPurchasNumber ,  ${quantIty.text} ,${prIce.text} , ${suplierid[0]["supID"]} , $randommMedicinNumber )          

''');

      debugPrint(" $responesAddMedicinloction, $responesPurchas");
    }

    debugPrint("$responesAddMedicin");
    await readMedicin();

    update();
    cleantextController();
    Get.back();}catch(e){
      Get.defaultDialog(title: "ERROR", middleText: "$e",onCancel:(){} );
    }
  }

  Future<void> readMedicin() async {
    debugPrint("readMedicin");
    purchasprodect = await sqldb.readData('''
 
     SELECT medicineID, medicineName,companyName,GroubNumber, parCodeNum , Quantity , price , dateOFProduction, dateOFBuy ,expriyDate,
          column, row,supplierID, supName , uName, countryName 
     FROM medicine ,suppliers , users, countries ,medicinLocation
     WHERE medicine.supplierID= suppliers.supID and medicine.userId= users.uId and medicine.countryMade= countries.countryId
             and medicine.medicineID = medicinLocation.fkmedicineID
 
  ''');
    debugPrint("$purchasprodect");
    update();
  }
}
