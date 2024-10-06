import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/worker/controller/main_worker_controller.dart';


class WorkerMidelWare extends GetMiddleware{
 MainWorkerController mainWorkerController= Get.put(MainWorkerController());
   MyServices myServices = Get.find();
   

  @override
  RouteSettings? redirect(String? route)  {
        String? mysharedprefactivate = myServices.sharedPreferences!.getString("activate");

       print("=======================================================");
       print("===================== $mysharedprefactivate =============");
       print("=======================================================");


      
       if("$mysharedprefactivate"=="1"){
           return const RouteSettings(name: "/MainWorker");

        }

        
     

    return super.redirect(route);
  }


}