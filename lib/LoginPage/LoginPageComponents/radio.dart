import 'package:flutter/material.dart';

enum Gender { male, female, others }

class GenderRadio extends StatefulWidget {
  const GenderRadio ({super.key});

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  Gender? _character = Gender.male;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Text('Gender', style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(width: 30),
          Radio<Gender>(
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            value: Gender.male,
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          const Text('Male', style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(width: 20.0),
          Radio<Gender>(
            value: Gender.female,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          const Text('Female', style: TextStyle(fontSize: 16, color: Colors.white)),
          SizedBox(width: 20),
          Radio<Gender>(
            value: Gender.others,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
            groupValue: _character,
            onChanged: (Gender? value) {
              setState(() {
                _character = value;
              });
            },
          ),
          const Text('Others', style: TextStyle(fontSize: 16, color: Colors.white))
        ],
      ),
    );
  }
}