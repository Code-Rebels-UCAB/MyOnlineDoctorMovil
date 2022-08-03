import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myonlinedoctormovil/common/environment.dart';

class MedicalRecordsService {
  Future<List<dynamic>> getPatientMedicalRecords(String idPatient) async {
    var response = await http.get(
      Uri.parse(
        "${SERVER_API}/api/registroMedico/getByPaciente?idPaciente=$idPatient"
      )
    ); 
    var jsonResponse = json.decode(response.body);

    return List<dynamic>.from(jsonResponse['valor'].map((medicalRecords) => {
      "id_registro": medicalRecords["id_registro"],
      "examenes": medicalRecords["examenes"],
      "historia": medicalRecords["historia"],
      "prescripcion": medicalRecords["prescripcion"],
      "plan": medicalRecords["plan"],
      "diagnostico": medicalRecords["diagnostico"],
      "motivo": medicalRecords["motivo"],
      "fechaCita": medicalRecords["fechaCita"],
      "modalidad": medicalRecords["modalidad"],
      "id_doctor": medicalRecords["id_doctor"],
      "nombreDoctor": medicalRecords["nombreDoctor"],
      "sexoDoctor": medicalRecords["sexoDoctor"],
      "id_cita": medicalRecords["id_cita"],
      "id_paciente": medicalRecords["id_paciente"],
      "id_historia": medicalRecords["id_historia"],
    }));
  }
}