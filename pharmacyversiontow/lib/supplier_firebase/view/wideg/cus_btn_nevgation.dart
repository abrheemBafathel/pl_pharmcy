import 'package:flutter/material.dart';

class CusBtnNevgation extends StatelessWidget {
  const CusBtnNevgation(
      {super.key,
      this.onCustomTap,
      this.iconBtn,
      this.textBtn,
      this.txtstylebtn,
      this.iconsize = 20, this.margin, this.iconColor});
  final void Function()? onCustomTap;
  final Color? iconColor;
  final IconData? iconBtn;
  final String? textBtn;
  final double? iconsize;
  final TextStyle? txtstylebtn;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCustomTap,
      child: Container(
        margin: margin,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconBtn,
                color: iconColor,
              ),
              Text(
                "$textBtn",
                style: txtstylebtn,
              )
            ],
          ),
        ),
      ),
    );
  }
}
