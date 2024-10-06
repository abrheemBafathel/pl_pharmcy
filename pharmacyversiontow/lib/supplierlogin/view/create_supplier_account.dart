import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/supplierlogin/controller/supplier_login_firebase_controller.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/coustom_textformviled_vildetion.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_button.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_link.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_selected_dropdownbuttom.dart';
import 'package:pharmacyversiontow/supplierlogin/view/widget/custom_titel.dart';

class CreateSupplierAccount extends StatelessWidget {
  CreateSupplierAccount({super.key});

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
      body: GetBuilder<SupplierLoginFirebaseController>(
        builder: (buildercontroller) => Container(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
          child: Form(
            key: controller.loginGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomTitel(titelName: "163".tr),
                  CoustomTextFormFiledVildtion(
                      myController: controller.userName,
                      validator: controller.isUserNameValide,
                      hintText: "164".tr,
                      name: "165".tr),
                  CoustomTextFormFiledVildtion(
                      myController: controller.userEmail,
                      validator: controller.isUserEmailValide,
                      hintText: "166".tr,
                      name: "167".tr),
                  CoustomTextFormFiledVildtion(
                      myController: controller.userPassword,
                      validator: controller.isUserPassworValide,
                      hintText: "168".tr,
                      name: "169".tr),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                      CustomSelectedDropDownButtom(
                        userTypeList:const ['Supplier', 'Pharmacist', 'worker'],
                        selectedUserType: buildercontroller.selectedUserType,
                        onChangeduserType: ({val}) =>
                            controller.chanSelectedUserType(value: val),
                        //  onChangeduserType:  chanSelectedUserType,
                      ),
                    ],
                  ),
                  if (controller.isPharmacise)
                    CoustomTextFormFiledVildtion(
                        myController: controller.userPharmacy,
                        validator: controller.isUserPharmacyValide,
                        hintText: "170".tr,
                        name: "171".tr),
                  if (controller.isWorker)
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.defaultSize! * 2,
                        ),
                        CustomSelectedDropDownButtom(
                          userTypeList: controller.listPharmciesName,
                          selectedUserType: buildercontroller.selectedPharmacey,
                          onChangeduserType: ({val}) =>
                              controller.chaneSelectedPharmacy(value: val),
                          //  onChangeduserType:  chanSelectedUserType,
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.defaultSize! * 2,
                      ),
                      CustomLink(
                        firstText: "172".tr,
                        linkText: "173".tr,
                        onTap: controller.goToRegestr,
                      ),
                    ],
                  ),
                  
                  Center(
                    child: CustomButton(
                      name: "174".tr,
                      onPressed:   controller.createSupplierUser,
                    ),
                  ),
                /*  Center(
                    child: CustomButton(
                      name: "check",
                      onPressed: controller.getpharmaciesNames,
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
