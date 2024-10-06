import 'package:flutter/material.dart';

class CustomTitel extends StatelessWidget {
  const CustomTitel({super.key, this.titelName});
  final String? titelName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
      child: Center(
        child: Text(
          titelName!,
          style:const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
