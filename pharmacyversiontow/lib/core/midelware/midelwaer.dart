import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/worker/controller/main_worker_controller.dart';

class MidelWare extends GetMiddleware {
  MainWorkerController mainWorkerController = Get.put(MainWorkerController());
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? mysharedpref = myServices.sharedPreferences!.getString("userType");
    

    if (mysharedpref != null) {
      if (mysharedpref == "supplier") {
        return const RouteSettings(name: "/MainSupplier");
      }
      if (mysharedpref == "pharmacise") {
        return const RouteSettings(name: "/homepage");
      }
      if (mysharedpref == "worker") {
        return const RouteSettings(name: "/ActivateWorkerAccuntePage");
      }
    }
    return super.redirect(route);
  }
}
