import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../common/environment.dart';


class PatientService {
  Future<dynamic> getPatient(String idPatient) async {
    var response = await http.get(Uri.parse(
      "${SERVER_API}/api/paciente/user?id=649edad6-0795-4126-9398-f1728b7ef318"
    )); // Cambiar por el url de los doctores
    var jsonResponse = convert.jsonDecode(response.body);

    return jsonResponse;
  }
}
