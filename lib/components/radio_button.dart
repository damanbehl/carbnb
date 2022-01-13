import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  static List<String> categories = [
    "SUV",
    "PICKUP",
    "SEDAN",
  ];
  String? _character = categories[0];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
              )
          ],
        ),
        Positioned(
            bottom: 80,
            left: 110,
            child: ElevatedButton(
              child: const Text("Select"),
              onPressed: () {
                Navigator.pop(context, _character);
              },
            ))
      ],
    );
  }
}
