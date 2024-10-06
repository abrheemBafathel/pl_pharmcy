import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/accounts/controller/accountcontroller.dart';
import 'package:pharmacyversiontow/accounts/view/widge/customformfieldaddaccount.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class AddAccount extends StatelessWidget {
  AddAccount({super.key});
  final TextEditingController? name = TextEditingController();
  final TextEditingController? phonenumber = TextEditingController();
  final TextEditingController? amount = TextEditingController();
  final TextEditingController? limit = TextEditingController();

  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("178".tr)),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Form(
            child: ListView(
          children: [
            CustomFormFieldAddAccount(
              name: "165".tr,
              hinttext: "164".tr,
              controll: name,
            ),
            CustomFormFieldAddAccount(
              name: "179".tr,
              hinttext: "180".tr,
              controll: phonenumber,
            ),
            CustomFormFieldAddAccount(
              name: "181".tr,
              hinttext: "182".tr,
              controll: amount,
            ),
            CustomFormFieldAddAccount(
              name: "183".tr,
              hinttext: "184".tr,
              controll: limit,
            ),
            MaterialButton(
              onPressed: () {
                try{
                accountController.addAccount(
                    name!.text,
                    int.parse(phonenumber!.text),
                    double.parse(limit!.text),
                    double.parse(amount!.text));
                    Get.back();
                    }catch(error){
                      Get.snackbar("Error", "complet filed  $error ");

                    }
              },
             
              color: Colors.blue,
               child: Text("129".tr),
            )
          ],
        )),
      ),
    );
  }
}
