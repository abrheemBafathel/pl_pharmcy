import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/pharmacylogin/controller/logincontroller.dart';

class PharmacyLoginView extends StatelessWidget {
  PharmacyLoginView({super.key});
  final LoginController loginController =
      Get.put(LoginController(), permanent: true);

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
          key: loginController.globalKey,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              ),
              Text(
                "Regestor Accounte",
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
                    child:const Text("create account",
                        style: TextStyle(color: Colors.blue)),
                    onTap: () => Get.offNamed("/CreateAccount"),
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
                color: Color(0xff5FBDFF),
                onPressed: () {
                  print("${loginController.name.text}");
                  print("${loginController.password.text}");
                  loginController.chackuser();
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
