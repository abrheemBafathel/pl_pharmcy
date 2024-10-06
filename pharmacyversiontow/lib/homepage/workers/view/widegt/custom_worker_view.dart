import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomWorkerView extends StatelessWidget {
  const CustomWorkerView(
      {super.key, this.workerName, this.onPressed, this.color, this.btnTital});
  final String? workerName;
  final void Function()? onPressed;
  final Color? color;
  final String? btnTital;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.defaultSize!),
      child: Card(
          child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(workerName!),
            MaterialButton(
              onPressed: onPressed,
              child: Text(
                btnTital!,
                style: TextStyle(color: color),
              ),
            )
          ],
        ),
      )),
    );
  }
}
