import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myonlinedoctormovil/common/environment.dart';

import '../../../common/infraestructura/authentication/ports/auth_service_abstract.dart';

class MedicalRecordsService {
  final AuthServiceAbstract authToken;

  MedicalRecordsService(this.authToken);

  Future<List<dynamic>> getPatientMedicalRecords() async {
    final token = await authToken.leerToken();
    try{
      var response = await http.get(
        Uri.parse(
          "${SERVER_API}/api/registroMedico/getByPaciente"
        ),
          headers:{
            "Content-type": "application/json",
            'Authorization': 'Bearer $token',
          }
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
    } catch (e) {
      throw Exception('Algo salio mal');
    }
  }
}