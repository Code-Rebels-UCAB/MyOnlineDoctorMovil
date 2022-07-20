import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:myonlinedoctormovil/cita/infraestructura/models/appointments_model.dart';

class AppointmentService {
  Future<List<AppointmentModel>> getAppointmentsOfPatient(
      String idPatient) async {
    var response = await http.get(Uri.parse(
        "http://192.168.8.100:3005/api/cita/getcitaspaciente/4a2ed3f9-5331-41a7-89e1-c8d1f76d23e7"
        //"http://10.0.1.12:3005/api/cita/getcitaspaciente/ed649257-8091-4b77-827a-8532b5c4c826"
    )); // Cambiar por $idPatient
    var jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse["valor"]
        .map((appointments) => AppointmentModel.fromJson(appointments))
        .toList();
  }

  /*Future<RequestAppointmentModel> postAppointmentRequest (String idPatient, String idDoctor, String modality, String motive) async {
    return 
  }*/

  /*Future<AcceptDeclineAppointmentModel> postAcceptDeclineAppointment (String idAppointment, String statusAppointment) async {
    return 
  }*/
  
}
