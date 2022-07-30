import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../common/environment.dart';
import '../puertos/abstract_appointment_service.dart';



//import 'package:myonlinedoctormovil/cita/infraestructura/models/appointments_model.dart';

class AppointmentService implements AbstractAppointmentService {
  @override
  Future getAppointmentsOfPatient(String idPatient) async {
    var response = await http.get(Uri.parse(
      //"http://localhost:3000/api/cita/getcitaspaciente/$idPatient"

      // Alines
        "${SERVER_API}/api/cita/getcitaspaciente/$idPatient"
    ));

    var jsonResponse = json.decode(response.body);

    return List<dynamic>.from(jsonResponse['valor'].map((appointments) => {
      "id_cita": appointments["id_cita"],
      "statuscita": appointments["statuscita"],
      "modalidad": appointments["modalidad"],
      "fechaCita": appointments["fechaCita"],
      "horacita": appointments["horacita"],
      "duracion": appointments["duracion"],
      "id_paciente": appointments["id_paciente"],
      "doctor": appointments["doctor"]
    }));

    //return jsonResponse["valor"].map((appointments) => AppointmentModel.fromJson(appointments)).toList();
  }

  @override
  Future postAppointmentRequest(
      String idPatient, String idDoctor, String modality, String motive) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(
      //'http://localhost:3000/api/cita/solicitarcita'

      // Alines
        '${SERVER_API}/api/cita/solicitarcita'
    ));
    request.body = json.encode({
      "id_paciente": idPatient,
      "id_doctor": idDoctor,
      "modalidad": modality,
      "motivo": motive
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future postAcceptDeclineAppointment(
      String idAppointment, String statusAppointment) async {
    var headers = {'Content-Type': 'application/json'};
    // ignore: prefer_typing_uninitialized_variables
    var request;

    if (statusAppointment == 'Aceptada') {
      request = http.Request('PUT', Uri.parse(
        //'http://localhost:3000/api/cita/aceptarcita?citaId=$idAppointment'

        // Alines
          '${SERVER_API}/api/cita/aceptarcita?citaId=$idAppointment'
      ));
    } else if (statusAppointment == 'Cancelada') {
      request = http.Request('PUT', Uri.parse(
        //'http://localhost:3000/api/cita/cancelarcita?citaId=$idAppointment'

        // Alines
          '${SERVER_API}/api/cita/cancelarcita?citaId=$idAppointment'
      ));
    }

    request.body = json.encode({"citaId": idAppointment});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

