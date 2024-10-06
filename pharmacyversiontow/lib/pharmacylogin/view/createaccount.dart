import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/pharmacylogin/controller/logincontroller.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  final LoginController loginController = Get.find();

 

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLPharmacy",
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 5),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Form(
          key: loginController.creataccountglobalKey,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 3,
              ),
              Text(
                "   Create Accounte   ",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: SizeConfig.screenHeiht! * .1,
              ),
              TextFormField(
                controller: loginController.name,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    focusColor: Colors.black45,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: const Text("الاسم"),
                    hintText: "ادخل اسمك هنا"),
              ),
              SizedBox(
                height: SizeConfig.screenHeiht! * .02,
              ),
              TextFormField(
                controller: loginController.password,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                    focusColor: Colors.black45,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    label: const Text("كلمه السر"),
                    hintText: "ادخل كلمه السر هنا"),
              ),
              SizedBox(
                height: SizeConfig.screenHeiht! * .05,
              ),
              Row(
                children: [
                  Text("if you do not have account "),
                  InkWell(
                    child: Text(
                      "regestor account",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => Get.offNamed("/pharmacyloginview"),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeiht! * .05,
              ),
              MaterialButton(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                minWidth: SizeConfig.screenWidth! * .5,
                height: SizeConfig.screenHeiht! * .09,
                color: const Color(0xff5FBDFF),
                onPressed: () {
               loginController.insertData();
                  Get.offAllNamed("/homepage");
                },
                child: const Text("دخول"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
