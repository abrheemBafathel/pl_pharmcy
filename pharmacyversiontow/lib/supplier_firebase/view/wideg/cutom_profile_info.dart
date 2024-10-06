import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo(
      {super.key,
      this.textChild,
      this.widgetChild,
      this.isPhoneNumberValide,
      this.controller,
      this.updat = false,
      this.onPressed,
      this.note});
  final String? Function(String?)? isPhoneNumberValide; //(String? value);
  final String? textChild;
  final String? note;
  final TextEditingController? controller;
  final bool updat;
  final void Function()? onPressed;

  final Widget? widgetChild;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 4,
            child: widgetChild!,
          ),
          Expanded(
            flex: updat ? 4 : 6,
            child: Text("$textChild"),
          ),
          if (updat)
            Expanded(
                flex: 2,
                child: IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          content: Column(
                        children: [
                          Text(note!),
                          TextFormField(
                            controller: controller,
                            validator: isPhoneNumberValide,
                          ),
                          ElevatedButton(
                              onPressed: onPressed, child: const Text("Save")),
                        ],
                      ));
                    },
                    icon: const Icon(Icons.add)))
        ],
      ),
      const Divider()
    ]);
  }
}
