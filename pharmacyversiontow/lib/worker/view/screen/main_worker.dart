import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/services/services.dart';
import 'package:pharmacyversiontow/worker/controller/main_worker_controller.dart';
import 'package:pharmacyversiontow/worker/view/widget/main_worker_bottom_nivgation.dart';

class MainWorker extends StatelessWidget {
  const MainWorker({super.key});

  @override
  Widget build(BuildContext context) {
    final MainWorkerController mainWorkerController =
        Get.put(MainWorkerController());
    final MyServices myServices = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("1".tr)),
      body: GetBuilder<MainWorkerController>(
        builder: (controller) => mainWorkerController
            .mainWorkerList[mainWorkerController.selectedPage],
      ),
      bottomNavigationBar: BottomAppBar(
        child: GetBuilder<MainWorkerController>(
          builder: (controller) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainWorkerBottomNivgation(
                bottonText: "2".tr,
                icon: Icons.sell,
                iconColor: controller.selectedPage == 0
                    ? Colors.black
                    : Colors.black45,
                textColor: controller.selectedPage == 0
                    ? Colors.black
                    : Colors.black45,
                iconSize: controller.selectedPage == 0 ? 30 : 20,
                textFontWeight: controller.selectedPage == 0
                    ? FontWeight.bold
                    : FontWeight.normal,
                onTap: () {
                  controller.changeMainWorkerPage(0);
                },
              ),
              MainWorkerBottomNivgation(
                bottonText: "3".tr,
                icon: Icons.qr_code,
                iconColor: controller.selectedPage == 1
                    ? Colors.black
                    : Colors.black45,
                textColor: controller.selectedPage == 1
                    ? Colors.black
                    : Colors.black45,
                iconSize: controller.selectedPage == 1 ? 30 : 20,
                textFontWeight: controller.selectedPage == 1
                    ? FontWeight.bold
                    : FontWeight.normal,
                onTap: () {
                  controller.changeMainWorkerPage(1);
                },
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed("/MainWorkerViewSles");
            },
            leading: const Icon(Icons.sell),
            title: Text("4".tr),
          ),
          ListTile(
            title: Text("5".tr),
            leading: const Icon(Icons.logout_outlined),
            onTap: () async {
             await FirebaseAuth.instance.signOut();
              myServices.sharedPreferences!.clear();
              Get.offAllNamed("/supplierloginview");
            },
          ),
        ],
      )),
    );
  }
}
