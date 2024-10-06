import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomFormField extends StatelessWidget {
 final TextEditingController? controlerlName;
 final String? name;
 final String? hinttext;
 final TextInputType? keyboardType;

  const CustomFormField({super.key, this.controlerlName, this.name, this.hinttext, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!*0.4),
      
      child: TextFormField(
         keyboardType: keyboardType,
        controller: controlerlName,
         scrollPadding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
       
       decoration: InputDecoration(
          
          label: Text("$name"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 3),
          ),
         // alignLabelWithHint: true,
         // floatingLabelAlignment: FloatingLabelAlignment.center,
          hintText: "$hinttext",
          
        ),
        
      ),
    );
  }
}
