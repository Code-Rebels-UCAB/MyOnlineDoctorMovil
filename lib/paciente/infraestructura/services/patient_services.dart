import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:myonlinedoctormovil/paciente/infraestructura/models/patient_model.dart';

class PatientService{
  Future<List<PatientModel>> getPatient() async {
    var response = await http.get(
      Uri.parse(
        "http://127.0.0.1:3000"
      )
    ); // Cambiar por el url de los doctores
    var jsonResponse = convert.jsonDecode(response.body) as List;
    return jsonResponse
        .map((patient) => PatientModel.fromJson(patient))
        .toList();
  }
}