import 'package:flutter/material.dart';

class dropDownButton extends StatelessWidget {
  dynamic object;
  dropDownButton({this.object});
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: object[0],
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 1,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        print(newValue);
      },
      items: object.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
