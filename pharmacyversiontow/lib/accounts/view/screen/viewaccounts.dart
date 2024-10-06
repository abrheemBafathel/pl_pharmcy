import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/accounts/controller/accountcontroller.dart';
import 'package:pharmacyversiontow/accounts/view/widge/customeraccount.dart';

class ViewAccount extends StatelessWidget {
  ViewAccount({super.key});
  final AccountController controller = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("186".tr)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed("/AddAccount");
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<AccountController>(
          builder: (controller) => controller.accountList.isEmpty
              ?  Center(
                  child: Text("187".tr),
                )
              : ListView.builder(
                  itemCount: controller.accountList.length,
                  itemBuilder: (context, index) {
                    return CustomerAccount(
                      phone: " ${controller.accountList[index]["phoneNum"]}",
                      limit: "${controller.accountList[index]["acoountlimit"]}",
                      customernumber:
                          "${controller.accountList[index]["customerId"]}",
                      name: controller.accountList[index]["customerName"],
                      accountnumber:
                          "${controller.accountList[index]["AccNom"]}",
                      amount: "${controller.accountList[index]["Amount"]}",
                      delete: () {
                        controller.deletIist(index);
                      },
                      edit: () async {
                     
                         Get.toNamed("/UpdateAccount",arguments: {
                          "name":controller.accountList[index]["customerName"],
                          "phone":controller.accountList[index]["phoneNum"],
                          "amount":controller.accountList[index]["Amount"],
                          "limint":controller.accountList[index]["acoountlimit"],
                          "accNum":"${controller.accountList[index]["AccNom"]}",
                          //"accNum":controller.accountList[index]["AccNom"],
                          "customerId":controller.accountList[index]["customerId"]
                          
                          }
                        );
                        await controller.readAccount();
                       
                      },
                    );
                  },
                ),
        ));
  }
}
