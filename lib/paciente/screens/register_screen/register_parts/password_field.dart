import 'package:flutter/material.dart';

import 'registration_values.dart';

// ignore: must_be_immutable
class PasswordPatientRegistration extends StatefulWidget {
  const PasswordPatientRegistration({Key? key}) : super(key: key);

  @override
  State<PasswordPatientRegistration> createState() =>
      _PasswordPatientRegistrationState();
}

class _PasswordPatientRegistrationState
    extends State<PasswordPatientRegistration> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Contraseña',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            ),
          ],
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
            controller: RegistrationValues.password,
            obscureText: RegistrationValues.hidePassword,
            autofocus: false,
            decoration:  InputDecoration(
              hintText: '*********',
              suffixIcon: IconButton(
                icon: Icon(
                  RegistrationValues.hidePassword
                  ? Icons.visibility_off
                  : Icons.visibility
                ),
                onPressed: () {
                  setState(() {
                    RegistrationValues.hidePassword = !RegistrationValues.hidePassword;
                  });
                }
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 10
              ),
            ),
          ),
        ),
      ],
    );
  }
}
