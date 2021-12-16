import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  static List<String> categories = [
    "SUV",
    "Pick up trucks",
    "Sedans",
    "limousines"
  ];
  String? _character = categories[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in categories)
          ListTile(
            title: Text(item),
            leading: Radio<String>(
              value: item,
              groupValue: _character,
              onChanged: (String? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
      ],
    );
  }
}
