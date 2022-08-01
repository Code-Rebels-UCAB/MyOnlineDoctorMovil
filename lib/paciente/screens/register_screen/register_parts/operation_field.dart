import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OperationsPatientRegistration extends StatelessWidget {

  TextEditingController _operations = TextEditingController();

  OperationsPatientRegistration(this._operations, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Operaciones',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Container(
          height: 150,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 1)
          ),
          child: TextFormField(
            controller: _operations,
            cursorHeight: 20,
            maxLines: null,
            expands: true,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: '...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 10
              ),
            ),
          ),
        ),
      ],
    );
  }
}