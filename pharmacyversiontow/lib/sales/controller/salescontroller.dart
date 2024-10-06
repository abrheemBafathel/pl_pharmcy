
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class SalesController extends GetxController {
  final GlobalKey globalKey = GlobalKey();
  final TextEditingController quantaty = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController? salseSreach = TextEditingController();

  String sreach = "";
  double? totalPrice = 0;
  double? unitprice = 0;

  int? salequantity = 0;

  SqlDb sqlDb = SqlDb();

  String? selectedCustomer;
  List<Map> customerNames = [];
  List<Map> SalseSreachList = [];
  List<Map> saleprodect = [];

  @override
  void onInit() {
    readCustomerNmaes();
    readDataSalesWithoutCustomer();

    super.onInit();
  }

  void readDataSalesWithCustomer() async {
    saleprodect = await sqlDb.readData('''
    SELECT  `id`, `medicineID`,`medicineName`,`customerName`,`quantaty`,`UnitePrice`,`totalPrice`, `date`,`countryName`
    FROM medicine,sales,Customer,countries
    WHERE sales.fkmedicineID=medicine.medicineID 
    AND   sales.fkcustomerId=Customer.customerId
    AND medicine.countryMade=countries.countryId

    ''');
    //
    print("list1==========================================================");
    print("$saleprodect");
    update();
  }

// method without customer
  void readDataSalesWithoutCustomer() async {
    saleprodect = await sqlDb.readData('''
    SELECT `id`,`medicineID`,`fkcustomerId`, `medicineName`,`quantaty`,`UnitePrice`,`totalPrice`, `date`,`countryName`
    FROM medicine,sales  ,countries
    WHERE sales.fkmedicineID=medicine.medicineID 
    
    AND medicine.countryMade=countries.countryId
    
    

    ''');
    print("list2==========================================================");
    print("$saleprodect");
    //AND sales.fkcustomerId= null
    update();
  }

  //methoed delete sales
  void deleteDataSales(int index) async {
    int respones = await sqlDb.deleteData('''
     DELETE FROM sales WHERE id="${saleprodect[index]["id"]}"
  
    ''');
    ;
    if (respones > 0) {
      Get.snackbar("seccesful", " delete in sales done");
    } else {
      Get.snackbar("Failed", "Failed delete in sales");
    }
    readDataSalesWithCustomer();
  }

  // update argument
  final TextEditingController updateQuantaty = TextEditingController();
  final TextEditingController updateprice = TextEditingController();
  String? id;
  String? updatemedicineName;
  String? updatetotalPrice;
  String? updatecustomerName;
  String? updatecountryName;
  int? firstSalseQuantity;
  int? correcetSalseQuantity;
  int? finalSalseQuantity;
  String? medicineID;
  //متغيرات يتم استخدامها في دوال لحساب  السعر الكلي
  double? updateTotalPrice = 0;
  double? updateunitprice = 0;
  int? updatesalequantity = 0;

  void getarguments() {
    medicineID = "${Get.arguments["medicineID"]}";
    id = "${Get.arguments["id"]}";
    updatemedicineName = Get.arguments["medicineName"];
    updatecustomerName = Get.arguments["customerName"];
    updatecountryName = Get.arguments["countryName"];
    updatetotalPrice = "${Get.arguments["totalPrice"]}";
    updateQuantaty.text = "${Get.arguments["quantaty"]}";
    updateprice.text = "${Get.arguments["UnitePrice"]}";

    if (updateQuantaty.text != "") {
      firstSalseQuantity = int.parse(updateQuantaty.text);
      print("$firstSalseQuantity");
    }
  }

  // chack quantity
  void chackQuantity() async {
    try{List<Map> StoredQuantity = await sqlDb.readData('''
         SELECT Quantity FROM medicine WHERE medicineID=$medicineID
      ''');
    int? scandQuantity;
    if (updateQuantaty.text != "") {
      scandQuantity = int.parse(updateQuantaty.text);
      print("$firstSalseQuantity");
    }

    if (firstSalseQuantity! > scandQuantity!) {
      correcetSalseQuantity = firstSalseQuantity! - scandQuantity;
      finalSalseQuantity =
          StoredQuantity[0]["Quantity"] + correcetSalseQuantity;
    } else if (firstSalseQuantity! < scandQuantity) {
      correcetSalseQuantity = scandQuantity - firstSalseQuantity!;
      finalSalseQuantity =
          StoredQuantity[0]["Quantity"] - correcetSalseQuantity;
    } else {
      finalSalseQuantity = StoredQuantity[0]["Quantity"];
    }

    if (StoredQuantity[0]["Quantity"] > 0 &&
        StoredQuantity[0]["Quantity"] > scandQuantity) {
      await sqlDb.updateData('''
    UPDATE sales 
    SET quantaty="${updateQuantaty.text}" , UnitePrice="${updateprice.text}",totalPrice="${updatetotalPrice}"
    WHERE id=$id

    ''');

      int response = await sqlDb.updateData('''
         UPDATE medicine SET Quantity="${finalSalseQuantity}"
         WHERE medicineID=$medicineID
      ''');
      if (response > 0) {
        Get.snackbar("Succesful", "update medicin store succesful");
      } else {
        Get.snackbar("Faild", "update medicin store Faild");
      }
    } else {
      Get.snackbar("faild ", "the quntity requred more than stored quntity");
    }
    }catch(error){
      Get.snackbar("Faild", "$error");
    }
  }

  // method update in sales
  void updateSales() async {
    try {
      chackQuantity();

      readDataSalesWithCustomer();
      update();
    } catch (error) {
      Get.snackbar("error", "$error");
    }
  }

  void readCustomerNmaes() async {
    customerNames =
        await sqlDb.readData(''' SELECT customerName FROM Customer''');
    update();
  }

  void valuescustomer(String customerName) {
    selectedCustomer = customerName;
    update();
  }

  void updatSreach(String val) async {
    sreach = val;
    SalseSreachList = await sqlDb.readData('''

            SELECT medicineID, medicineName FROM medicine WHERE medicineName like "%$sreach%"

      ''');
      print("$SalseSreachList   ===== ");

    update();
  }
  List <Map> salseSreachListbybarcod=[] ;
  void updatSreachwithBarCode(String val) async {
     String sreachByBarCode = val;
     if(sreachByBarCode != "" && sreachByBarCode != null ){
       salseSreachListbybarcod = await sqlDb.readData('''

            SELECT medicineID, medicineName FROM medicine WHERE parCodeNum = "$sreachByBarCode"

      ''');
      //print("${salseSreachListbybarcod[0]["medicineName"]}  ====================");
    

     }
    update();
  }

  void addprice(String value) {
    try{if (value != "") {
      unitprice = double.parse(value);
    } else {
      unitprice = 0;
    }

    print("$unitprice");

    creatTotalPrice();}
    catch(error){
      Get.snackbar("Faild", "enter number only \n $error");
    }
  }

  void addquantity(String value) {
   try{ if (value != "") {
      salequantity = int.parse(value);
    } else {
      salequantity = 0;
    }

    print("$salequantity");
    creatTotalPrice();}
    catch(error){
      Get.snackbar("Faild", "enter number only \n $error");
    }
  }

  void creatTotalPrice() {
    totalPrice = unitprice! * salequantity!;

    update();
  }

  void updateUnitePrice(String value) {
    try{if (value != "") {
      updateunitprice = double.parse(value);
    } else {
      updateunitprice = 0;
    }

    print("$updateunitprice");

    creatUpdateTotalPrice();}
    catch(error){
      Get.snackbar("Faild", "enter number only \n $error");
    }
  }

  void updateInputQuantity(String? value) {
    try{if (value != "") {
      updatesalequantity = int.parse(value!);
      print("$updatesalequantity");
    } else {
      updatesalequantity = 0;
    }

    print("$updatesalequantity");
    creatUpdateTotalPrice();
    }catch(error){
      Get.snackbar("Faild", "enter number only \n $error");
    }
  }

  void creatUpdateTotalPrice() {
    updateTotalPrice = updateunitprice! * updatesalequantity!;

    update();
  }

  void setupdateQuantity(int index) async {
    List<Map> customerId = await sqlDb.readData(
        ''' SELECT customerId FROM Customer WHERE customerName = "$selectedCustomer" ''');
    List<Map> salestest = await sqlDb.readData(''' SELECT * FROM sales  ''');
    print(
        "sales:=========================================================================");
    print(" $salestest");

    List<Map> quantatyAll = await sqlDb.readData('''
   SELECT Quantity FROM medicine WHERE medicineID=${SalseSreachList[index]["medicineID"]}
 
   ''');
    int quantatySales = int.parse(quantaty.text);
    int quantatyNew;
    quantatyNew = quantatyAll[0]["Quantity"] - quantatySales;
    int? customerid;
    if (customerId.isNotEmpty) {
      customerid = customerId[0]["customerId"];
    } else {
      customerid = null;
    }

    if (quantatyAll[0]["Quantity"] > 0 &&
        quantatyAll[0]["Quantity"] > quantatySales) {
      int responesUpdatCuantity =
          await sqlDb.updateData('''UPDATE  medicine SET Quantity=$quantatyNew 
                              WHERE medicineID=${SalseSreachList[index]["medicineID"]}''');

      int responesaddsale = await sqlDb.insertData(
          '''INSERT INTO  sales (id, quantaty , UnitePrice , totalPrice, date ,fkcustomerId ,fkmedicineID)
         VALUES( ${Random().nextInt(900000)} , $quantatySales , $unitprice , $totalPrice ,"${DateTime.now().toString().split(" ")[0]}" ,
         ${customerid} , ${SalseSreachList[index]["medicineID"]})
         ''');

      print("$responesaddsale");

      if (responesUpdatCuantity > 0) {
        Get.snackbar("seccesfule", "add salse and  Update Quantity done");
      } else {
        Get.snackbar("Faild", "Failed Update Quantity");
      }
    } else {
      Get.snackbar("faild ", "the quntity requred more than stored quntity");
    }
    readDataSalesWithoutCustomer();

    update();
  }
  void setupdateQuantityByBarcode(int index) async {
    List<Map> customerId = await sqlDb.readData(
        ''' SELECT customerId FROM Customer WHERE customerName = "$selectedCustomer" ''');
    List<Map> salestest = await sqlDb.readData(''' SELECT * FROM sales  ''');
    print(
        "sales:=========================================================================");
    print(" $salestest");

    List<Map> quantatyAll = await sqlDb.readData('''
   SELECT Quantity FROM medicine WHERE medicineID=${salseSreachListbybarcod[index]["medicineID"]}
 
   ''');
    int quantatySales = int.parse(quantaty.text);
    int quantatyNew;
    quantatyNew = quantatyAll[0]["Quantity"] - quantatySales;
    int? customerid;
    if (customerId.isNotEmpty) {
      customerid = customerId[0]["customerId"];
    } else {
      customerid = null;
    }

    if (quantatyAll[0]["Quantity"] > 0 &&
        quantatyAll[0]["Quantity"] > quantatySales) {
      int responesUpdatCuantity =
          await sqlDb.updateData('''UPDATE  medicine SET Quantity=$quantatyNew 
                              WHERE medicineID=${salseSreachListbybarcod[index]["medicineID"]}''');

      int responesaddsale = await sqlDb.insertData(
          '''INSERT INTO  sales (id, quantaty , UnitePrice , totalPrice, date ,fkcustomerId ,fkmedicineID)
         VALUES( ${Random().nextInt(900000)} , $quantatySales , $unitprice , $totalPrice ,"${DateTime.now().toString().split(" ")[0]}" ,
         ${customerid} , ${salseSreachListbybarcod[index]["medicineID"]})
         ''');

      print("$responesaddsale");

      if (responesUpdatCuantity > 0) {
        Get.snackbar("seccesfule", "add salse and  Update Quantity done");
      } else {
        Get.snackbar("Faild", "Failed Update Quantity");
      }
    } else {
      Get.snackbar("faild ", "the quntity requred more than stored quntity");
    }
    readDataSalesWithoutCustomer();

    update();
  }
}
