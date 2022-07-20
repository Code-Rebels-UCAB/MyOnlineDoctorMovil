import '../models/token_firebase.dart';
import '../puertos/token_paciente_request_abstract.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnviarTokenPaciente implements TokenPacienteRequestAbstract {

  String url = 'http://127.0.0.1:3000';

  Future<void> guardarToken(TokenFirebase tokenPaciente) async {
    try {
      final apiUrl = Uri.parse(url + "/api/paciente/guardar/token");
      final response = await http.patch(apiUrl, body: json.encode({
        'idPaciente':tokenPaciente.idPaciente,
        'tokenF':tokenPaciente.tokenF}) ).timeout(const Duration(seconds: 15));
    } catch (e) {
      throw Exception('Algo salió mal');
      }
  }
}