import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class MainWorkerBottomNivgation extends StatelessWidget {
  const MainWorkerBottomNivgation(
      {super.key,
      this.onTap,
      this.icon,
      this.bottonText,
      this.iconSize,
      this.textFontWeight,
      this.iconColor,
      this.textColor});
  final void Function()? onTap;
  final IconData? icon;
  final double? iconSize;
  final String? bottonText;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.2,
        child: Column(
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            Text(
              bottonText!,
              style: TextStyle(
                fontWeight: textFontWeight,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
