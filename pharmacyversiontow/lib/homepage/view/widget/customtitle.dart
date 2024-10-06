import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize! * 0.4),
      child: Text(
        "${title}",
        style: TextStyle(
            fontSize: SizeConfig.defaultSize! * 2, fontWeight: FontWeight.bold),
      ),
    );
  }
}
