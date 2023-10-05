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
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('Gender'),
            SizedBox(
                width: 30
            ),
            Radio<Gender>(
              value: Gender.male,
              groupValue: _character,
              onChanged: (Gender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const Text('Male'),

            SizedBox(
                width: 20.0
            ),

            Radio<Gender>(
              value: Gender.female,
              groupValue: _character,
              onChanged: (Gender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const Text('Female'),

            SizedBox(
                width: 20
            ),

            Radio<Gender>(
              value: Gender.others,
              groupValue: _character,
              onChanged: (Gender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const Text('Others')
          ],
        ),

      ],
    );
  }
}