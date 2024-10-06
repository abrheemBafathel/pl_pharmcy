import 'package:flutter/material.dart';

class CoustomTextFormFiledVildtion extends StatelessWidget {
  const CoustomTextFormFiledVildtion({super.key, this.name, this.hintText, required this.validator, this.myController});
  final String? name;
  final String? hintText;
  final TextEditingController? myController;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
          controller: myController ,
        validator:  (value) {
         
         String? valid;
         if(  validator(value) != null){
         valid = validator(value);
         }
         return valid;
    
    
        },
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            focusColor: Colors.black45,
            fillColor: Colors.black87,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            label:  Text("$name"),
            hintText: hintText),
      ),
    );
  }
}
