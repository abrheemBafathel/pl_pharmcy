import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomSelectedDropDownButtom extends StatelessWidget {
  const CustomSelectedDropDownButtom(
      {super.key,
      this.userTypeList,
      this.onChangeduserType,
      this.selectedUserType});
  final List? userTypeList;
  final void Function({String? val})? onChangeduserType;
  final String? selectedUserType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 100,

      width: SizeConfig.screenWidth! * 0.5,
      //height: SizeConfig.screenHeiht!*0.25,
      child: DropdownButton(
        items: userTypeList!
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text('$e'),
                ))
            .toList(),
        onChanged: (val) {
          onChangeduserType!(val: val as String);
        },
        value: selectedUserType,
      ),
    );
  }
}

//['Supplier', 'pharamcy','worker']