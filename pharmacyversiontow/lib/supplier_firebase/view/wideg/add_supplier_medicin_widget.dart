import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class AddSupplierMedicinWidget extends StatelessWidget {
 const  AddSupplierMedicinWidget(
      {super.key, this.txtFormFildController, this.labelTextFiled, this.hintTextFiled, this.maxLine});
  final TextEditingController? txtFormFildController;
  final String? labelTextFiled;
  final String? hintTextFiled;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize!*0.5),
      child: TextFormField(
        autofocus: true,
        controller: txtFormFildController,
        decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.defaultSize!*4)),
          label: Text("$labelTextFiled"),
          hintText: "$hintTextFiled",
          
        ),
        maxLines: maxLine ?? 1,// maxLine ==null ? 2  : maxline
      ),
    );
  }
}
