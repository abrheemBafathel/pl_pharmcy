import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/worker/controller/main_worker_controller.dart';
class ActivateWorkerAccuntePage extends StatelessWidget {
  const ActivateWorkerAccuntePage({super.key});

  @override
  Widget build(BuildContext context) {
    MainWorkerController mainWorkerController = Get.put(MainWorkerController());
     SizeConfig.init(context);
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: SizeConfig.screenWidth! * .6,
                child: Text(
                  "16".tr,
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: SizeConfig.defaultSize,
            ),
            MaterialButton(
              color: Colors.black54,
              textColor: Colors.white54,
              focusColor: Colors.black26,
              onPressed: () {
                mainWorkerController.checkActivateAccunte();
              },
              child: Text("17".tr),
            ),
             MaterialButton(
              color: Colors.black54,
              textColor: Colors.white54,
              focusColor: Colors.black26,
              onPressed: () {
                mainWorkerController.gobacke();
              },
              child: Text("go back"),
            )
          ],
        ),
      ),
    );
  }
}
