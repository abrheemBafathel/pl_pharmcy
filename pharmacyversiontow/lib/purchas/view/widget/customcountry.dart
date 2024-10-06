import 'package:flutter/material.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';

class CustomCountry extends StatelessWidget {
  const CustomCountry({super.key, this.countryname, this.edite, this.delete});
  final String? countryname;
  final void Function()? edite;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 2,
            ),
            Expanded(flex: 3, child: Text("$countryname")),
            Expanded(
              flex: 5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: delete,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: edite,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
