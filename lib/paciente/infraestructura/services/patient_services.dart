import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PatientService {
  Future <dynamic> getPatient(String idPatient) async {
    var response = await http.get(Uri.parse(
      // "http://localhost:3000/api/paciente/user?id:4a2ed3f9-5331-41a7-89e1-c8d1f6d23"

      // Alines 
      "http://10.0.1.12:3005/api/paciente/user?id:4a2ed3f9-5331-41a7-89e1-c8d1f6d23"
    )); // Cambiar por el url de los doctores
    var jsonResponse = convert.jsonDecode(response.body);

    return jsonResponse;
  }
}
