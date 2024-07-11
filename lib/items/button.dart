import 'package:flutter/material.dart';

class ButtonCus extends StatelessWidget {
  final String tixt;
  final Color tixtColor;
  final Color buttonColor;
  final Color borderSideColors;
  final void Function() pressed;
  const ButtonCus({super.key, required this.tixt, required this.tixtColor, required this.buttonColor, required this.borderSideColors, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                color: buttonColor,
                height: 55,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(55),side: BorderSide(color: borderSideColors,width: 3)) ,
                onPressed: pressed,
                child: Text(tixt,style: TextStyle(color:tixtColor,fontSize: 20,fontWeight: FontWeight.bold),),);
  }
}

