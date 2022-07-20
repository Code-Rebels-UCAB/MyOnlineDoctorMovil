import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:myonlinedoctormovil/cita/infraestructura/models/appointments_model.dart';

class AppointmentService {
  Future getAppointmentsOfPatient(String idPatient) async {
    print('ServicioA Entro');

    var response = await http.get(Uri.parse(
        "http://localhost:3005/api/cita/getcitaspaciente/$idPatient"
        //"http://192.168.8.100:3005/api/cita/getcitaspaciente/ed649257-8091-4b77-827a-8532b5c4c826"
        //"http://10.0.1.12:3005/api/cita/getcitaspaciente/ed649257-8091-4b77-827a-8532b5c4c826"
        ));

    print('Paso await');

    var jsonResponse = convert.jsonDecode(response.body);

    print('Paso convert');

    var hola;

    print(jsonResponse['valor'][0]['id_cita']);

    hola = jsonResponse["valor"].map((appointments) => AppointmentModel.fromJson(appointments))/*.toList()*/;
    //print(hola[0]['id_cita']);

    print('antes del return');

    return hola;
  }

  /*Future<RequestAppointmentModel> postAppointmentRequest (String idPatient, String idDoctor, String modality, String motive) async {
    return 
  }*/

  /*Future<AcceptDeclineAppointmentModel> postAcceptDeclineAppointment (String idAppointment, String statusAppointment) async {
    return 
  }*/

}
