import 'package:flutter/material.dart';

class EmptyTextFiledWarning extends StatelessWidget {
  final String? message;
  final String? valid;
  const EmptyTextFiledWarning(this.message, this.valid, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message != null
          ? message!
          : 'Por favor ingrese los datos necesarios'),
      content: Text(valid != null ? valid! : ''),
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
