import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplierlogin/controller/supplier_login_firebase_controller.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/coustom_textformviled_vildetion.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_button.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_link.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_titel.dart';

class SupplierLoginView extends StatelessWidget {
  SupplierLoginView({super.key});
  final SupplierLoginFirebaseController controller =
      Get.put(SupplierLoginFirebaseController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "162".tr,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 3),
        ),
        centerTitle: true,
        backgroundColor:const Color(0xffC5FFF8),
      ),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Form(
           key: controller.regestarGlobalKey,
          child: ListView(
            children: [
               CustomTitel(titelName: "175".tr),
              CoustomTextFormFiledVildtion(
                myController: controller.regesterUserEmail,
                validator: controller.isUserEmailValide,
                hintText: "166".tr,
                name: "167".tr,
              ),
              CoustomTextFormFiledVildtion(
                myController: controller.regesterUserPassword,
                validator: controller.isUserPassworRegesterValide,
                hintText: "168".tr,
                name: "169".tr,
              ),
              CustomLink(
                firstText: "176".tr,
                linkText: "177".tr,
                onTap: controller.goToCreatUserAcount,
              ),
              CustomButton(
                  name: "174".tr, onPressed: controller.regesterSupplierUser),
            ],
          ),
        ),
      ),
    );
  }
}
