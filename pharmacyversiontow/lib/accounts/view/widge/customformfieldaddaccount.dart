import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomFormFieldAddAccount extends StatelessWidget {
  final String? name;
  final String? hinttext;
  final TextEditingController? controll;

  const CustomFormFieldAddAccount(
      {super.key, this.name, this.hinttext, this.controll});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize!),
      child: TextFormField(
        controller: controll,
        decoration: InputDecoration(
          label: Text("$name"),
          labelStyle: TextStyle(fontSize: SizeConfig.defaultSize! * 2),
          hintText: "$hinttext",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 5)),
        ),
      ),
    );
  }
}
