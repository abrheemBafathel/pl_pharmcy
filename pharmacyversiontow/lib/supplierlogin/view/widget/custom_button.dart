import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.name});
  final void Function()? onPressed;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 20),
      child: MaterialButton(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        minWidth: SizeConfig.screenWidth! * .5,
        height: SizeConfig.screenHeiht! * .09,
        color: const Color(0xff5FBDFF),
        onPressed: onPressed,
        child: Text("$name"),
      ),
    );
  }
}
