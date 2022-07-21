import '../models/token_firebase.dart';
import '../puertos/token_paciente_request_abstract.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnviarTokenPaciente implements TokenPacienteRequestAbstract {

  String url = 'http://10.0.2.2:3000';

  Future<dynamic> guardarToken(TokenFirebase tokenPaciente) async {
    print('me llaman');
    print(tokenPaciente.idPaciente);
    print(tokenPaciente.tokenF);
    print(json.encode({
      'idPaciente':tokenPaciente.idPaciente,
      'tokenF':tokenPaciente.tokenF}));
    try {
      final apiUrl = Uri.parse(url + "/api/paciente/guardar/token");
      Map<String, String> customHeaders = {
      "content-type": "application/json"
    };
      final response = await http.patch(apiUrl, headers: customHeaders, body: json.encode({
        'idPaciente':tokenPaciente.idPaciente,
        'tokenF':tokenPaciente.tokenF}) ).timeout(const Duration(seconds: 15));
      print(response.statusCode);
      return response.body;
    } catch (e) {
      throw Exception('Algo salió mal');
      }
  }
}