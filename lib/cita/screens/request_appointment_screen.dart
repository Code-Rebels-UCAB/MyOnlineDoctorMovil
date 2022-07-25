import 'package:flutter/material.dart';
import 'package:myonlinedoctormovil/cita/infraestructura/services/appointment_service.dart';
import 'package:myonlinedoctormovil/common/infraestructura/push_notificaciones_servicio.dart';
import 'package:myonlinedoctormovil/common/validations.dart';

import 'package:myonlinedoctormovil/doctor/providers/doctor_provider.dart';
import 'package:myonlinedoctormovil/paciente/infraestructura/models/token_firebase.dart';
import 'package:myonlinedoctormovil/paciente/providers/patient_provider.dart';
import 'package:provider/provider.dart';

import '../../paciente/infraestructura/puertos/token_paciente_request_abstract.dart';
import '../infraestructura/decorators/abstract_appointment_service.dart';
import '../infraestructura/decorators/log_appointmentService.dart';

class RequestAppoinment extends StatefulWidget {
  TokenPacienteRequestAbstract tokenRequest;

  RequestAppoinment(this.tokenRequest, {Key? key}) : super(key: key);

  @override
  State<RequestAppoinment> createState() => _RequestAppoinmentState();
}

class _RequestAppoinmentState extends State<RequestAppoinment> {
  AbstractAppointmentService appointmentService = LogAppointmentService(AppointmentService()) ;
  final TextEditingController _textFieldMotive = TextEditingController();
  dynamic _dropdownSelectedModalityItem = ' ';

  // Ventana de Dialog para solicitar cita a un doctor
  @override
  Widget build(BuildContext context) {
    var idDoctor =
        Provider.of<IdDoctorProvider>(context, listen: false).idDoctor;
    var nameDoctor = Provider.of<IdDoctorProvider>(context, listen: false).name;
    var genderDoctor =
        Provider.of<IdDoctorProvider>(context, listen: false).gender;
    var idPatient =
        Provider.of<IdPatientProvider>(context, listen: false).idPatient;

    return AlertDialog(
      // Titulo del Dialog
      title: Text(
          '¿Desea solicitar una cita con el  ${verifyGender(genderDoctor)} $nameDoctor?', // Agregar nombre y genero desde el provider
          style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
          overflow: TextOverflow.visible),

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
          onPressed: () async  {
            if (_dropdownSelectedModalityItem != ' ' &&
                _textFieldMotive.text.isNotEmpty) {
              ////////////////////////////////////////////////////////////////Envia los datos
              String token = await PushNotificationService.initializeApp();
              print(token);

              TokenFirebase tokenFirebase = TokenFirebase(idPaciente: idPatient, tokenF: token);
              try {
                final response =  await widget.tokenRequest.guardarToken(tokenFirebase);
                const snackBar = SnackBar(
                  content: Text('Pedido de cita exitoso'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }catch(e){
                print(e);
              }



              appointmentService.postAppointmentRequest(idPatient, idDoctor,
                  _dropdownSelectedModalityItem, _textFieldMotive.text);

              Navigator.of(context).pop();
            } else if (_dropdownSelectedModalityItem == ' ' &&
                _textFieldMotive.text.isEmpty) {
              //////////////////////////////////////////////////////////////// Falta informacion
              if (_dropdownSelectedModalityItem == ' ') {
                //////////////////////////////////////////////////////////////// Falta informacion
              } else if (_textFieldMotive.text.isEmpty) {
                //////////////////////////////////////////////////////////////// Falta informacion
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
          border: Border.all(color: Colors.blue, width: 1)),
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
            'Presencial',
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
          border: Border.all(color: Colors.blue, width: 1)),
      child: TextFormField(
        controller: _textFieldMotive,
        maxLines: 8,
        cursorHeight: 20,
        autofocus: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your text here",
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
      ),
    );
  }
}
