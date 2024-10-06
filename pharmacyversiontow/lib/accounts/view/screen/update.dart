import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/accounts/controller/accountcontroller.dart';
import 'package:pharmacyversiontow/accounts/view/widge/customformfieldaddaccount.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class UpdateAccount extends StatelessWidget {
  UpdateAccount({super.key});

  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    accountController.getargument();
    return Scaffold(
      appBar: AppBar(title: Text("185".tr)),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Form(
            child: ListView(
          children: [
            CustomFormFieldAddAccount(
              name: "165".tr,
              hinttext: "164".tr,
              controll: accountController.name,
            ),
            CustomFormFieldAddAccount(
              name: "179".tr,
              hinttext: "180".tr,
              controll: accountController.phonenumber,
            ),
            CustomFormFieldAddAccount(
              name: '181'.tr,
              hinttext: "182".tr,
              controll: accountController.amount,
            ),
            CustomFormFieldAddAccount(
              name: "183".tr,
              hinttext: "184".tr,
              controll: accountController.limit,
            ),
            MaterialButton(
              onPressed: () {
                accountController.updateAccount();
                Get.back();
              },
              color: Colors.blue,
              child: Text("91".tr),
            ),
           /* MaterialButton(
              onPressed: () {
                accountController.test();
              },
              color: Colors.blue,
              child: const Text("test"),
            )*/
          ],
        )),
      ),
    );
  }
}
