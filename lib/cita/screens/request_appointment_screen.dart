import 'package:flutter/material.dart';

class RequestAppoinment extends StatefulWidget {
  const RequestAppoinment({Key? key}) : super(key: key);

  @override
  State<RequestAppoinment> createState() => _RequestAppoinmentState();
}

class _RequestAppoinmentState extends State<RequestAppoinment> {
  final TextEditingController _textFieldMotive = TextEditingController();
  dynamic _dropdownSelectedModalityItem = ' ';

  // Ventana de Dialog para solicitar cita a un doctor
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // Titulo del Dialog
      title: const Text(
        '¿Desea solicitar una cita con el Dr. o Dra. Nombre Apellido?', // Agregar nombre y genero desde el provider 
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        overflow: TextOverflow.visible
      ),

      content: SingleChildScrollView(
        child: ListBody(
          children: [
            const Text(
              'Modalidad:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),

            // Dropdown de la modalidad de la cita
            _modalityDropdown(),
            const Text(
              'Motivo:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),

            // TextField del motivo de la cita
            _motiveTextBox()
          ],
        ),
      ),
      actions: <Widget>[

        // Button para solicitar cita, con modalidad y motivo
        TextButton(
          child: const Text(
            'Solicitar Cita',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () {
            if (_dropdownSelectedModalityItem != ' ' && _textFieldMotive.text.isNotEmpty) {
              ////////////////////////////////////////////////////////////////Envia los datos

              Navigator.of(context).pop();
            } else if (_dropdownSelectedModalityItem == ' ' && _textFieldMotive.text.isEmpty) {
              //////////////////////////////////////////////////////////////// Falta informacion
              if (_dropdownSelectedModalityItem == ' ') {

              } else if (_textFieldMotive.text.isEmpty) {

              }
            }
          },
        ),
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  // Dropdown para seleccionar modalidad
  Widget _modalityDropdown() {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 1)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: const Text('Select'),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.blue,
          ),

          // Valor actual del Dropdown
          value: _dropdownSelectedModalityItem,
          items: <String>[
            ' ',
            'Precencial',
            'Virtual',
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
              _dropdownSelectedModalityItem = newValue!;
            });
          },
        ),
      ),
    );
  }

  // TextField para describir el motivo de la cita
  Widget _motiveTextBox() {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 1)
      ),
      child: TextFormField(
        controller: _textFieldMotive,
        maxLines: 8, 
        cursorHeight: 20,
        autofocus: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your text here",
          contentPadding:
          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
      ),
    );
  }
}
