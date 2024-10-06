import 'package:get/get.dart';

class SellProdectController extends GetxController {
  double uintprice = 0;
  double totalprice = 0;
  int unitquntaty = 0;



  List<Map> prodect = [
    {"name": "solpaden", "totalprice": 100, "numberFatora": 1},
    {"name": "parstmol", "totalprice": 200, "numberFatora": 2},
    {"name": "ggggggg", "totalprice": 300, "numberFatora": 3},
    {"name": "bbbbbbb", "totalprice": 400, "numberFatora": 4},
    {"name": "nnnnnnnn", "totalprice": 500, "numberFatora": 5},
    {"name": "xxxxxxxx", "totalprice": 600, "numberFatora": 6}
  ];

  

   List<Map> searchprodect=[];
   void intsre( ){
     searchprodect.addAll(prodect);
     update();

   }
   

 void sreachfunction(String name) {
 
  for(int i=0;i<prodect.length;i++){
    if(prodect[i]["name"]==name){
      searchprodect[i]=prodect[i];
      
    }
      print("${searchprodect}");

  }
  print("${searchprodect}");


    update();
  }

     void total(int indx) {
    print("$uintprice  =====  $unitquntaty");
    prodect[indx]["totalprice"] = uintprice * unitquntaty;
        print("${prodect[indx][totalprice]}");

    update();
  }
  

  List<Map> a = [];
  List<Map> search(String name) {
    a.addAll(prodect.where((element) => element["name"] == name));
    return a;
  }
}
