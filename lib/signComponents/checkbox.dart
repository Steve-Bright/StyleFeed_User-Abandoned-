import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
       children: <Widget>[
         Checkbox(
           checkColor: Colors.white,
           fillColor: MaterialStatePropertyAll(Colors.blue),
           value: isChecked,
           onChanged: (bool? value) {
             setState(() {
               isChecked = value!;
             });
           },
         ),

         const Text('I have read and agreed to terms and conditions')
       ]
    )
      ;
  }
}
