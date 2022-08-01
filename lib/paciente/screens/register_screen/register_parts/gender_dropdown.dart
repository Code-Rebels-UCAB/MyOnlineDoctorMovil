import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GenderPatientRegistration extends StatefulWidget {

  dynamic _dropdownSelectedGenderItem = ' ';

  GenderPatientRegistration(this._dropdownSelectedGenderItem, {Key? key}) : super(key: key);

  @override
  State<GenderPatientRegistration> createState() => _GenderPatientRegistrationState();
}

class _GenderPatientRegistrationState extends State<GenderPatientRegistration> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Genero',
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
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue, width: 1)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.blue,
              ),

              // Valor actual del Dropdown
              value: widget._dropdownSelectedGenderItem,
              items: <String>[
                ' ',
                'Femenina',
                'Masculino',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              underline: const SizedBox(
                height: 0,
              ),

              // Cuando cambie el estado del Dropdown Button: asigna el nuevo valor
              onChanged: (newValue) {
                setState(() {
                  widget._dropdownSelectedGenderItem = newValue!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}