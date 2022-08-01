import 'package:flutter/material.dart';

import 'registration_values.dart';

// ignore: must_be_immutable
class MiddleNamePatientRegistration extends StatelessWidget {
  const MiddleNamePatientRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Segundo Nombre',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Container(
          height: 50,
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
            controller: RegistrationValues.middleName,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: 'Victoria',
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