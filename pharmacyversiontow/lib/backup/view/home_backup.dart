import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/backup/controller/backup_controller.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class HomeBackup extends StatelessWidget {
  const HomeBackup({super.key});

  @override
  Widget build(BuildContext context) {
    BackupController backupController= Get.put(BackupController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("29".tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, SizeConfig.screenHeiht!*.1))),
                onPressed: () {
                  backupController.makeBackup();
                },
                child:  Text("195".tr)),
                SizedBox(height:SizeConfig.defaultSize ,),
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, SizeConfig.screenHeiht!*.1))),
                onPressed: () {
                  backupController.restorBackup();
                },
                child:  Text("196".tr)),
          ],
        ),
      ),
    );
  }
}
