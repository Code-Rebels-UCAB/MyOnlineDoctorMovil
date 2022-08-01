import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordPatientRegistration extends StatefulWidget {
  TextEditingController _password = TextEditingController();
  bool _hidePassword;

  PasswordPatientRegistration(this._password, this._hidePassword, {Key? key}) : super(key: key);

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
            controller: widget._password,
            obscureText: widget._hidePassword,
            autofocus: false,
            decoration:  InputDecoration(
              hintText: '*********',
              suffixIcon: IconButton(
                icon: Icon(
                  widget._hidePassword
                  ? Icons.visibility_off
                  : Icons.visibility
                ),
                onPressed: () {
                  setState(() {
                    widget._hidePassword = !widget._hidePassword;
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
