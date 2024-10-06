import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/sqldb.dart';

class HomeMainController extends GetxController {
  SqlDb sqldb = SqlDb();
    List<Map> expierProdectList = [];
    List<Map> expierProdectListInformation = [];
     List<Map> almostExpierProdectList = [];
     List<Map> AlmostexpierProdectListInformation = [];
     List<Map> salseOfDay = [];
     List<Map> buyofday = [];
 
    var viewdate=DateTime.now(); 
    RxInt houre= DateTime.now().hour.obs;
    RxInt minute = DateTime.now().minute.obs; 
    RxInt scand = DateTime.now().second.obs;

  //  Stream timer = Stream.periodic(Duration(seconds: 1), (i){
    
  //     houre=houre.add(const Duration(seconds: 1));
  //     // return houre;

  //  });
  //  _listentoTimer()async{
  //   timer.listen((event) {
  //     houre= DateTime.parse(event.toString());
  //    });
  //  }

  // dataAbrhemm()async{
  //   var parse=await 
  // }
  
  void purchOfDay() async {
    print("${DateTime.now().toString().split(" ")[0]}");

    buyofday = await sqldb.readData('''
        SELECT * FROM medicine WHERE dateOFBuy = "${DateTime.now().toString().split(" ")[0]}"

      ''');

    // WHERE dateOFBuy = ${DateTime.now().toString().split(" ")[0]}
    print("${DateTime.now().toString().split(" ")[0]}");
    print("================================================");
    print("$buyofday");
    update();
  }

  Future<void> salsOfDayMothed() async {
    salseOfDay = [];
    print("${DateTime.now().toString().split(" ")[0]}");

    salseOfDay = await sqldb.readData('''
        SELECT id, medicineName, quantaty,UnitePrice , totalPrice, date 
        FROM medicine ,sales
        WHERE sales.fkmedicineID = medicine.medicineID
        AND   sales.date = "${DateTime.now().toString().split(" ")[0]}"

      ''');

    // WHERE dateOFBuy = ${DateTime.now().toString().split(" ")[0]}
    print("$salseOfDay");
    update();
  }

  void exepierProdect() async {
    expierProdectList = [];
  
    int thisyear;
    int thismonth;
    int thisday;
    int medicineyear;
    int medicinemonth;
    int medicineday;
    try {
      List<Map> prodectsDate = await sqldb.readData('''
       SELECT  medicineID , expriyDate FROM medicine

      ''');
      print("$prodectsDate");
      int s = 0;
      for (Map i in prodectsDate) {
        print(
            "${s++}  id ==== ${i["medicineID"]}   expirdate =${i["expriyDate"]}");
       
        print("${int.parse(i["expriyDate"].toString().split("-")[2])}");
        thisyear = DateTime.now().year;
        thismonth = DateTime.now().month;
        thisday = DateTime.now().day;
        medicineyear = int.parse(i["expriyDate"].toString().split("-")[0]);
        medicinemonth = int.parse(i["expriyDate"].toString().split("-")[1]);
        medicineday = int.parse(i["expriyDate"].toString().split("-")[2]);

        print("$medicineyear $medicinemonth $medicineday");
        print("$thisyear $thismonth $thisday");

        if (medicineyear > thisyear) {
          expierProdectList.add(i);
          print("======================== if 1 =============================");
        } else if (medicineyear == thisyear) {
          print("======================== if 2 =============================");

          if (medicinemonth >= thismonth) {
            print(
                "======================== if 3 =============================");

            expierProdectList.add(i);
          } else if (medicinemonth == thismonth) {
            print(
                "======================== if 4 =============================");

            if (medicineday >= thisday) {
              print(
                  "======================== if 5 =============================");

              expierProdectList.add(i);
            }
            
          }
        }

        /* if(d.isAfter(DateTime(thisyear, thismonth, thisday))){
            print("$i");
           
              
              expierProdectList.add(i);
            
          }*/
      }
      print(
          " expirlist ====: $expierProdectList,  \n buyofday :======== $buyofday ");
      update();
    } catch (error) {
      Get.snackbar("Faild", "expier Date has error \n $error");
    }
  }


  getEXpireMedicinInformation()async{
    expierProdectListInformation = [];
    List<Map> inf =[];

    for(Map i in expierProdectList){

    inf= await sqldb.readData(
       '''
         select * from medicine where medicineID=${i["medicineID"]}

       ''');

      expierProdectListInformation.addAll(inf); 
       print("$inf");
      print("$expierProdectListInformation");
    }
  }
  ///////////////////////////almost expier medicin////////////////
  Future<void> almostExepierProdect() async {
    almostExpierProdectList = [];
  
    int almostExpieryear;
    int almostExpiermonth;
    int almostExpierday;
    int medicineyear;
    int medicinemonth;
    int medicineday;
    try {
      List<Map> prodectsDate = await sqldb.readData('''
       SELECT  medicineID , expriyDate FROM medicine

      ''');
      print("$prodectsDate");
      int s = 0;
      for (Map i in prodectsDate) {
        print(
            "${s++}  id ==== ${i["medicineID"]}   expirdate =${i["expriyDate"]}");
       
        print("${int.parse(i["expriyDate"].toString().split("-")[2])}");
        DateTime dateNow=DateTime.now().subtract(Duration(days:180));
        almostExpieryear = dateNow.year;
        
        almostExpiermonth = dateNow.month;
        almostExpierday = dateNow.day;
        medicineyear = int.parse(i["expriyDate"].toString().split("-")[0]);
        medicinemonth = int.parse(i["expriyDate"].toString().split("-")[1]);
        medicineday = int.parse(i["expriyDate"].toString().split("-")[2]);

        print("$medicineyear $medicinemonth $medicineday");
        print("$almostExpieryear $almostExpiermonth $almostExpierday");

        if (medicineyear > almostExpieryear) {
          almostExpierProdectList.add(i);
          print("======================== if 1 =============================");
        } else if (medicineyear == almostExpieryear) {
          print("======================== if 2 =============================");

          if (medicinemonth >= almostExpiermonth) {
            print(
                "======================== if 3 =============================");

            almostExpierProdectList.add(i);
          } else if (medicinemonth == almostExpiermonth) {
            print(
                "======================== if 4 =============================");

            if (medicineday >= almostExpierday) {
              print(
                  "======================== if 5 =============================");

              almostExpierProdectList.add(i);
            }
            
          }
        }

        /* if(d.isAfter(DateTime(almostExpieryear, thismonth, thisday))){
            print("$i");
           
              
              expierProdectList.add(i);
            
          }*/
      }
     
      print(
          " expirlist ====: $almostExpierProdectList ");
      update();
    } catch (error) {
      Get.snackbar("Faild", "expier Date has error \n $error");
    }
  }

   getAlmostEXpireMedicinInformation()async{
    AlmostexpierProdectListInformation = [];
    List<Map> inf =[];

    for(Map i in almostExpierProdectList){

    inf= await sqldb.readData(
       '''
         select * from medicine where medicineID=${i["medicineID"]}

       ''');

      AlmostexpierProdectListInformation.addAll(inf); 
       print("$inf");
      print("${AlmostexpierProdectListInformation.length} : $AlmostexpierProdectListInformation");
    }

  }

  deleteDataBase()async{
    await sqldb.deleteDataBase();
  }

}
