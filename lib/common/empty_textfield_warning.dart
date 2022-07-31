import 'package:flutter/material.dart';

class EmptyTextFiledWarning extends StatelessWidget {
  const EmptyTextFiledWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Por favor ingrese los datos necesarios'),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}