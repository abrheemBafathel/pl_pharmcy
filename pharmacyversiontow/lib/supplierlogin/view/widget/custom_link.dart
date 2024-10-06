import 'package:flutter/material.dart';

class CustomLink extends StatelessWidget {
  const CustomLink({super.key, this.onTap, this.firstText, this.linkText});
  final Function()? onTap;
  final String? firstText;
  final String? linkText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$firstText"),
        InkWell(
            
            onTap: onTap,
            child: Text("$linkText", style:const TextStyle(color: Colors.blue)),)
      ],
    );
  }
}
