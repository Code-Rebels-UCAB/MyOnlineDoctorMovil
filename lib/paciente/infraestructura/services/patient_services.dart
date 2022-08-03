import 'package:http/http.dart' as http;
import 'package:myonlinedoctormovil/common/infraestructura/authentication/auth_service.dart';
import 'dart:convert' as convert;

import '../../../common/environment.dart';
import '../../../common/infraestructura/authentication/ports/auth_service_abstract.dart';


class PatientService {
  final AuthServiceAbstract authToken;

  PatientService(this.authToken);

  Future<dynamic> getPatient() async {
    try{
      final token = await authToken.leerToken();
      var response = await http.get(Uri.parse("${SERVER_API}/api/paciente/info"),
          headers:{
            "Content-type": "application/json",
            'Authorization': 'Bearer $token',
          });

      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } catch (e) {
      throw Exception('Algo salio mal');
    }
  }
}
