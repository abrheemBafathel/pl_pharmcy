import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/firebase_db.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class BackupController extends GetxController {
  SqlDb sqlDb = SqlDb();
  MyServices myServices = Get.find();
  Databasemethods firebasefirestoreMotheds = Databasemethods();

  Future<List<Map<String, dynamic>>?> getAcounts() async {
    List<Map<String, dynamic>>? accountsList;
    accountsList = await sqlDb.readData("SELECT * FROM Accounts");
    return accountsList;
  }

  Future<List<Map<String, dynamic>>?> getCustomer() async {
    List<Map<String, dynamic>>? customerList;
    customerList = await sqlDb.readData("SELECT * FROM Customer");
    return customerList;
  }

  Future<List<Map<String, dynamic>>?> getCountries() async {
    List<Map<String, dynamic>>? countriessList;
    countriessList = await sqlDb.readData("SELECT * FROM countries");
    return countriessList;
  }

  Future<List<Map<String, dynamic>>?> getSuppliers() async {
    List<Map<String, dynamic>>? suppliersList;
    suppliersList = await sqlDb.readData("SELECT * FROM suppliers");
    return suppliersList;
  }

  Future<List<Map<String, dynamic>>?> getMedicine() async {
    List<Map<String, dynamic>>? medicineList;
    medicineList = await sqlDb.readData("SELECT * FROM medicine");
    return medicineList;
  }

  Future<List<Map<String, dynamic>>?> getMedicinLocation() async {
    List<Map<String, dynamic>>? medicinLocationList;
    medicinLocationList = await sqlDb.readData("SELECT * FROM medicinLocation");
    return medicinLocationList;
  }

  Future<List<Map<String, dynamic>>?> getPurchase() async {
    List<Map<String, dynamic>>? purchaseList;
    purchaseList = await sqlDb.readData("SELECT * FROM purchase");
    return purchaseList;
  }

  Future<List<Map<String, dynamic>>?> getSales() async {
    List<Map<String, dynamic>>? salesList;
    salesList = await sqlDb.readData("SELECT * FROM sales");
    return salesList;
  }

  Future<List<Map<String, dynamic>>?> getUsers() async {
    List<Map<String, dynamic>>? usersList;
    usersList = await sqlDb.readData("SELECT * FROM users");
    return usersList;
  }

  Future<String?> getpharmacyName() async {
    debugPrint("${myServices.sharedPreferences!.getString("PharmacyName")}");
    var pharmacyInfo;
    var pharmacyId;
    pharmacyInfo = await firebasefirestoreMotheds.sreachData(
        "pharmaces",
        "pharmacyname",
        myServices.sharedPreferences!.getString("PharmacyName"));
    var pharmacydocs = pharmacyInfo.docs;
    for (var i in pharmacydocs) {
      debugPrint("${i.id}");
      pharmacyId = i.id;
    }

    return pharmacyId;
  }

  makeBackup() async {
    try {
      Get.defaultDialog(
          title: "Wait please intel process finesh",
          content: const Column(
            children: [
              CircularProgressIndicator(),
            ],
          ),
          onCancel: () {
            Get.back();
            Get.snackbar("canceled", "process faild");
          });

      List<Map<String, dynamic>>? accountsList = await getAcounts();
      List<Map<String, dynamic>>? customerList = await getCustomer();
      List<Map<String, dynamic>>? countriessList = await getCountries();
      List<Map<String, dynamic>>? suppliersList = await getSuppliers();
      List<Map<String, dynamic>>? medicineList = await getMedicine();
      List<Map<String, dynamic>>? medicinLocationList =
          await getMedicinLocation();
      List<Map<String, dynamic>>? purchaseList = await getPurchase();
      List<Map<String, dynamic>>? salesList = await getSales();
      List<Map<String, dynamic>>? usersList = await getUsers();
      String? pharmacyId = await getpharmacyName();

      for (Map<String, dynamic> i in accountsList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "Accounts", "${i["AccNom"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in customerList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "Customer", "${i["customerId"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in countriessList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "countries", "${i["countryId"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in suppliersList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "suppliers", "${i["supID"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in medicineList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "medicine", "${i["medicineID"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in medicinLocationList!) {
        firebasefirestoreMotheds
            .addBackUpData(i, "$pharmacyId", "pharmaces", "medicinLocation",
                "${i["posID"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in purchaseList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "purchase", "${i["ID"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in salesList!) {
        firebasefirestoreMotheds
            .addBackUpData(i, "$pharmacyId", "pharmaces", "sales", "${i["id"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      for (Map<String, dynamic> i in usersList!) {
        firebasefirestoreMotheds
            .addBackUpData(
                i, "$pharmacyId", "pharmaces", "users", "${i["uId"]}")
            .then((value) {
          debugPrint("==============================");

          debugPrint("seccefual");
        });
      }
      Get.back();
    } catch (e) {
      Get.defaultDialog(
        title: "ERROR",
        middleText: "$e",
        onCancel: () {},
      );
    }
  }

  /////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////// restore backup /////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  // for(var i in accountsdocs) {print("${i.data()}");}
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudAcounts() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudAcount =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "Accounts", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> accountsdocs =
        cloudAcount.docs;

    return accountsdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudCustomer() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudCustomer =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "Customer", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> customerdocs =
        cloudCustomer.docs;

    return customerdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudCountries() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? countriesAcount =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "countries", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> countriesdocs =
        countriesAcount.docs;

    return countriesdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudSuppliers() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudsuppliers =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "suppliers", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> suppliersdocs =
        cloudsuppliers.docs;

    return suppliersdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudMedicine() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudMedicine =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "medicine", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> medicinedocs =
        cloudMedicine.docs;

    return medicinedocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudMedicinLocation() async {
    String? pharmacyId = await getpharmacyName();
    QuerySnapshot<Map<String, dynamic>>? cloudmedicinLocation =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "medicinLocation", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> medicinLocationdocs =
        cloudmedicinLocation.docs;

    return medicinLocationdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudPurchase() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudpurchase =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "purchase", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> purchasedocs =
        cloudpurchase.docs;

    return purchasedocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudSales() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudsales =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "sales", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> salesdocs =
        cloudsales.docs;

    return salesdocs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCloudUsers() async {
    String? pharmacyId = await getpharmacyName();

    QuerySnapshot<Map<String, dynamic>>? cloudusers =
        await firebasefirestoreMotheds.getBackUpData(
            "pharmaces", "users", "$pharmacyId");
    List<QueryDocumentSnapshot<Map<String, dynamic>>> usersdocs =
        cloudusers.docs;

    return usersdocs;
  }

  restorBackup() async {
    try {
      Get.defaultDialog(
          title: "Wait please intel process finesh",
          content: const Column(
            children: [
              CircularProgressIndicator(),
            ],
          ),
          onCancel: () {
            Get.snackbar("canceled", "process faild");
            
          });
      debugPrint("============== 1 ==========================");

      List<QueryDocumentSnapshot<Map<String, dynamic>>> accountsList =
          await getCloudAcounts();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> customerList =
          await getCloudCustomer();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> countriessList =
          await getCloudCountries();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> suppliersList =
          await getCloudSuppliers();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> medicineList =
          await getCloudMedicine();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> medicinLocationList =
          await getCloudMedicinLocation();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> purchaseList =
          await getCloudPurchase();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> salesList =
          await getCloudSales();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> usersList =
          await getCloudUsers();

      ////////////////////////////////////
      List<Map<String, dynamic>>? sqflitaccountsList = await getAcounts();
      List<Map<String, dynamic>>? sqflitcustomerList = await getCustomer();
      List<Map<String, dynamic>>? sqflitcountriessList = await getCountries();
      List<Map<String, dynamic>>? sqflitsuppliersList = await getSuppliers();
      List<Map<String, dynamic>>? sqflitmedicineList = await getMedicine();
      List<Map<String, dynamic>>? sqflitmedicinLocationList =
          await getMedicinLocation();
      List<Map<String, dynamic>>? sqflitpurchaseList = await getPurchase();
      List<Map<String, dynamic>>? sqflitsalesList = await getSales();
      List<Map<String, dynamic>>? sqflitusersList = await getUsers();

      // await sqlDb.deleteDataBase();
      debugPrint("============== 2 ==========================");
      for (var i in accountsList) {
        int count = 0;
       // int acountresponse;
     if(sqflitaccountsList!.isNotEmpty){
         for (Map info in sqflitaccountsList) {
          debugPrint("=======  info length ${sqflitaccountsList.length-1}  ===========  count == $count");
          
          debugPrint("${i["AccNom"]}   ====   info  == ${info["AccNom"]}");
          if (i["AccNom"] != info["AccNom"] && sqflitaccountsList.length == count+1) {
             debugPrint("===========   customer ===== $count");
             debugPrint("======= $info    ====    ${i.data()}");
             debugPrint("============  $sqflitaccountsList");
             await sqlDb.insertData('''
                 INSERT INTO
                "Accounts" (`AccNom`,`Amount` , `acoountlimit`)
                 VALUES ( ${i["AccNom"]},${i["Amount"]} , ${i["acoountlimit"]})
              ''');
          } else if (i["AccNom"] == info["AccNom"]) {
            debugPrint("===========   customerfound ===== $count");
           break;
          }
          count++;
        }
     }else{
      await sqlDb.insertData('''
                 INSERT INTO
                "Accounts" (`AccNom`,`Amount` , `acoountlimit`)
                 VALUES ( ${i["AccNom"]},${i["Amount"]} , ${i["acoountlimit"]})
              ''');

     }

        debugPrint("${i.data()}");
      }
      debugPrint("============== 3 ==========================");

      for (var i in customerList) {
        
        int count = 0;
       if(sqflitcustomerList!.isNotEmpty){
         for (Map info in sqflitcustomerList) {
         
          debugPrint("${i["customerId"]}   ====   info  == ${info["customerId"]}");
          if (i["customerId"] != info["customerId"] && sqflitcustomerList.length == count+1) {
            debugPrint("===========   customer ===== $count");
             await sqlDb.insertData('''
                 INSERT INTO 
           "Customer" (customerId,customerName , phoneNum, fkaccNom)
            VALUES ( ${i["customerId"]} , "${i["customerName"]} ", ${i["phoneNum"]} , ${i["fkaccNom"]})
              ''');
          } else if (i["customerId"] == info["customerId"]) {
          break;
          }
           count++;
        }
       }else{
        await sqlDb.insertData('''
                 INSERT INTO 
           "Customer" (customerId,customerName , phoneNum, fkaccNom)
            VALUES ( ${i["customerId"]} , "${i["customerName"]} ", ${i["phoneNum"]} , ${i["fkaccNom"]})
              ''');

       }

        debugPrint("${i.data()}");
      }
      debugPrint("============== 4 ==========================");
      int acountresponse;
      for (var i in countriessList) {
        int count = 0;
                  debugPrint("======sqflitcountriessList.length ${sqflitcountriessList!.length} == count+1 ${count+1}");

       if(sqflitcountriessList.isNotEmpty){
         for (Map info in sqflitcountriessList) {
         
          debugPrint("${i["countryId"]}   ====   info  == ${info["countryId"]}");
          if (i["countryId"] != info["countryId"] && sqflitcountriessList.length == count+1) {
             acountresponse = await sqlDb.insertData('''
                 INSERT INTO countries(countryId,countryName)
      VALUES(${i["countryId"]}  ,"${i["countryName"]}")
              ''');
              debugPrint("respons ========== $acountresponse ==========");
          } else if (i["countryId"] == info["countryId"]) {
           break;
          }
        count++;
        }
       }else{
        debugPrint("=====list empty ===");

         acountresponse = await sqlDb.insertData('''
                 INSERT INTO countries(countryId,countryName)
      VALUES(${i["countryId"]}  ,"${i["countryName"]}")
              ''');

       }

        debugPrint("${i.data()}");
      
      }
      debugPrint("============== 5 ==========================");

      for (var i in suppliersList) {
      
       int count = 0;
       if(sqflitsuppliersList!.isNotEmpty){
         for (Map info in sqflitsuppliersList) {
          
          debugPrint("${i["supID"]}   ====   info  == ${info["supID"]}\n  ${i.data()}");
          if (i["supID"] != info["supID"] && sqflitsuppliersList.length == count+1) {
                  await sqlDb.insertData('''
                    INSERT INTO suppliers(supID , supName , supCompany,supPhone,fksuaccNom)
                    VALUES( ${i["supID"]},"${i["supName"]}","${i["supCompany"]}",${i["supPhone"]},${i["fksuaccNom"]})
              ''');
          } else if (i["supID"] == info["supID"]) {
            break;
          }
        count++;
        }
       }else{
        debugPrint("${i.data()}============");
        await sqlDb.insertData('''
                 INSERT INTO suppliers(supID , supName , supCompany,supPhone,fksuaccNom)
   VALUES( ${i["supID"]},"${i["supName"]}","${i["supCompany"]}",${i["supPhone"]},${i["fksuaccNom"]})
              ''');
       }

        debugPrint("${i.data()}");
        
      }
      debugPrint("============== 6 ==========================");

      for (var i in medicineList) {
        
         int count = 0;
        if(sqflitmedicineList!.isNotEmpty){
           for (Map info in sqflitmedicineList) {
          
          debugPrint("${i["medicineID"]}   ====   info  == ${info["medicineID"]}");
          if (i["medicineID"] != info["medicineID"] && sqflitmedicineList.length == count+1) {
            await sqlDb.insertData('''
                 INSERT INTO medicine(medicineID,medicineName,GroubNumber,Quantity,price,dateOFProduction,
                        dateOFBuy,expriyDate,parCodeNum,companyName,supplierID,userId,countryMade )
              VALUES(${i["medicineID"]} , "${i["medicineName"]}",${i["GroubNumber"]},${i["Quantity"]},${i["price"]},"${i["dateOFProduction"]}",
                     "${i["dateOFBuy"]}","${i["expriyDate"]}",${i["parCodeNum"]},"${i["companyName"]}",${i["supplierID"]} ,
                       ${i["userId"]}, ${i["countryMade"]} ) 
              ''');
          } else if (i["medicineID"] == info["medicineID"]) {
            break;
          }
        count++;
        }
        }else{
           await sqlDb.insertData('''
                 INSERT INTO medicine(medicineID,medicineName,GroubNumber,Quantity,price,dateOFProduction,
                        dateOFBuy,expriyDate,parCodeNum,companyName,supplierID,userId,countryMade )
              VALUES(${i["medicineID"]} , "${i["medicineName"]}",${i["GroubNumber"]},${i["Quantity"]},${i["price"]},"${i["dateOFProduction"]}",
                     "${i["dateOFBuy"]}","${i["expriyDate"]}",${i["parCodeNum"]},"${i["companyName"]}",${i["supplierID"]} ,
                       ${i["userId"]}, ${i["countryMade"]} ) 
              ''');
        }
        debugPrint("${i.data()}");

       
      }
      debugPrint("============== 7 ==========================");

      for (var i in medicinLocationList) {
      
        int count = 0;
        if(sqflitmedicinLocationList!.isNotEmpty){
          for (Map info in sqflitmedicinLocationList) {
          
          debugPrint("${i["posID"]}   ====   info  == ${info["posID"]}");
          if (i["posID"] != info["posID"] && sqflitmedicinLocationList.length == count+1) {
             await sqlDb.insertData('''
                  INSERT INTO medicinLocation(posID, fkmedicineID ,row , column )
              VALUES(${i["posID"]} , ${i["fkmedicineID"]}, ${i["row"]}, ${i["column"]} ) 
              ''');
          } else if (i["posID"] == info["posID"]) {
            break;
          }
        count++;
        }
        }else{
            await sqlDb.insertData('''
                  INSERT INTO medicinLocation(posID, fkmedicineID ,row , column )
              VALUES(${i["posID"]} , ${i["fkmedicineID"]}, ${i["row"]}, ${i["column"]} ) 
              ''');
        }

        debugPrint("${i.data()}");
       
      }
      debugPrint("============== 8 ==========================");

      for (var i in purchaseList) {
      
         int count = 0;
       if(sqflitpurchaseList!.isNotEmpty){
         for (Map info in sqflitpurchaseList) {
          
          debugPrint("${i["ID"]}   ====   info  == ${info["ID"]}");
          if (i["ID"] != info["ID"] && sqflitpurchaseList.length == count+1) {
             await sqlDb.insertData('''
                 INSERT INTO purchase(ID, Quantity ,price , supplierId,medicineID )
              VALUES(${i["ID"]} ,  ${i["Quantity"]} ,${i["price"]} ,
               ${i["supplierId"]} , ${i["medicineID"]} )          
              ''');
          } else if (i["ID"] == info["ID"]) {
           break;
          }
        count++;
        }
       }else{ 
         await sqlDb.insertData('''
                 INSERT INTO purchase(ID, Quantity ,price , supplierId,medicineID )
              VALUES(${i["ID"]} ,  ${i["Quantity"]} ,${i["price"]} ,
               ${i["supplierId"]} , ${i["medicineID"]} )          
              ''');}


        debugPrint("${i.data()}");
       
      }
      debugPrint("============== 9 ==========================");

      for (var i in salesList) {
       
           int count = 0;
        if(sqflitsalesList!.isNotEmpty){
          for (Map info in sqflitsalesList) {
          
          debugPrint("${i["id"]}   ====   info  == ${info["id"]}");
          if (i["id"] != info["id"] && sqflitsalesList.length == count+1) {
           await sqlDb.insertData('''
                 INSERT INTO  sales (id , quantaty , UnitePrice , totalPrice, date ,fkcustomerId ,fkmedicineID)
         VALUES( ${i["id"]} , ${i["quantaty"]} , ${i["UnitePrice"]} , ${i["totalPrice"]} ,"${i["date"]}" ,
         ${i["fkcustomerId"]} , ${i["fkmedicineID"]})     
              ''');
          } else if (i["id"] == info["id"]) {
          break;
          }
        count++;
        }
        }else{
          debugPrint("=============== empty table =======");
           await sqlDb.insertData('''
                 INSERT INTO  sales (id , quantaty , UnitePrice , totalPrice, date ,fkcustomerId ,fkmedicineID)
         VALUES( ${i["id"]} , ${i["quantaty"]} , ${i["UnitePrice"]} , ${i["totalPrice"]} ,"${i["date"]}" ,
         ${i["fkcustomerId"]} , ${i["fkmedicineID"]})     
              ''');}

        debugPrint("${i.data()}");
       
      }
      debugPrint("============== 10 ==========================");

      for (var i in usersList) {
        
         int count = 0;
       if(sqflitusersList!.isNotEmpty){
         for (Map info in sqflitusersList) {
          
          debugPrint("${i["uId"]}   ====   info  == ${info["uId"]}");
          if (i["uId"] != info["uId"] && sqflitusersList.length == count+1) {
            await sqlDb.insertData('''
                INSERT INTO users(uId,uName,uPass) VALUES(${i["uId"]},"${i["uName"]}","${i["uPass"]}")   
              ''');
          } else if (i["uId"] == info["uId"]) {
           break;
          }
        count++;
        }
       }else{
          await sqlDb.insertData('''
                INSERT INTO users(uId,uName,uPass) VALUES(${i["uId"]},"${i["uName"]}","${i["uPass"]}")   
              ''');
       }

        debugPrint("${i.data()}");
       
      }
      debugPrint("============== 11 ==========================");

      Get.back();
    } catch (e) {
      Get.back();
      debugPrint("=======================================");
      debugPrint("$e");
      Get.defaultDialog(title:"ERROR", middleText: "$e");
    }
  }
}
