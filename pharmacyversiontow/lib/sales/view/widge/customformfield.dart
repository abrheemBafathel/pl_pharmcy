import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';
import 'package:pharmacyversiontow/sales/controller/salescontroller.dart';

class CustomSalseFormField extends StatelessWidget {
   CustomSalseFormField({super.key, this.controller});

 final TextEditingController? controller;

  final SalesController salesController =Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: SizeConfig.screenHeiht! * 2,
    // width: SizeConfig.screenWidth! * 0.2,
     decoration: BoxDecoration(),
     padding: EdgeInsets.all(SizeConfig.defaultSize!*2),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*4))),
            onChanged: (value) {
              salesController.updatSreach(value);
              print("${salesController.sreach}");
            },
      ),
    );
  }
}
