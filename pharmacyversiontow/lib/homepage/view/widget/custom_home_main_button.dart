
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacyversiontow/core/utils/sizeconfig.dart';


class CustomHomeMainButton extends StatelessWidget {
  const CustomHomeMainButton(
      {super.key,
      this.onPressed,
      this.title,
      this.subtitle,
      this.numberofmedicin = "0"});
  final void Function()? onPressed;
  final String? title;
  final String? subtitle;
  final String? numberofmedicin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize!),
        margin: EdgeInsets.symmetric(horizontal:  SizeConfig.defaultSize!*2 , vertical: SizeConfig.defaultSize!*0.5 ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 2),
            color: Colors.white
                ),
                //)
        child: Container(
            height: SizeConfig.screenHeiht! * 0.12,
           // width: SizeConfig.screenHeiht! *0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "$title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.defaultSize! * 1.6),
                  ),
                ),
                // Expanded(
                //   flex: 5,
                //   child: Text("$subtitle",
                //       style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: SizeConfig.defaultSize! * 1.3)),
                // ),
                Expanded(
                  flex: 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text("$subtitle",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.defaultSize! * 1.3)),
                        
                      ),
                      Expanded(
                          flex: 1,
                          child: Text("$numberofmedicin",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.defaultSize! * 2))),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
